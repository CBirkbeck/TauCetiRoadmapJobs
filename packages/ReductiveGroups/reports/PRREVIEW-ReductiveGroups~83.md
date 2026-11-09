# Review of ReductiveGroups (pull request #1797 at 657389a)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/ReductiveGroups/` is byte-identical to `ea37f0f`: 0 lines changed, and `lake-manifest.json` and `lean-toolchain` are also unchanged. All ten findings of the previous review were re-checked against this head, and against the current heads of the open pull requests they name. None is repaired, so each is carried below under its old number. In this report, `README.md` and `Suggested.lean` mean the files in this folder.

## R01 (P2) — rational cohomology and cotensor induction have two owners (IntegralHeckeAndGaloisDeterminants §0.7)

Location: `README.md:17–19` ("Layer 1.1 owns rational cohomology and cotensor induction over flat commutative Hopf algebras"), `:31–33` and `:4339–4340` ("outputs for IntegralHeckeAndGaloisDeterminants §0.7").

Claim: Layer 1.1 is the single owner, and §0.7 consumes it.

Witness: IntegralHeckeAndGaloisDeterminants at #1689 (head 0609cf2, unchanged), *Scope and ownership* (its README :38, :78), says it "owns … rational cohomology of a flat affine group scheme" and that ReductiveGroups' "layers 6A and 10B consume the generic cohomology and induction constructed here".

Repair: settle a single owner. This README's choice is to keep the objects here. Then, in #1689, replace §0.7's paragraphs *Rational cohomology of a flat affine group scheme* and *Algebraic induction* by citations of ReductiveGroups §1.1, and drop the sentence at its :77–78. In this pull request's description, name #1689 as rebasing after it. The alternative is main's direction: main's README consumed §0.7 (its line 222), so Layer 1.1's construction would be deleted here and replaced by a citation of §0.7. Test: `roadmaps grep 'Rational cohomology of a flat affine group scheme'` then finds exactly one construction.

## R02 (P2) — the classical topology on X(ℂ) and its comparisons have two owners (ComplexComparisonPartII C-1.1)

Location: `README.md:19–24` ("Layer 3A.5 owns the comparisons on it (affine charts as open embeddings, functoriality …, fibre products, reduction, and the separated and proper comparisons), the smooth charts"), `:32–33` and `:4340–4345`.

Claim: C-1.1 consumes Layer 3A.5 through the identity on X(ℂ).

Witness: at #848's new head (fcf31bc), §C-1.1 "owns … `complexSchemeAnalytification` … and all the comparisons above": the X(ℂ) topology, fibre products, reduction, smooth charts, separated ⇒ Hausdorff. "ReductiveGroups" and "SchemePointTopology" occur 0 times there.

Repair: settle a single owner of the topology on X(ℂ) and its comparisons. The repair consistent with this README is for C-1.1 to take its underlying space from 3A.5's comparisons on `TauCeti.SchemePointTopology.topology`, cite them, and keep only the parts about the ring sheaf. Name #848 in this pull request's merge-order paragraph. Until #848 changes, `:32–33` and `:4340–4345` misstate its status.

## R03 (P2) — the characteristic-zero Levi decomposition has two owners (AdelicAlgebraicGroups AA.3.1)

Location: `README.md:34–35` ("AdelicAlgebraicGroups AA.3.1 states the characteristic-zero Levi decomposition of Layer 6A again, for closed subgroups, and is a consumer of Layer 6A").

Claim: AA.3.1 consumes Layer 6A.

Witness: AdelicAlgebraicGroups at #792 (head 989a3a7, unchanged), AA.3.1 (its README :2405–2411), defines a Levi decomposition and then, "For `char F = 0` and geometrically connected `P`", proves that one exists ([Borel], §1.13). It does not cite Layer 6A.

Repair: in #792, replace AA.3.1's existence clause by a citation of Layer 6A, `StructureAcceptance.exists_levi_complement`. In characteristic zero, smooth and geometrically connected is exactly 6A's hypothesis (Cartier), so the citation is at the same generality. Name #792 in this pull request's merge-order paragraph.

## R04 (P2) — three headline theorems that can be stated at the pins are absent

Location: `Suggested.lean:51–56` (Layer 3: "the missing carrier is a represented quotient of a nonreduced finite-type group by a normal closed subgroup"), `:57–67` (the Layer 7 list, which neither states nor names the Bruhat decomposition) and `:89–93` (11B: "the missing carrier is the `W`-action on the complexified root-hyperplane complement and its quotient"). The README targets are at `:1941–1944`, `:1037–1043` and `:4067–4072`.

Claim: the Bruhat decomposition is not mentioned, and the other two headlines cannot be stated at the pins.

Witness: the statements below elaborate against the unchanged pins with only `declaration uses sorry` warnings (re-run this round, exit 0). They use only native carriers: `quotientPointsSubgroup`, `IsBorelOverAlgClosed`, `IsMaximalTorus`, `TauCeti.TitsSystem`, `fppfHomogeneousQuotientToCoinvariantsPoints`, `coxeterMatrixOfBase` and `ArtinGroup`.

Repair: state the three headlines, then drop the Layer 3 and 11B sentences from the "Not statable" list and name the new declarations at the three README targets. For Bruhat, the Tits-system form is preferable to a bare double-coset statement. The pinned generic Bruhat API then gives `G(k) = ⨆ B w B` and `B\G/B ≃ W`: `TitsSystem.bruhatCells_eq_iUnion_bruhatCell` (`GroupTheory/TitsSystem/Bruhat/Basic.lean:170`) and `TitsSystem.bruhatCell_injective` (`Bruhat/Uniqueness.lean:35`). This is the form of Milne, Theorem 21.45, which the README already cites. Name `TauCeti.TitsSystem` and the GLₙ instance `glTitsSystem` (`LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean:195`) in the supplier contract. The 11B carriers are a coreflection closure and a subtype quotient, the same kind of definition as the 11A carriers `OrderedPlane` and `UnorderedPlane`.

```lean
theorem exists_titsSystem {k : Type v} [Field k] [IsAlgClosed k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hred : TauCeti.reductiveCommHopfAlgProperty k H) {I J : TauCeti.HopfIdeal k H}
    (hB : TauCeti.HopfIdeal.IsBorelOverAlgClosed k H I)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus k H.obj J) (hTB : I ≤ J) :
    ∃ τ : TauCeti.TitsSystem
        (TauCeti.HopfAlgebra.points (R := k) (H := H.obj) (CommAlgCat.of k k)),
      τ.subgroupB = TauCeti.CommHopfAlgCat.quotientPointsSubgroup H.obj I (CommAlgCat.of k k) ∧
      τ.subgroupN = Subgroup.normalizer (SetLike.coe
        (TauCeti.CommHopfAlgCat.quotientPointsSubgroup H.obj J (CommAlgCat.of k k))) := by
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

These need `variable {ι κ : Type} [Fintype κ]` and the following imports:

- `TauCeti.Algebra.AlgebraicGroup.Borel.Basic`
- `TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Points.Basic`
- `TauCeti.Algebra.AlgebraicGroup.Fppf.Quotient.Homogeneous.Coinvariants`
- `TauCeti.GroupTheory.TitsSystem.Basic`
- `TauCeti.LinearAlgebra.RootSystem.Coxeter.Matrix`
- `TauCeti.GroupTheory.Coxeter.Artin`

The double-coset form of the previous report also elaborates, and is an acceptable alternative.

## R05 (P3) — Lang's theorem: this README calls ReductiveGroupsPartII a consumer, but on main it still claims to be the single owner

Location: `README.md:15–17`, `:28–30` ("ReductiveGroupsPartII RG2.3.7 states Lang's theorem again under its own name; it is a consumer of Layer 7a") and `:2119–2121`.

Claim: there is one owner, Layer 7a.

Witness: `TauCetiRoadmap/ReductiveGroupsPartII/README.md:61–62` on main says that "RG2.3 is the single owner in Tau Ceti of Lang's theorem for connected smooth groups over finite fields". Its RG2.3.7 (`:5201`) states the theorem without citing Layer 7a.

Repair: the matching change in ReductiveGroupsPartII is still owed. Its ownership sentence and RG2.3.7 should cite Layer 7a's `StructureAcceptance.lang_surjective`. Make that change by adding the folder to this pull request, or name it in the merge-order paragraph as a follow-up.

## R06 (P3) — two theorems and one helper definition in `Suggested.lean` are not headline theorems

Location: `Suggested.lean:189–211` (`determinantRelation`, `exists_coordinatePresentation`) and `:251–256` (`permutation_nonsplit`).

Claim: these are headline theorems of the roadmap.

Witness: `README.md:4258–4260` files the SL presentation under *Worked examples*, "Concrete Hopf algebras / group schemes that exercise and validate the definitions". The whole proof of `permutation_nonsplit` is the sentence in its docstring: a lifted transposition would have exponent sum both zero and odd.

Repair: delete the three declarations from `Suggested.lean`, and the matching phrase at `:26–27`. Keep both statements in the README as prose, and remove the backticked names at `README.md:4050` and `:4290–4291`.

## R07 (P3) — the CFSGStatement interface: a renamed 9B item and a milestone that does not exist

Location: `README.md:3299` (`##### 9B.3 Pinned comparison`), `:85–92` (the old → new block) and `:4331` ("its milestone L5 needs constructions rather than existence theorems").

Claim: every identifier that other roadmaps cite is kept or mapped.

Witness: `TauCetiRoadmap/CFSGStatement/README.md:164–166` on main consumes 9B's named item "The isomorphism theorem for pinned groups" (main's ReductiveGroups README, line 1629). At this head that item is §9B.3 *Pinned comparison*. CFSGStatement has Layers 1–6 and no milestone L5.

Repair: add one line to `:85–92`: "the 9B item earlier named *The isomorphism theorem for pinned groups* is §9B.3 *Pinned comparison*". Then replace "its milestone L5" by the consuming section, CFSGStatement Layer 3 (*comparison with every represented model*), or drop the clause.

## R08 (P3) — a Check calls the GL₃(𝔽₂) pair the smallest instance, which holds only by index

Location: `README.md:2563–2565`, "the classical smallest instance of nonconjugate almost-conjugate subgroups".

Witness: in `G=(ℤ/8)ˣ⋉ℤ/8` (order 32), take `H₁={x↦ux}` and `H₂={x, 3x+4, 5x+4, 7x}`. The class of `(u,b)` is `{(u, vb+(1−u)c)}`, so both meet every class equally. `H₂` fixes no point, so it is not conjugate to `H₁`.

Repair: write "the classical instance of smallest index, seven (Perlis); groups of order 32 already carry such pairs, at index eight".

## R09 (P3) — words run together with the number that follows

Location: for example `README.md:1104` "Layers0–1", `:1590` "of6A", `:2727` "the norm2 shell" and `:2731` "at least4".

Witness: a grep for `\b(Layers?|of|rank|norm|least)[0-9]` returns 72 hits. The most frequent tokens are `Layer7` (12), `Layer0` (6), and `rank1`, `norm2`, `Layer5` and `Layer1` (4 each).

Repair: insert the missing spaces ("Layers 0–1", "of 6A", "rank 0").

## R10 (P3) — the pull-request description gives no merge order and misdescribes this folder

Location: the description's ReductiveGroups paragraph, for example "`SpectralWeylTargets.lean` — folded into Suggested.lean section Spectral (63 statements)" and "No statement changes".

Witness: the overlap report lists conflicts with #1332, #1676, #1808 and #1854 (`README.md`, `Suggested.lean`) and #1807 (`README.md`). `Suggested.lean` has no topic `section`, only three namespaces and seven theorems; the README names none of the nine side-file namespaces.

Repair: state the merge order:
- #1807 and #1854 drop their ReductiveGroups hunks on rebase.
- One of #1332, #1676 and #1808 goes first, and the others rebase on it.

Also add #1689, #848 and #792 (R01–R03) and the ReductiveGroupsPartII follow-up (R05), and describe the folder as it now is.

## Previous findings

- R01 — not repaired: `README.md:31–33` still says "IntegralHeckeAndGaloisDeterminants §0.7 states the rational cohomology and induction of Layer 1.1 … each is a consumer of the layer named", and #1689 is unchanged at 0609cf2. Carried as R01.
- R02 — not repaired: `README.md:4340–4342` still says the comparisons "of Layer 3A.5 are outputs for ComplexComparisonPartII C-1.1"; at its new head, fcf31bc, C-1.1 still owns them. Carried as R02.
- R03 — not repaired: `README.md:34–35` still says "AdelicAlgebraicGroups AA.3.1 … is a consumer of Layer 6A"; AA.3.1 at #792 (unchanged) still proves existence itself. Carried as R03.
- R04 — not repaired: `Suggested.lean:55–56` still says "the missing carrier is a represented quotient of a nonreduced finite-type group by a normal closed subgroup", and Bruhat is still absent from `:57–67`. Carried as R04.
- R05 — not repaired: `README.md:29–30` still says "RG2.3.7 states Lang's theorem again under its own name; it is a consumer of Layer 7a"; main's `ReductiveGroupsPartII/README.md:61–62` is unchanged. Carried as R05.
- R06 — not repaired: `Suggested.lean:194` `determinantRelation`, `:199` `exists_coordinatePresentation` and `:253` `permutation_nonsplit` remain. Carried as R06.
- R07 — not repaired: `README.md:4331` still says "its milestone L5 needs constructions rather than existence theorems", and `:85–92` has no line for the renamed 9B item. Carried as R07.
- R08 — not repaired: `README.md:2565` still says "the classical smallest instance of nonconjugate almost-conjugate subgroups". Carried as R08.
- R09 — not repaired: `README.md:1104` still reads "Build this phase on Layers0–1"; 72 such tokens remain. Carried as R09.
- R10 — not repaired: the ReductiveGroups paragraph of the description is unchanged ("folded into Suggested.lean section Spectral (63 statements)"), and the description still states no merge order. Carried as R10.

## Verified sound

**Gate, dependency check and build**

- The worker's gate is all zeros and `OK`.
  - Run here with `--base origin/main`, it fails only on `outside-folder=46`. All 46 files belong to this pull request's own folders: AlgebraicTopology 9, GeometricTopology 30, IntegralLattices 2, QuadraticFormInvariants 3 and LieHighestWeight 2.
  - `git diff --stat origin/main...HEAD` outside the six named folders is empty.
- `gate --depcheck … --movable` prints `depcheck: 238 roadmaps, 2322 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` exits 0. Its only warnings are `declaration uses sorry`, at lines 124, 143, 160, 177, 199, 247 and 253.
- One-tactic probe: on a scratch copy, each `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | trivial | decide | (simp_all; done) | (aesop; done) | sorry`. All seven theorems still report `sorry`.
- `#check @name` for all 14 declarations, in the same scratch file:
  - The binders are all present: `CharZero`, `IsAlgClosed`, `Finite k`, `hsm`, `hconn`, `hred`, `hP`, `hF` and `hn`.
  - The generality equals the README's at `:1708–1714`, `:1931–1934`, `:1959–1966`, `:2166–2171`, `:3996–4001`, `:4050` and `:4290–4292`.
  - Nothing changed since the previous round. The worker's 15th entry, `on`, is a docstring artifact, not a declaration.
- No other roadmap's Lean file declares a `TauCetiRoadmap.ReductiveGroups.*` name. The only other declarations in this namespace are main's and the competing revisions #1332, #1676, #1807, #1808 and #1854 (checked with `roadmaps grep --lean-only`; see R10).

**Changed text this roadmap relies on (the pull request's other folders)**

- IntegralLattices, rewritten at this head:
  - Its README :444 and :452 record `integralForm`, `rationalizationIsometry`, `ofIntegralForm` and `carrierIsometry`.
  - At the pin they are `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:167` and `Rationalization.lean:91, 118, 187`.
  - So `README.md:2725–2727` and `:3519` resolve.
- AlgebraicTopology, changed at this head: its README :7 and :31 keep the based van Kampen theorem, and :37–40 the CW interfaces. So `README.md:4037`, `:4083` and `:4254` resolve.
- QuadraticFormInvariants is not cited by this README.
- LieHighestWeight and GeometricTopology are unchanged since `ea37f0f`.

**Seeded sample, re-opened this round**

- §1.1, `jantzen-1985`:
  - Line 1100 is §2.8, the comodule map (pdf page 41, printed p. 37).
  - Line 1507 is §3.3, induction (printed pp. 52–53).
  - Line 1690 is §3.9 Proposition (b), embedding into injective modules (p. 60).
  - Lines 2102–2105 are §4.14, the Hochschild complex `Cⁿ(G,M)=M⊗k[G]^⊗n` (p. 77).
  - The README's coface order and all three of its Checks were recomputed (see the table).
- §8.1: `conrad-rgs` line 5651 is Definition 5.1.1 on p. 136. Its conditions are a nonempty base, `T≃D_S(M)`, nontrivial weights coming from `M`, and root spaces free of rank one, as stated.
- §8.2: `conrad-rgs` line 7725 is Definition 6.1.1 and line 7738 is Remark 6.1.2, both on p. 186. On a disconnected base, varying `Φ⁺` does not give every Borel subgroup containing `T`. This matches the `Spec(k×k)` Check.

**Library declarations opened at the pins this round**

- `Algebra/AlgebraicGroup/Reductive/Basic.lean:71, 79`: reductive means smooth, geometrically connected, and no nontrivial geometric connected normal smooth unipotent subgroup.
- `HopfIdeal/Points/Basic.lean:180` (`quotientPointsSubgroup`).
- `Fppf/Quotient/Homogeneous/Coinvariants.lean:111`.
- `GroupTheory/TitsSystem/Basic.lean:50`: the axioms are generation, normality of `B∩N` in `N`, generating simple reflections with square in `B∩N`, the cell-product axiom and `sBs⁻¹ ⊄ B`.
- `TitsSystem/Bruhat/Basic.lean:100, 170` and `Bruhat/Uniqueness.lean:35`.
- `LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean:195` (`glTitsSystem`).
- `LinearAlgebra/RootSystem/Coxeter/Matrix.lean:278` and `GroupTheory/Coxeter/Artin.lean:121`.
- `LinearAlgebra/IntegralLattice/Basic.lean:167` and `Rationalization.lean:91, 118, 187`.

**Cross-roadmap citations resolved this round**

- #1689 at 0609cf2: :38, :78, §0.7 at :1145 and :1209.
- #848 at fcf31bc: §C-1.1 at :993–1066.
- #792 at 989a3a7: AA.3.1 at :2405–2411, and :405, which cites ReductiveGroups layers 6–7.
- On main:
  - `ReductiveGroupsPartII/README.md:61–62, 5201`.
  - `CFSGStatement/README.md:162–166`, with Layers 1–6 only and Layer 3 at :318.
  - Main's ReductiveGroups README :222 (consuming §0.7), :342 (C-1.1) and :1629 (the old 9B bullet).
- `roadmaps resolve` reports only the 12 names that `Suggested.lean` itself declares.

**Remark on untouched text (no change requested)**

The Bruhat target at `README.md:1941–1944` cites Milne's Tits-system theorem, but its supplier contract does not name the pinned `TauCeti.TitsSystem` Bruhat API or `glTitsSystem`. R04's repair uses them.

**Adversarial table.** Rows marked "r76" are carried from the previous report; the statements are unchanged. The other rows were recomputed this round.

| Statement | Instances | Values computed (both sides) | Result |
|---|---|---|---|
| §1.1 differential (recomputed) | `H=ℤ[t^±]`, weight-one line | `d⁰(1)=t−1`, which is `1⊗(t−1)`. `d¹(t−1)=t⊗(t−1)−(t⊗t−1⊗1)+(t−1)⊗1`, whose terms cancel to 0 | Pass |
| §1.1 trivial group (recomputed) | `H=ℤ`, `M=ℤ/2` | Cofaces are all `id`. Degree 0: `id−id=0`. Degree 1: `id−id+id=id`. Degree 2: `0`. So `H⁰=ℤ/2`, `H¹=ker id=0`, `H²=M/M=0` | Pass |
| §1.1 "acyclic, not injective" (recomputed) | `2ℤ→ℤ`, `2↦1` | An extension `f` would need `2f(1)=1` in ℤ, which is impossible | Pass |
| §1.1 induction (r76) | unit map `ℤ→ℤ[t^±]`; `C₂⊂S₃` | Weight one gives 0, trivial gives ℤ. Rank 3, and `(C₂(123))⁻¹=(132)C₂` | Pass |
| §8.1 Checks (recomputed) | `SL₂⊗𝔽₂`; SL₂ vs PGL₂ | Centre `𝔽₂[t]/(t²−1)=𝔽₂[t]/(t−1)²` has length 2 and is not smooth. SL₂: `α(diag(t,t⁻¹))=t²`, so `α=2ϖ`. PGL₂: `X=ℤ·(a/b)=ℤα` | Pass |
| §8.2 Checks (recomputed) | `x_α(2t)` over ℚ; ℤ/4; `Spec(k×k)` | Tangent `2E₁₂≠E₁₂`, a different pinning. Over ℤ/4 the tangent is `E₁₂`. Signs `(+,−)` are not constant (Remark 6.1.2) | Pass |
| `exists_levi_complement` (r76) | GL₂; `𝔾_a`; Borel of GL₂ | `J=0`: id is bijective. `J=(t)`: `k→k[t]/(t)=k`. Coinvariants `k[a^±,d^±]`: `J=(b)` bijective, `(a−1)` not injective, `0` misses `b` | Pass |
| same, hypothesis (r76) | `SL₂(W₂)`, char `p` | Smooth, connected, no Levi complement (McNinch (3.2.1)); excluded by `CharZero` | Pass |
| `IsMaximalTorus.exists_conjugate_eq` (r76) | GL₂/k̄; `μ_p×𝔾_m`; `SL₂/ℝ` | `g=u`. The torus `1×𝔾_m` is unique, so `g=1`. Diagonal torus vs `SO₂` is excluded by `IsAlgClosed` | Pass |
| `IsParabolic.exists_levi_complement` (r76) | `P=G`; `B⊂GL₂`; `SL₂(W₂)` | `R_u=1`, `J=0`. `J=(b)` works. The `SL₂(W₂)` case is excluded by `hred` | Pass |
| `lang_surjective` (recomputed) | `𝔾_a/𝔽₂`; `𝔾_m/𝔽_q`; `μ₂`, `q` odd | `g²−g=1` is solved by `θ∈𝔽₄` (`θ²+θ+1=0`). `g^{q−1}=a` is solvable in `K`. `(±1)^{q−1}=1` misses `−1`; excluded by `hconn` | Pass |
| `exists_coordinatePresentation` (r76) | `n=0,1,2` | `det ∅=1`, relation 0, both sides ℤ. `x−1`, both sides ℤ. `[[1,1],[0,1]]⁻¹` over ℤ/4 has entry 3 | Pass (R06) |
| `nonempty_plane_braid` (recomputed) | `n=0,1,2` | Point, and `B₀` trivial. ℂ, `π₁=1=B₁`. `ℂ×ℂ*` via `(z₁+z₂,(z₁−z₂)²)`, `π₁=ℤ=B₂` | Pass |
| `permutation_nonsplit` (r76) | `n=2`; `n=0,1` | A section needs `2m=0` in `B₂≅ℤ`, so `m=0`, which maps to id, not the swap. Trivial `Sₙ` is excluded by `2≤n` | Pass (R06) |
| `permute` direction (recomputed) | `n=3`, `σ=(0 1 2)` | `(σ·z)_i=z_{σ⁻¹i}` gives `(z₀,z₁,z₂)↦(z₂,z₀,z₁)`; the wrong convention gives `(z₁,z₂,z₀)` | Pass |
| 6A Check (r76) | `H¹(𝔾_m, wt 1)` | `a(ts)=a(t)+t a(s)` forces `a=c(t−1)`, a coboundary | Pass |
| 6B Check (r76) | `g=diag(2,1)`, `h=[[0,1],[1,0]]` | `ggᵗ=(gh)(gh)ᵗ=diag(4,1)`, whereas `(gh)ᵗ(gh)=diag(1,4)` | Pass |
| 7C rank one (r76) | general `a,b`; `a=b=1` | `[[1+ab,a],[b,1]]` equals the right-hand side with `c=1+ab`; both sides `[[2,1],[1,1]]` | Pass |
| 7a Checks (r76) | `θ∈𝔽₄`; `{a,−a}`; SL₂ | `θ⁻¹F(θ)=θ`. `a^q=−a`, so no fixed point. `q(q²−1)/(q(q−1))=q+1` | Pass |
| 7b, 7e Checks (r76) | GL₂; GL₂(𝔽₃) | `P∩Q=uTu⁻¹` (dim 2) vs the centre (dim 1). `tw=[[0,2],[1,0]]` and `wt=[[0,1],[2,0]]` | Pass |
| 7f Check (recomputed) | `(ℤ/8)ˣ⋉ℤ/8` | Classes met by `H₁`: `(1,0)` size 1, `(3,·)` 4, `(5,·)` 2, `(7,·)` 4. `H₂` meets each once. Fixed points: of `3x+4`, `{2,6}`; of `5x+4`, the odd `x`; no common point | R08 |
| 9A, 9B, 10C, 10D, 11 Checks (r76) | A3/A4/D4/E6; SL₂; char 3 and 2; `s_a,s_c`; `𝔰𝔩₂` | Folded Cartan matrices `[[2,−2],[−1,2]]`, `[[2,−1],[−2,2]]`, `[[2,−3],[−1,2]]`. `γY³=I`. `(1+bc)/a=d`. `xy` generates `R₂`. `s_a n(−1/(ac))=s_c`. `disc(X²−t²)=4t²` | Pass |
| R04 Tits probe (recomputed) | GL₂; trivial group | `B` upper triangular, `N` monomial, `B∩N=T⊴N`, `W={1,s}`, `s²=I∈T`, `sBs⁻¹` lower triangular `≠B`: 2 cells. Trivial group: `simple=∅`, closure `=⊤` | True |
| R04 Brieskorn probe (r76) | rank 1; `ι=∅` | `ℂ*/±1≅ℂ*` via `z²`, `π₁=ℤ=Artin(A₁)`. Contractible quotient, trivial Artin group | True |
| R04 Layer 3 probe (recomputed) | `μ_p⊂μ_{p²}`, char `p` | Coinvariants `k[s]/(s^p−1)`, `s=t^p`. `O(μ_{p²})` is free over them on `1,…,t^{p−1}`. The group is nonreduced, so the pinned quotient's hypothesis fails | True |

## Not verifiable

- Waterhouse, Borel and Springer are settled as uncertified and are cited by locator only.
- Howlett–Lehrer, Dipper–Du, Carter §1.17, Lang 1956, Steinberg 1968, Serre §§2.3/3.3 and Gassmann are references without locators for specific statements (carried).
- Frenkel–Kac, Gros–Kaneda, Salvetti, Callegaro and Hedén were not opened. No changed passage cites them.
- The manifest key `milne-iag` records the v2.00 notes, whose numbering differs. The README cites and links the 2017 author copy, against which the previous review checked the Milne locators; they were not re-opened this round.
- `TitsSystem/Bruhat/Basic` and `Bruhat/Uniqueness` have no built object files in this worker's cache. Their statements were read in source, not elaborated; the Tits probe imports only `TitsSystem.Basic`.
- Ownership against open pull requests was checked with `roadmaps show` for #1689, #848 and #792, and with `roadmaps grep` for this namespace. The three board packages that are not pull requests (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) were not opened.

## Source issues

- **Misprint** in conrad-rgs at Remark 6.1.2, p. 186: the source writes "it" where the verb "is" is meant, saying the Borel–positive-system correspondence "it not true" on disconnected bases; it should read "that is not true"; affects nothing.
