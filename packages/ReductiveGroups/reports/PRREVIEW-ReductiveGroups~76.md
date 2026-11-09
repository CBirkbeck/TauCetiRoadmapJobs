# Review of ReductiveGroups (pull request #1797 at ea37f0f)

**Verdict:** needs changes

This is a full review. The folder is byte-identical to the head the previous review read, so its one finding is checked below and every passage was reviewed again. Paths: `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ReductiveGroups/…`.

## R01 (P2) — rational cohomology and cotensor induction have two owners (IntegralHeckeAndGaloisDeterminants §0.7)

Location: `README.md:15–19` ("Layer 1.1 owns rational cohomology and cotensor induction over flat commutative Hopf algebras"), `:31–33` and `:4339–4340` (IntegralHeckeAndGaloisDeterminants §0.7 "is a consumer of the layer named").

Claim: Layer 1.1 is the single owner, and §0.7 consumes it.

Witness: the IntegralHeckeAndGaloisDeterminants README at #1689 (head 0609cf2), *Scope and ownership*, "owns … rational cohomology of a flat affine group scheme" and states that ReductiveGroups "layers 6A and 10B consume the generic cohomology and induction constructed here". Its §0.7 constructs both, with the same Checks as §1.1.

Repair: each roadmap hands the object to the other, so there is no single owner. Keep it here: ReductiveGroups is on main, so it precedes every pending roadmap, and main's README consumed §0.7, which this head reverses. In #1689, replace §0.7's *Rational cohomology of a flat affine group scheme* and *Algebraic induction* by citations of ReductiveGroups §1.1, and drop its scope sentence handing them to ReductiveGroups. In this pull request's merge-order paragraph, name #1689 as rebasing after it. Test: a `roadmaps grep` for "Rational cohomology of a flat affine group scheme" should then return one construction.

## R02 (P2) — the classical topology on X(ℂ) and its comparisons have two owners (ComplexComparisonPartII C-1.1)

Location: `README.md:19–24` (Layer 3A.5 "owns the comparisons on it (affine charts as open embeddings, … fibre products, reduction, …), the smooth charts"), `:32–33` and `:4340–4345` (C-1.1 "is a consumer").

Claim: C-1.1 consumes Layer 3A.5 through the identity on X(ℂ).

Witness: the ComplexComparisonPartII README at #848 (head 3cf1bed), §C-1.1: "This roadmap owns … `complexSchemeAnalytification` … and all the comparisons above". Those comparisons are the classical topology on X(ℂ) glued from affine charts, fibre products, reduction, étale local biholomorphisms and smooth charts. The section never mentions ReductiveGroups.

Repair: settle one owner of the topology on X(ℂ) and its comparisons. The repair consistent with this README: C-1.1 takes its underlying space from 3A.5's comparisons on `TauCeti.SchemePointTopology.topology`, cites them, and keeps only the ring-sheaf parts. Name #848 in this pull request's merge-order paragraph. Until #848 changes, `:32–33` and `:4340–4345` misstate its status.

## R03 (P2) — the characteristic-zero Levi decomposition has two owners (AdelicAlgebraicGroups AA.3.1)

Location: `README.md:34–35` ("AdelicAlgebraicGroups AA.3.1 states the characteristic-zero Levi decomposition of Layer 6A again, for closed subgroups, and is a consumer of Layer 6A").

Claim: AA.3.1 consumes Layer 6A.

Witness: the AdelicAlgebraicGroups README at #792 (head 989a3a7), AA.3.1 *Algebraic Levi decompositions*, defines a Levi decomposition and says "For char F = 0 and geometrically connected P, prove that a Levi decomposition exists ([Borel], §1.13)". Its *Needs:* lists Tau Ceti Hopf ideals and quotient points only.

Repair: in #792, replace AA.3.1's existence clause by a citation of Layer 6A, `StructureAcceptance.exists_levi_complement`, and compare its Levi definition with 6A's. Name #792 in this pull request's merge-order paragraph. In characteristic zero, smooth and geometrically connected P is exactly 6A's hypothesis, so the citation is at the same generality.

## R04 (P2) — three headline theorems that can be stated at the pins are absent

Location: the `Suggested.lean` docstring, `:57–67` (Layer 7), `:51–56` (Layer 3) and `:89–96` (Layer 11B). The README targets are at `README.md:1943–1944` (Bruhat), `:1039–1043` (the quotient theorem for nonreduced groups) and `:4069–4094` (11B).

Claim: the Bruhat decomposition is neither stated nor named as unstatable. The docstring says the Layer 3 quotient theorem lacks "a represented quotient of a nonreduced finite-type group", and that 11B lacks "the `W`-action on the complexified root-hyperplane complement and its quotient".

Witness: the three statements below, added to a scratch file importing `Suggested`, elaborate against the pins with only `declaration uses sorry` warnings. They use native `quotientPointsSubgroup`, `IsBorelOverAlgClosed`, `IsMaximalTorus`, `fppfHomogeneousQuotientToCoinvariantsPoints` (any Hopf ideal, any ring), `coxeterMatrixOfBase` and `ArtinGroup`.

Repair: state the three headlines. The 11B carriers are a coreflection closure and a subtype quotient, the same kind of definitions as the 11A carriers `OrderedPlane` and `UnorderedPlane`. A real dot-product pairing pushed through `TauCeti.rootPairingBaseChange ℂ P hP` is an equivalent input.

```lean
theorem bruhat_decomposition {k : Type v} [Field k] [IsAlgClosed k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hred : TauCeti.reductiveCommHopfAlgProperty k H) {I J : TauCeti.HopfIdeal k H}
    (hB : TauCeti.HopfIdeal.IsBorelOverAlgClosed k H I)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus k H.obj J) (hTB : I ≤ J) :
    let B := TauCeti.CommHopfAlgCat.quotientPointsSubgroup H.obj I (CommAlgCat.of k k)
    let T := TauCeti.CommHopfAlgCat.quotientPointsSubgroup H.obj J (CommAlgCat.of k k)
    (∀ g, ∃ n ∈ Subgroup.normalizer (SetLike.coe T),
        g ∈ DoubleCoset.doubleCoset n (SetLike.coe B) (SetLike.coe B)) ∧
    ∀ n ∈ Subgroup.normalizer (SetLike.coe T), ∀ n' ∈ Subgroup.normalizer (SetLike.coe T),
      DoubleCoset.doubleCoset n (SetLike.coe B) (SetLike.coe B) =
        DoubleCoset.doubleCoset n' (SetLike.coe B) (SetLike.coe B) ↔ n⁻¹ * n' ∈ T := by
  sorry

theorem isIso_quotient_of_isNormal {k : Type v} [Field k] {H : _root_.CommHopfAlgCat.{v} k}
    [Algebra.FiniteType k H] (I : TauCeti.HopfIdeal k H) (hI : I.IsNormal) :
    IsIso I.fppfHomogeneousQuotientToCoinvariantsPoints ∧
      I.coinvariants.val.toRingHom.FaithfullyFlat := by
  sorry

def corootWeyl (P : RootPairing ι ℂ (κ → ℂ) (κ → ℂ)) : Subgroup ((κ → ℂ) ≃ₗ[ℂ] (κ → ℂ)) :=
  Subgroup.closure (Set.range P.coreflection)
abbrev RegularSet (P : RootPairing ι ℂ (κ → ℂ) (κ → ℂ)) :=
  {x : κ → ℂ // ∀ i, P.toLinearMap (P.root i) x ≠ 0}
abbrev WeylQuotient (P : RootPairing ι ℂ (κ → ℂ) (κ → ℂ)) :=
  Quotient ((MulAction.orbitRel (corootWeyl P) (κ → ℂ)).comap (Subtype.val : RegularSet P → κ → ℂ))

theorem nonempty_weylQuotient_artin (P : RootPairing ι ℂ (κ → ℂ) (κ → ℂ)) [Finite ι]
    [P.IsCrystallographic] [P.IsReduced] (b : P.Base) (x : RegularSet P) :
    Nonempty (FundamentalGroup (WeylQuotient P) (Quotient.mk _ x) ≃*
      TauCeti.ArtinGroup (TauCeti.coxeterMatrixOfBase P b)) := by
  sorry
```

(These need `variable {ι κ : Type} [Fintype κ]` and imports of `Borel.Basic`, `HopfIdeal.Points.Basic`, `Fppf.Quotient.Homogeneous.Coinvariants`, `LinearAlgebra.RootSystem.Coxeter.Matrix` and `GroupTheory.Coxeter.Artin`.) Then drop the Layer 3 and 11B sentences from the "Not statable" list, and name the new declarations at the three README targets. The values checked on these statements are in the table below.

## R05 (P3) — Lang's theorem: the README calls ReductiveGroupsPartII a consumer, but on main it claims to be the single owner

Location: `README.md:15–16`, `:28–30` ("RG2.3.7 states Lang's theorem again under its own name; it is a consumer of Layer 7a"), `:2119–2121`.

Claim: there is one owner, Layer 7a.

Witness: `TauCetiRoadmap/ReductiveGroupsPartII/README.md:61–62` on main says "RG2.3 is the single owner in Tau Ceti of Lang's theorem for connected smooth groups over finite fields". RG2.3.7 (`:5201`) states it without citing Layer 7a.

Repair: moving Lang's theorem down into Layer 7a correctly breaks the ReductiveGroups ↔ ReductiveGroupsPartII cycle, but the matching change is still owed. ReductiveGroupsPartII's ownership sentence and RG2.3.7 should cite Layer 7a's `StructureAcceptance.lang_surjective`. Make that change by adding the folder to this pull request, or name it as a follow-up in the merge-order paragraph.

## R06 (P3) — two theorems in `Suggested.lean`, with one helper definition, are not headline theorems

Location: `Suggested.lean:189–211` (`determinantRelation` and `exists_coordinatePresentation`) and `:251–256` (`permutation_nonsplit`).

Claim: these are among the roadmap's headline theorems.

Witness: `README.md:4258–4260` files the SL presentation under *Worked examples*, "Concrete Hopf algebras / group schemes that exercise and validate the definitions"; it only removes a redundant determinant localization. The whole proof of `permutation_nonsplit` is its docstring's sentence: a lifted transposition would have exponent sum both zero and odd.

Repair: delete the three declarations from `Suggested.lean` and the corresponding phrase at `:26–27`. Keep both statements in README prose, removing the backticked names at `README.md:4050` and `:4290–4292`.

## R07 (P3) — the CFSGStatement interface: a renamed 9B item and a milestone that does not exist

Location: `README.md:3299` (`##### 9B.3 Pinned comparison`), `:85–92` (old → new block), `:4329–4331` ("its milestone L5 needs constructions").

Claim: identifiers cited by other roadmaps are kept or mapped.

Witness: `TauCetiRoadmap/CFSGStatement/README.md:164–166` on main consumes 9B's named item "The isomorphism theorem for pinned groups". Main's README had that bullet (`:1629`); this head renames it. CFSGStatement has Layers 1–6 and no milestone L5.

Repair: add one line to `:85–92`: "the 9B item earlier named *The isomorphism theorem for pinned groups* is §9B.3 *Pinned comparison*". Replace "its milestone L5" by the consuming section, CFSGStatement Layer 3 (*comparison with every represented model*), or drop the clause.

## R08 (P3) — a Check calls the GL₃(𝔽₂) pair the smallest instance, which holds only by index

Location: `README.md:2563–2565`, "the classical smallest instance of nonconjugate almost-conjugate subgroups".

Witness: take `G = (ℤ/8)ˣ ⋉ ℤ/8` (order 32), `H₁ = {x↦ux}` and `H₂ = {x, 3x+4, 5x+4, 7x}`. The class of `(u,b)` is `{(u, vb+(1−u)c)}`, so each subgroup meets each conjugacy class equally often. `H₂` fixes no point, so it is not conjugate to the point stabilizer `H₁`. The index is 8.

Repair: write "the classical instance of smallest index, seven (Perlis); groups of order 32 already carry such pairs at index eight".

## R09 (P3) — at least 75 words are run together with the number that follows

Location: for example `README.md:1104` "Layers0–1", `:1590` "of6A", "of7C", "Layer5P", `:2070` "rank0", `:2731` "at least4", and `:2058` "Layers2–5". The most frequent tokens are `Layer7` (11 times), `Layer0` (6), `rank1` and `norm2` (4 each).

Witness: a grep for `Layer[0-9]`, `of[0-9]`, `rank[0-9]` and `norm[0-9]` without a space returns at least 75 hits in Layers 1–11.

Repair: insert the missing spaces ("Layers 0–1", "of 6A", "rank 0").

## R10 (P3) — the pull-request description gives no merge order and misdescribes this folder

Location: the description's ReductiveGroups paragraph ("folded into Suggested.lean section IntegralRational … Spectral (63 statements)", "No statement changes").

Witness: the overlap report lists conflicts with #1332, #1676 and #1808 (`README.md` and `Suggested.lean`) and with #1807 and #1854 (`README.md`). `Suggested.lean` has no `section`; it has three namespaces and seven sorried theorems. The 273 deleted side-file statements are not cited anywhere.

Repair: state the order: #1807 and #1854 drop their ReductiveGroups hunk on rebase, and one of #1332, #1676 and #1808 goes first with the others rebasing on it. Add #1689, #848 and #792 (R01–R03) and the ReductiveGroupsPartII follow-up (R05). Describe the folder as it now is. This repeats R01 of the previous review, which no repair report marked as not actionable.

## Previous findings

- R01 (description and merge order): not repaired. The description is unchanged and the folder is byte-identical. It is R10 here.

## Verified sound

**Gate, dependency check, build:**
- The worker's gate is all zeros and `OK`. Run here with `--base origin/main`, it fails only on `outside-folder=45`. All 45 files belong to this pull request's own folders: AlgebraicTopology 9, GeometricTopology 30, IntegralLattices 1, QuadraticFormInvariants 3, LieHighestWeight 2. `git diff --stat` outside the six named folders is empty.
- `gate --depcheck … --movable`: `depcheck: 238 roadmaps, 2324 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean Suggested.lean` exits cleanly in 3 s. The only warnings are `declaration uses sorry` at lines 124, 143, 160, 177, 199, 247 and 253.
- One-tactic probe: each `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | trivial | decide | (simp_all; done) | (aesop; done) | sorry`. All seven still use `sorry`.
- `#check @name` for all 14 declarations. All binders are present (`CharZero`, `IsAlgClosed`, `Finite k`, `hsm`, `hconn`, `hred`, `hP`, `hF`, `hn`). The generality equals the README at `:1708–1714`, `:1931–1934`, `:1959–1966`, `:2166–2171`, `:3996–4001`, `:4050` and `:4290–4292`. The worker's entry `on` at line 98 is a docstring artifact, not a declaration.
- No other roadmap's Lean file declares a `TauCetiRoadmap.ReductiveGroups.*` name (checked with `roadmaps grep --lean-only`).
- No roadmap cites the namespaces of the deleted side files (`BruhatCoordinates`, `ADECoverLifts`, `FoldingADE`, `IntegralRational`, `OrbitGeometry`, `SignedADE`, `Spectral`, `CoverLifts`, `FiniteHC`).

**Seeded sample:**
- §1.1:
  - `jantzen-1985` line 1100 is §2.8, the comodule map, on printed p. 37.
  - Line 1507 is §3.3, induction, on p. 52–53.
  - Line 1690 is §3.9, enough injectives, on p. 60.
  - Lines 2102–2123 are §§4.14–4.15, the Hochschild complex `M⊗k[G]^⊗n`, on pp. 77–78.
  - The cofaces in `README.md:877–879` match Jantzen's.
- §8.1: `conrad-rgs` line 5651 is Definition 5.1.1 on p. 136: a nonempty base, `T ≃ D_S(M)`, constant roots and coroots, and root spaces free of rank one, as stated.
- §8.2: Definition 6.1.1 (line 7725) and Remark 6.1.2 (line 7738), both on p. 186. A positive system determines a unique Borel subgroup, but on a disconnected base some Borel subgroups come from no positive system; this matches the `Spec(k×k)` Check.

**Other locators re-opened:**
- Milne 2017, the author copy the README links at `:4350`: Theorems 17.9 and 17.10 on p. 354, Definitions 17.6 (p. 353) and 17.95 (p. 382), Theorem 17.96 and Corollary 17.97 on p. 383. Forty-five further theorem numbers and pages match, from 1.21 to 23.74.
- `conrad-rgs`: Theorem 3.3.4 (p. 98), Theorem 5.1.13 (p. 143), Corollary 5.3.3 (p. 164), Theorems 6.1.16–6.1.17 (pp. 196–197).
- `conrad-feng`: §12.3 (pp. 126–127), Proposition 12.3.1 (p. 127), Theorem F.3.7 (p. 208), p. 211, Proposition F.5.10 (p. 218), Definition H.1.1 (p. 238).
- `mcninch`: §3.1 on p. 6 (char 0 Levi existence) and (3.2.1) on p. 7 (`SL₂(W₂)` has no Levi decomposition).
- `dudas-michel`: Lemma 7.6 (p. 25), Propositions 8.7 and 8.9 (pp. 31–32), Definition 9.2 (p. 35), Proposition 9.4 (p. 36), Theorem 9.6 (p. 37), Lemmas 9.9–9.11, Theorem 10.1 (p. 41).
- `riche`: §2.9.1 (p. 50) and Remark 1.23 (p. 27).
- `brieskorn`: Proposition 1 on p. 25 (pdf page 6).
- `birman-brendle`: p. 69, Fox–Neuwirth's presentation.
- `fox-neuwirth`: §7. `fadell-neuwirth`: §II.
- `sga1`: Exposé XII, pp. 239–245.

**Library declarations opened at the pins:**
- In Tau Ceti `Algebra/AlgebraicGroup/`:
  - `Torus/Maximal.lean:50` (`IsMaximalTorus`, minimal among torus quotients).
  - `Torus/Conjugation.lean:149` (conjugacy only under `hcontainI`/`hcontainJ`; nowhere is it unconditional).
  - `Borel/Torus.lean:67`, `Borel/Basic.lean:148`.
  - `HopfIdeal/Points/Basic.lean:180`.
  - `DiagonalizableGroup/Normalizer/WeylGroup.lean:93`.
  - `Fppf/Quotient/Homogeneous/Coinvariants.lean:111, 148` and `Fppf/Quotient/Coinvariants.lean:48` (geometric reducedness assumed).
  - `SpecialLinear/Basic.lean:121` ("no polynomial presentation … is asserted here").
- In Tau Ceti outside that folder:
  - `GroupTheory/FixedSubgroup/Lang.lean:76, 96` (right coset `Jn`, as the README says).
  - `GroupTheory/FixedSubgroup/Torus.lean:38` (split-torus Lang–Steinberg; a special case of 9E, not its target).
  - `GroupTheory/SpecificGroups/Braid/Basic.lean:99, 358` (`BraidGroup 0 = ArtinGroup (A 0)` is trivial).
  - `GroupTheory/Coxeter/Artin.lean:121, 226`.
  - `LinearAlgebra/RootSystem/Coxeter/Matrix.lean:278`.
  - `LinearAlgebra/RootSystem/BaseChange/Pi.lean:127`.
- In Mathlib:
  - `RepresentationTheory/FiniteIndex.lean:38–39, 112, 178, 198` (the `DecidableRel`, `FiniteIndex` and `Rep.{max w u v}` hypotheses that 7c states).
  - `GroupTheory/DoubleCoset.lean:37`.
  - `Algebra/Group/Subgroup/Defs.lean:663`.
- `roadmaps resolve` reports only the 12 names that `Suggested.lean` itself declares.

**Cross-roadmap citations resolved:**
- On main:
  - SchemeAndStackFoundations §§0.3, 0.7, 0.8, 1.1, 1.5, 1.13–1.15, 2.6, 4.12.
  - ModularCurves §§0E–0F, also at the head of #1808.
  - RootSystems §§2.1, 3.1, Layers 1–3.
  - LieGroups Layers 2, 7, 8.
  - InductionRestriction Layer 2.1.
  - GroebnerGeometry G5.
  - SmoothBundlesConnections B1.0, B1.1, B1.4.
  - DGFloer Layer 1 item 2.
  - ReflectionInvariantTheory, AlgebraicVectorBundles.
- At this pull request's head: LieHighestWeight Layers 3, 4, 7.
- Consumers at their heads:
  - FormalConnectionsOpers (#1056) cites 3A.5 and 6B.
  - RootSystemsPartII (#1731) cites §9A.1b.
  - GroupSchemesOverABase (#1522) cites the old Layer 8 bullet, which `:85–89` maps to 9D.
  - SchubertGeometry cites Layer 7.

**Adversarial table**

| Statement | Instances | Values computed (both sides) | Result |
|---|---|---|---|
| `exists_levi_complement` (6A) | GL₂ (`U=1`); `𝔾_a` (`Q=1`); Borel of GL₂ | `J=0`: id bijective. `J=(t)`: `k → k[t]/(t) = k`. Coinvariants `k[a^±,d^±]`: `J=(b)` bijective, `J=(a−1)` not injective, `J=0` misses `b` | Pass |
| same, hypotheses | `SL₂(W₂)`, char `p` | smooth and connected with reductive quotient, but no Levi (McNinch (3.2.1)); excluded by `CharZero` | Pass |
| `IsMaximalTorus.exists_conjugate_eq` | GL₂/k̄ with `T`, `uTu⁻¹`; `μ_p×𝔾_m`; constant `S₃`; `SL₂/ℝ` | `g=u`. Torus quotient is reduced, so `1×𝔾_m` is unique and `g=1`. Torus is trivial. Diagonal torus vs `SO₂`: unbounded vs compact, excluded by `IsAlgClosed` | Pass |
| `IsParabolic.exists_levi_complement` | `P=G`; `P=B⊂GL₂`; `SL₂(W₂)` | `R_{u,k}=1`, `J=0`. `J=(b)` yes, `(a−1)` and `0` no. Parabolic in itself without a Levi; excluded by `hred` | Pass |
| `lang_surjective` | `𝔾_a/𝔽₂`; `𝔾_m/𝔽_q`; `μ₂` with `q` odd; constant `C₂`; `μ_p` | `θ²−θ=1` for `θ∈𝔽₄`. `g^{q−1}=a` is solvable in `K`. `(±1)^{q−1}=1` misses `−1`, excluded by `hconn`. Lang value always `1`, excluded. `G(K)={1}`, so `hsm` is not needed for truth (a note, not a finding) | Pass |
| `exists_coordinatePresentation` | `n=0,1,2` | `det ∅ = 1`, relation 0, both sides ℤ. `x−1`, both sides ℤ. `[[1,1],[0,1]]⁻¹` over ℤ/4 has entry 3 | Pass (R06) |
| `nonempty_plane_braid` | `n=0,1,2` | point, `A 0` trivial. ℂ, `π₁=1`. `ℂ×ℂ*`, `π₁=ℤ=A(1)` | Pass |
| `permutation_nonsplit` | `n=2`; `n=0,1` | A section needs `2m=0`, so `m=0` is even and maps to id, not the swap. Trivial `S_n` is excluded by `2≤n` | Pass (R06) |
| `permute` direction | `n=3`, `σ=(012)` | `(0,1,2)↦(2,0,1)`; the wrong convention gives `(1,2,0)` | Pass |
| §1.1 complex | `ℤ[t^±]` weight one; trivial group with `ℤ/2` | `d⁰(1)=1⊗(t−1)`. `d¹ = t⊗(t−1) − (t⊗t−1⊗1) + (t−1)⊗1 = 0`. Differentials `0, id, 0`: `H⁰=ℤ/2`, `H¹=H²=0` | Pass |
| §1.1 induction | unit map `ℤ→ℤ[t^±]`; `C₂⊂S₃` | Weight one gives 0, trivial gives ℤ. Rank 3, and `(C₂(123))⁻¹=(132)C₂` | Pass |
| §8.1 Checks | `SL₂⊗𝔽₂`; SL₂ vs PGL₂ | Centre `𝔽₂[t]/(t−1)²` has length 2. Root `2e`, vs a root that generates `X` | Pass |
| §8.2 Checks | `x_α(2t)`; `Spec(k×k)` | Tangent `2E₁₂`. Signs `(+,−)` are not constant (Remark 6.1.2) | Pass |
| 6A Check | `H¹(𝔾_m, wt 1)` | `a(ts)=a(t)+t a(s)` forces `a₀=−a₁`, so `a=c(t−1)` is a coboundary | Pass |
| 6B Check | `g=diag(2,1)`, `h=[[0,1],[1,0]]` | `ggᵗ=(gh)(gh)ᵗ=diag(4,1)`, whereas `(gh)ᵗ(gh)=diag(1,4)` | Pass |
| 7C rank one | general `a,b`; `a=b=1` | `[[1+ab,a],[b,1]]` equals the right-hand side with `c=1+ab`. Both sides `[[2,1],[1,1]]`. For `A₂`, `w=s₁s₂` gives `A_w={α₂}` | Pass |
| 7a Checks | `θ∈𝔽₄`; `{a,−a}`; SL₂ | `θ⁻¹F(θ)=θ`, `θF(θ)⁻¹=θ²`, `u(θ²−θ)=u(1)`. `a^q=−a`, so no fixed point. `q(q²−1)/(q(q−1))=q+1` | Pass |
| 7b Check | GL₂, `u=[[1,1],[0,1]]` | `P∩Q=uTu⁻¹` (dim 2) vs `(L∩M)⋉1` = centre (dim 1) | Pass |
| 7e Check | GL₂(𝔽₃) | `tw=[[0,2],[1,0]]` and `wt=[[0,1],[2,0]]`: second columns `(2,0)` and `(1,0)` | Pass |
| 7f Checks | `S₃`, `g=(12)`; GL₃(𝔽₂) | `1·2 = 2·1`. A smaller-order pair exists (order 32, index 8) | R08 |
| 9A folding | A3, A4, D4; E6 | `[[2,−2],[−1,2]]`, `[[2,−1],[−2,2]]`, `[[2,−3],[−1,2]]` from `C_(O,P)=c_OΣB`. D4: `12+2=14`. E6: `48+4=52` | Pass |
| 9A full Y | `γY=[[0,−1],[1,−1]]` | `γY³=I`, `det(γY−I)=3`; `(1,−1)` is fixed mod 3 | Pass |
| 9B Checks | SL₂ `Ω=D(a)`; `[[2,1],[3,2]]`; ℤ/4; B₂ | `(1+bc)/a=d`. Determinant 1 with no unit entry. The Weyl word is `[[0,1],[3,0]]`. `(τ*)²=2` | Pass |
| 10C Checks | char 3, `n=4`; char 2, `n=2` | `L(1)⊗L(1)^{[1]}` is spanned by `x⁴,x³y,xy³,y⁴`. `xy` generates `R₂` | Pass |
| 10D torsor | `s_a`, `s_c` | `s_a n(−1/(ac)) = s_c`, `u_c=u_a+1/(ac)` | Pass |
| 11 Checks | `𝔰𝔩₂` | `disc(X²−t²)=4t²`; the lift of `e^{2πis}` ends at `−1` | Pass |
| R04 Bruhat probe | GL₂ | 2 cells. `n=w`, `n'=wt` give `n⁻¹n'=t∈T`; `n=1`, `n'=w` give different cells | True |
| R04 Brieskorn probe | rank 1; `ι=∅` | `ℂ*/±1≅ℂ*`, `π₁=ℤ=Artin(A₁)`. Contractible quotient, trivial Artin group | True |
| R04 Layer 3 probe | `μ_p⊂μ_{p²}` (nonreduced) | Coinvariants `k[t^p]/(t^{p²}−1)`; `O(μ_{p²})` is free of rank `p` over them | True |

## Not verifiable

- Waterhouse, Borel and Springer are settled as uncertified and cited by locator only.
- Howlett–Lehrer, Dipper–Du, Carter §1.17, Lang 1956, Steinberg 1968, Serre §§2.3/3.3 and Gassmann are references without locators for specific statements.
- Frenkel–Kac, Gros–Kaneda, Salvetti, Callegaro and Hedén were not opened this round.
- The manifest key `milne-iag` records the v2.00 notes (iAG200), whose numbering differs. The README cites and links the 2017 author copy, against which every Milne locator above was checked. Re-pointing the key is a manifest change for the worker, not a README defect.
- Ownership was checked against the open pull requests through `roadmaps show` and `grep`: #1689, #848, #792, #1056, #1522, #1224, #1492, #1731 and #1808. It was not checked against board packages that are not pull requests.

## Source issues

- **Misprint** in milne-iag (2017 author copy) at the remark after Corollary 17.97, p. 383: the source says the Lang map of `μ_n`, `n=q−1`, is trivial "for all x", although the formula's variable is `g`; it should be "for all g ∈ μ_n(kᵃ)"; affects nothing.
- **Misprint** in conrad-rgs at Remark 6.1.2, p. 186: the source says "but that it not true"; it should be "but that is not true"; affects nothing.
