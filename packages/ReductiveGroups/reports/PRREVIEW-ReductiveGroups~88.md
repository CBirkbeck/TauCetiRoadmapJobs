# Review of ReductiveGroups (pull request #1797 at 388ed01)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/ReductiveGroups/` is byte-identical to `657389a`: 0 lines changed. `lake-manifest.json` and `lean-toolchain` are also unchanged. Since `657389a`, only `QuadraticFormInvariants` and `RepresentationTheory/LieHighestWeight` changed.

- This README does not cite QuadraticFormInvariants.
- It cites LieHighestWeight Layers 3–4 and 7 six times. All six still resolve at this head (see *Verified sound*).

None of the ten previous findings is repaired. R02 is partly repaired on the other side, by #848's new head. Each finding is carried below under its old number. In this report, `README.md` and `Suggested.lean` mean the files in this folder.

## R01 (P2) — rational cohomology and cotensor induction have two owners (IntegralHeckeAndGaloisDeterminants §0.7)

Location: `README.md:17–19` ("Layer 1.1 owns rational cohomology and cotensor induction over flat commutative Hopf algebras"), `:31–33` and `:4339–4340` ("outputs for IntegralHeckeAndGaloisDeterminants §0.7").

Claim: Layer 1.1 is the single owner, and §0.7 consumes it.

Witness: IntegralHeckeAndGaloisDeterminants at #1689 (head 0609cf2, unchanged) still says it "owns … rational cohomology of a flat affine group scheme" (README :37). It also says ReductiveGroups' "layers 6A and 10B consume the generic cohomology and induction constructed here" (:77).

Repair: settle a single owner. This README's choice is to keep the objects here. Then, in #1689:
- replace §0.7's paragraphs *Rational cohomology of a flat affine group scheme* and *Algebraic induction* by citations of ReductiveGroups §1.1;
- drop the sentence at its :76–77.

In this pull request's description, name #1689 as rebasing after it.

The alternative is main's direction: main's README consumed §0.7, so Layer 1.1's construction would be deleted here and replaced by a citation of §0.7.

Test: `roadmaps grep 'Rational cohomology of a flat affine group scheme'` finds exactly one construction.

## R02 (P2) — the classical topology on X(ℂ) and its general-scheme comparisons have two owners (ComplexComparisonPartII C-1.1)

Location: `README.md:19–24` ("Layer 3A.5 owns the comparisons on it (affine charts as open embeddings, functoriality …, fibre products, reduction, and the separated and proper comparisons), the smooth charts"), `:32–33` and `:4340–4345`.

Claim: C-1.1 consumes Layer 3A.5 through the identity on X(ℂ).

Witness: #848's head moved from fcf31bc to c7c7c50, and C-1.1 now cedes only the case of smooth affine groups to §3A.5 (its README :1066–1069, :785–788). For every locally finite-type complex scheme, C-1.1 still "owns … `complexSchemeAnalytification` … and all the comparisons above" (:1056–1057). Those comparisons are:
- the classical topology on X(ℂ);
- fibre products and reduction;
- smooth charts;
- separated ⇒ Hausdorff, and the finite and proper comparisons.

`SchemePointTopology` occurs 0 times in #848.

Repair: C-1.1 should take its underlying space for every locally finite-type scheme from 3A.5's comparisons on `TauCeti.SchemePointTopology.topology`, cite them, and keep the ring-sheaf parts. Name #848 in this pull request's merge-order paragraph. Until then, `:32–33` ("C-1.1 states the complex-point comparisons and smooth charts of Layer 3A.5; each is a consumer") overstates #848's position.

## R03 (P2) — the characteristic-zero Levi decomposition has two owners (AdelicAlgebraicGroups AA.3.1)

Location: `README.md:34–35` ("AdelicAlgebraicGroups AA.3.1 states the characteristic-zero Levi decomposition of Layer 6A again, for closed subgroups, and is a consumer of Layer 6A").

Claim: AA.3.1 consumes Layer 6A.

Witness: AdelicAlgebraicGroups at #792 (head 989a3a7, unchanged), AA.3.1 (its README :2402–2410): "For `char F = 0` and geometrically connected `P`, prove that a Levi decomposition exists ([Borel], §1.13)". It does not cite Layer 6A.

Repair: in #792, replace AA.3.1's existence clause by a citation of Layer 6A, `StructureAcceptance.exists_levi_complement`. The citation is at the same generality: in characteristic zero, smooth and geometrically connected is exactly 6A's hypothesis (Cartier). Name #792 in this pull request's merge-order paragraph.

## R04 (P2) — three headline theorems that can be stated at the pins are absent

Location:
- `Suggested.lean:51–56` (Layer 3): "the missing carrier is a represented quotient of a nonreduced finite-type group by a normal closed subgroup";
- `:57–67`: the Layer 7 list, which neither states nor names the Bruhat decomposition;
- `:89–93` (11B): "the missing carrier is the `W`-action on the complexified root-hyperplane complement and its quotient".

The README targets are at `:1941–1944`, `:1037–1043` and `:4067–4072`.

Claim: the Bruhat decomposition is not mentioned, and the other two headlines cannot be stated at the pins.

Witness: the three statements of the previous report elaborate against the unchanged pins. Re-run this round in a scratch file, they exit 0 with only `declaration uses sorry` at their lines 15, 27 and 40. They are `exists_titsSystem`, `isIso_quotient_of_isNormal`, and `nonempty_weylQuotient_artin` with its carriers `corootWeyl`, `RegularSet` and `WeylQuotient`. Their imports are:
- `TauCeti.Algebra.AlgebraicGroup.Borel.Basic`
- `TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Points.Basic`
- `TauCeti.Algebra.AlgebraicGroup.Fppf.Quotient.Homogeneous.Coinvariants`
- `TauCeti.GroupTheory.TitsSystem.Basic`
- `TauCeti.LinearAlgebra.RootSystem.Coxeter.Matrix`
- `TauCeti.GroupTheory.Coxeter.Artin`

Repair:
1. State the three headlines verbatim as in the previous report's R04 block. They need `variable {ι κ : Type} [Fintype κ]`.
2. Drop the Layer 3 and 11B sentences from the "not statable" list.
3. Name the new declarations at the three README targets.
4. Name `TauCeti.TitsSystem`, `TitsSystem.bruhatCells_eq_iUnion_bruhatCell` (`GroupTheory/TitsSystem/Bruhat/Basic.lean:170`), `TitsSystem.bruhatCell_injective` (`Bruhat/Uniqueness.lean:35`) and `glTitsSystem` (`LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean:195`) in the Tau Ceti supplier contract. Through them, the Tits-system form yields `G(k)=⨆ BwB` and `B\G/B ≃ W`, which is Milne's Theorem 21.45 that the README already cites.

## R05 (P3) — Lang's theorem: this README calls ReductiveGroupsPartII a consumer, but on main it still claims to be the single owner

Location: `README.md:15–17`, `:28–30` ("ReductiveGroupsPartII RG2.3.7 states Lang's theorem again under its own name; it is a consumer of Layer 7a") and `:2119–2121`.

Claim: there is one owner, Layer 7a.

Witness: on main (c44dcc8), `TauCetiRoadmap/ReductiveGroupsPartII/README.md:61–62` says "RG2.3 is the single owner in Tau Ceti of Lang's theorem for connected smooth groups over finite fields". Its RG2.3.7 (`:5203–5215`) states the theorem as `Lang.lang_surjective` without citing Layer 7a.

Repair: in ReductiveGroupsPartII, make the ownership sentence and RG2.3.7 cite Layer 7a's `StructureAcceptance.lang_surjective`. Either add that folder to this pull request, or name the change in the merge-order paragraph as a follow-up.

## R06 (P3) — two theorems and one helper definition in `Suggested.lean` are not headline theorems

Location: `Suggested.lean:189–211` (`determinantRelation`, `exists_coordinatePresentation`) and `:251–256` (`permutation_nonsplit`).

Claim: these are headline theorems of the roadmap.

Witness:
- `README.md:4258–4260` files the SL presentation under *Worked examples*, as one of the examples that "exercise and validate the definitions".
- The whole proof of `permutation_nonsplit` is its docstring's one sentence: a lifted transposition would have exponent sum both zero and odd.

Repair:
- Delete the three declarations from `Suggested.lean`, and the matching phrase at `:26–27`.
- Keep both statements in the README as prose.
- Remove the backticked names at `README.md:4050` and `:4290–4291`.

## R07 (P3) — the CFSGStatement interface: a renamed 9B item and a milestone that does not exist

Location: `README.md:3299` (`##### 9B.3 Pinned comparison`), `:85–92` (the old → new block) and `:4331` ("its milestone L5 needs constructions rather than existence theorems").

Claim: every identifier that other roadmaps cite is kept or mapped.

Witness:
- `TauCetiRoadmap/CFSGStatement/README.md:164–166` on main consumes 9B's named item "The isomorphism theorem for pinned groups". At this head that item is §9B.3 *Pinned comparison*.
- CFSGStatement has Layers 1–6 (`:195–478`) and no milestone L5.

Repair:
- Add one line to `:85–92`: "the 9B item earlier named *The isomorphism theorem for pinned groups* is §9B.3 *Pinned comparison*".
- Replace "its milestone L5" by the consuming section, CFSGStatement Layer 3 (*comparison with every represented model*), or drop the clause.

## R08 (P3) — a Check calls the GL₃(𝔽₂) pair the smallest instance, which holds only by index

Location: `README.md:2563–2565`, "the classical smallest instance of nonconjugate almost-conjugate subgroups".

Witness: in `G=(ℤ/8)ˣ⋉ℤ/8` (order 32), take `H₁={x↦ux}` and `H₂={x, 3x+4, 5x+4, 7x}`. The class of `(u,b)` is `{(u, vb+(1−u)c)}`, so both subgroups meet every class equally. `H₂` fixes no point, so it is not conjugate to `H₁`.

Repair: write "the classical instance of smallest index, seven (Perlis); groups of order 32 already carry such pairs, at index eight".

## R09 (P3) — words run together with the number that follows

Location: for example `README.md:1104` "Layers0–1", `:1590` "of6A", `:2727` "the norm2 shell", `:2731` "at least4", and `:2811`, `:3004` "LieHighestWeight Layer7".

Witness: `grep -oE '\b(Layers?|of|rank|norm|least)[0-9]'` still returns 72 hits at this head.

Repair: insert the missing spaces ("Layers 0–1", "of 6A", "Layer 7").

## R10 (P3) — the pull-request description gives no merge order and misdescribes this folder

Location: the description's ReductiveGroups paragraph, unchanged. For example: "`SpectralWeylTargets.lean` — folded into Suggested.lean section Spectral (63 statements)" and "No statement changes".

Witness:
- The overlap report lists conflicts with #1332, #1676, #1808 and #1854 (`README.md`, `Suggested.lean`) and with #1807 (`README.md`).
- `Suggested.lean` has no topic `section`. It has only `@[expose] public section`, three namespaces and seven theorems.

Repair: state the merge order:
- #1807 and #1854 drop their ReductiveGroups hunks on rebase.
- One of #1332, #1676 and #1808 goes first, and the others rebase on it.

Also add #1689, #848 and #792 (R01–R03) and the ReductiveGroupsPartII follow-up (R05), and describe the folder as it now is.

## Previous findings

- R01 — not repaired: `README.md:31–33` still says "IntegralHeckeAndGaloisDeterminants §0.7 states the rational cohomology and induction of Layer 1.1 … each is a consumer of the layer named". #1689 is unchanged at 0609cf2. Carried as R01.
- R02 — partly repaired: #848's new head c7c7c50 now cites §3A.5 for smooth affine groups. For general schemes, C-1.1 still "owns … all the comparisons above", and `README.md:32–33` is unchanged. Carried as R02.
- R03 — not repaired: `README.md:34–35` still says "AdelicAlgebraicGroups AA.3.1 … is a consumer of Layer 6A". AA.3.1 at #792 (989a3a7, unchanged) still proves existence itself. Carried as R03.
- R04 — not repaired: `Suggested.lean:55–56` still says "the missing carrier is a represented quotient of a nonreduced finite-type group by a normal closed subgroup", and Bruhat is still absent from `:57–67`. Carried as R04.
- R05 — not repaired: `README.md:29–30` still says "RG2.3.7 states Lang's theorem again under its own name; it is a consumer of Layer 7a". Main's `ReductiveGroupsPartII/README.md:61–62` is unchanged. Carried as R05.
- R06 — not repaired: `Suggested.lean:194` `determinantRelation`, `:199` `exists_coordinatePresentation` and `:253` `permutation_nonsplit` remain. Carried as R06.
- R07 — not repaired: `README.md:4331` still says "its milestone L5 needs constructions rather than existence theorems", and `:85–92` has no line for the renamed 9B item. Carried as R07.
- R08 — not repaired: `README.md:2565` still says "the classical smallest instance of nonconjugate almost-conjugate subgroups". Carried as R08.
- R09 — not repaired: `README.md:1104` still reads "Build this phase on Layers0–1"; 72 such tokens remain. Carried as R09.
- R10 — not repaired: the ReductiveGroups paragraph of the description is unchanged ("folded into Suggested.lean section Spectral (63 statements)"), and it still states no merge order. Carried as R10.

## Verified sound

**Gate, dependency check and build**

- The worker's gate is all zeros and `OK`, including `build=0`.
- Run here with `--base origin/main` (c44dcc8), the gate fails only on `outside-folder=47`. All 47 files belong to this pull request's own folders:
  - AlgebraicTopology 9;
  - GeometricTopology 30;
  - IntegralLattices 2;
  - QuadraticFormInvariants 3;
  - LieHighestWeight 3.
- `git diff --stat origin/main...HEAD` outside the six named folders is empty.
- `gate --depcheck … --movable` prints `depcheck: 239 roadmaps, 2325 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` exits 0. Its only warnings are `declaration uses sorry`, at lines 124, 143, 160, 177, 199, 247 and 253.
- One-tactic probe on a scratch copy: each `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | trivial | decide | (simp_all; done) | (aesop; done) | sorry`. The copy elaborates, and all seven theorems still report `sorry`.

**Signatures**

- `#check @name` was run for all 14 declarations in one scratch file.
- The binders are present: `CharZero`, `IsAlgClosed`, `Finite k`, the smoothness and geometric-connectedness hypotheses, `reductiveCommHopfAlgProperty`, `IsParabolic`, `F a = a ^ Nat.card k` and `2 ≤ n`.
- The elaborated types are identical to the previous round's, and their generality equals the README's at `:1708–1714`, `:1931–1934`, `:1959–1966`, `:2166–2171`, `:3996–4001`, `:4050` and `:4290–4292`.
- The worker's 15th entry, `on`, is a docstring artifact, not a declaration.

**Duplication of names**

No other roadmap's Lean file declares a `TauCetiRoadmap.ReductiveGroups.*` name (`roadmaps grep --lean-only`). The hits are main's own file and the competing revisions of this folder: #1332, #1676, #1807, #1808 and #1854 (R10).

**The changed LieHighestWeight text this README cites**

- `:2810–2813` cites Layer 7 for the split-field Serre presentation and injectivity. At this head, Layer 7 (its README :1077–1121) still owns `serreLift_injective_of_base` (Serre's theorem, Humphreys §18.3). That name occurs nowhere in the pinned Tau Ceti, so the README's "the native pinned Serre map alone supplies no injectivity theorem" is accurate. `TauCeti.exists_isSerreSystem_of_base` is at `Algebra/Lie/Presentation/Serre/Killing.lean:196`.
- `:3001–3004` and `:3084` cite Layer 7's transpose convention. Layer 7 gives `A i j = αᵢ(hⱼ)` and `IsSerreSystem K base.cartanMatrix.transpose`. This was checked at the pin:
  - Mathlib's `cartanMatrixIn` is `P.pairingIn S i j` (`LinearAlgebra/RootSystem/CartanMatrix.lean:53–55`);
  - `pairing i j = root' i (coroot j)` (`Defs.lean:195`);
  - Serre's `HE` is `⁅H i, E j⁆ − CM i j • E j` (`Algebra/Lie/SerreConstruction.lean:101–102`);
  - so the H-row matrix is the transpose. See the B₂ row of the table.
- `:3210–3212` and `:3972` cite Layers 3–4. Layer 4 now consumes the native `TauCeti.finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector` (`Algebra/Lie/HighestWeight/FiniteDimensional.lean:122`) and `existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible` (`Existence.lean:234`). The citation resolves.
- `:4127–4128` cites Layer 7's Lie Chevalley restriction. Layer 7 now consumes the native `LieSubalgebra.lieChevalleyRestrictionIso` (`Algebra/Lie/HighestWeight/ChevalleyRestriction.lean:151`). Its hypotheses are `CharZero`, `IsKilling`, a Cartan subalgebra and `IsAlgClosed K` (`:61–62`, `:101–108`). These match the README's use "only to the Killing-semisimple summand" over ℂ.
- LieHighestWeight does not cite ReductiveGroups, so there is no cycle. Its Layer 8 does not fold or build integral forms, so it does not duplicate 9A.

**Other folders of this pull request**

- QuadraticFormInvariants is not cited by this README.
- AlgebraicTopology, GeometricTopology and IntegralLattices are unchanged since `657389a`. Their citations at `README.md:2725–2727`, `:3519`, `:4037`, `:4083` and `:4254` were resolved in the previous round.

**Seeded sample, re-opened this round** (no changed passage falls in it)

- §1.1:
  - `jantzen-1985` line 1100 is §2.8 on pdf page 41 (printed 37);
  - line 1690 is §3.9 Proposition (b) on pdf page 65 (printed 60), matching the README's "§3.9, p. 60";
  - lines 2102–2105 are §4.14, the Hochschild complex `Cⁿ(G,M)=M⊗k[G]^⊗n`, on pdf page 82 (printed 77).
- §8.1: `conrad-rgs` line 5651 is Definition 5.1.1 on p. 136, with a non-empty base and `T≃D_S(M)` for a finite free M, as stated.
- §8.2: `conrad-rgs` line 7725 is Definition 6.1.1 and line 7738 Remark 6.1.2, both on p. 186. On a disconnected base, a choice of `Φ⁺` does not amount to a Borel containing T. This matches the README's component-wise pinning.

**Cross-roadmap citations resolved this round**

Line numbers are those of each README.

- #1689 at 0609cf2: :37, :76–77, and §0.7 at :1144.
- #848 at c7c7c50 (new head): C-1.1 at :996–1069 and its ReductiveGroups contract at :785–788.
- #792 at 989a3a7: AA.3.1 at :2402–2410.
- Main at c44dcc8:
  - `ReductiveGroupsPartII/README.md:61–62, 5201–5215`;
  - `CFSGStatement/README.md:162–166`, with Layers 1–6 at `:195–478`.
- `roadmaps resolve` reports only the 12 names that `Suggested.lean` itself declares.
- The closest open roadmap in vocabulary, #1522 GroupSchemesOverABase (head 9265182), cites ReductiveGroups Layers 3, 6, 7, 9B and 9D and §§8.1–8.2 as a consumer. It claims none of them, so there is no second owner on this side.

**Remarks on untouched text (no change requested)**

- The supplier contract does not name the Bruhat API (`TauCeti.TitsSystem`, `glTitsSystem`) that the Bruhat target at `:1941–1944` would use. R04's repair adds them.
- The contract could name directly the two natives now consumed through LieHighestWeight: `LieSubalgebra.lieChevalleyRestrictionIso` (used at `:4127`) and `TauCeti.finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector` (used at `:3210`).

**Adversarial table.** No statement of this folder changed. Rows marked "r83" are carried from the previous report (`PRREVIEW-ReductiveGroups~83.md`). The other rows were recomputed this round, including those for the changed supplier text this README relies on.

| Statement | Instances | Values computed (both sides) | Result |
|---|---|---|---|
| §1.1 differential (r83) | `H=ℤ[t^±]`, weight-one line | `d⁰(1)=t−1`, which is `1⊗(t−1)`; `d¹` of it cancels to 0 | Pass |
| §1.1 trivial group (recomputed) | `H=ℤ`, `M=ℤ/2` | Cofaces are all `id`. Alternating sums are `0`, `id`, `0`, so `H⁰=ℤ/2`, `H¹=ker id=0` and `H²=0` | Pass |
| §1.1 action Checks (recomputed) | 𝔾_m weight-one line, ℚˣ | 2 acts by `m↦2m`. Applying 3 after 2 gives `6m`, the action of 6. 1 acts by `id`; the zero action would give 0 | Pass |
| §1.1 "acyclic, not injective" (r83) | `2ℤ→ℤ`, `2↦1` | An extension would need `2f(1)=1` in ℤ, which is impossible | Pass |
| §8.1 Checks (recomputed) | SL₂ vs PGL₂; `SL₂⊗𝔽₂` | SL₂: `α(diag(t,t⁻¹))=t²=ϖ²`, so `α=2ϖ`. PGL₂: `X=ℤ·(a/b)=ℤα`. Centre `𝔽₂[t]/(t−1)²` has length 2 and is not smooth | Pass |
| §8.2 Checks (recomputed) | `x_α(t)` over ℤ and ℤ/4; `x_α(2t)` | Tangent `E₁₂` in both cases. `2E₁₂` is not a generator over ℤ/4 (2 is not a unit), so it is a different pinning | Pass |
| LieHighestWeight L7 transpose, used at `:3001–3004` (new) | B₂: α₁ long `e₁−e₂`, α₂ short `e₂` | Roots-as-rows `A=[[2,−2],[−1,2]]`. H-row `Aᵀ=[[2,−1],[−2,2]]`: `⁅h₁,e₂⁆=α₂(h₁)e₂=−e₂`, whereas the untransposed matrix gives `−2e₂`. Serre exponents: `1−A₂₁=2` (`α₂+2α₁=2e₁−e₂` is not a root) and `1−A₁₂=3` (`α₁+3α₂=e₁+2e₂` is not a root; `e₁+e₂` is) | Pass |
| Chevalley restriction, used at `:4125–4128` (new) | 𝔰𝔩₂/ℂ; 𝔤𝔩₂ | 𝔰𝔩₂: `det(diag(t,−t))=−t²`, and `ℂ[𝔰𝔩₂]^G=ℂ[det]` restricts onto `ℂ[t]^{±1}=ℂ[t²]`, degree 2 on both sides. 𝔤𝔩₂: `κ(I,·)=0`, so `IsKilling` fails; hence the restriction to the semisimple summand | Pass |
| `exists_levi_complement` (r83) | GL₂; `𝔾_a`; Borel of GL₂ | `J=0` gives a bijective id. `J=(t)`: `k→k[t]/(t)`. Borel: `J=(b)` is bijective, `(a−1)` is not injective, `0` misses `b` | Pass |
| same, hypothesis (r83) | `SL₂(W₂)`, char `p` | Smooth and connected with no Levi complement (McNinch (3.2.1)); excluded by `CharZero` | Pass |
| `IsMaximalTorus.exists_conjugate_eq` (r83) | GL₂/k̄; `μ_p×𝔾_m`; `SL₂/ℝ` | `g=u`. The torus is unique, so `g=1`. Diagonal torus vs `SO₂` is excluded by `IsAlgClosed` | Pass |
| `IsParabolic.exists_levi_complement` (r83) | `P=G`; `B⊂GL₂`; `SL₂(W₂)` | `R_u=1` and `J=0`. `J=(b)` works. `SL₂(W₂)` is excluded by `hred` | Pass |
| `lang_surjective` (r83) | `𝔾_a/𝔽₂`; `𝔾_m/𝔽_q`; `μ₂`, `q` odd | `g²−g=1` is solved by `θ∈𝔽₄`. `g^{q−1}=a` is solvable. `(±1)^{q−1}=1` misses `−1`; excluded by connectedness | Pass |
| `exists_coordinatePresentation` (r83) | `n=0,1,2` | `det ∅=1`, relation 0. `x−1`. `[[1,1],[0,1]]⁻¹` over ℤ/4 has entry 3 | Pass (R06) |
| `nonempty_plane_braid` (r83) | `n=0,1,2` | `B₀` is trivial. `π₁(ℂ)=1=B₁`. `ℂ×ℂ*` via `(z₁+z₂,(z₁−z₂)²)` gives `π₁=ℤ=B₂` | Pass |
| `permutation_nonsplit` (r83) | `n=2`; `n=0,1` | A section needs `2m=0` in ℤ, so `m=0`, which maps to id rather than the swap. `2≤n` excludes trivial `Sₙ` | Pass (R06) |
| `permute` direction (r83) | `n=3`, `σ=(0 1 2)` | `(z₀,z₁,z₂)↦(z₂,z₀,z₁)`; the wrong convention gives `(z₁,z₂,z₀)` | Pass |
| 6A, 6B, 7C, 7a, 7b, 7e Checks (r83) | `H¹(𝔾_m)`; `diag(2,1)`; `[[1+ab,a],[b,1]]`; `θ∈𝔽₄`; GL₂(𝔽₃) | Coboundary `c(t−1)`. `diag(4,1)` vs `diag(1,4)`. `c=1+ab`. `q+1`. `tw≠wt` | Pass |
| 7f Check (r83) | `(ℤ/8)ˣ⋉ℤ/8` | `H₁` and `H₂` meet each class equally, and `H₂` has no fixed point | R08 |
| 9A, 9B, 10C, 10D, 11 Checks (r83) | A3/A4/D4/E6; SL₂; char 3, 2; `𝔰𝔩₂` | Folded Cartan matrices `[[2,−2],[−1,2]]`, `[[2,−1],[−2,2]]`, `[[2,−3],[−1,2]]`. `γY³=I`. `disc(X²−t²)=4t²` | Pass |
| R04 statements (re-elaborated) | the three scratch theorems | Exit 0, with `sorry` only at lines 15, 27 and 40 | Statable |
| R04 Tits probe (r83) | GL₂; trivial group | 2 cells, `s²∈T`, `sBs⁻¹≠B`. Trivial group: `simple=∅`, closure `⊤` | True |
| R04 Brieskorn probe (r83) | rank 1; `ι=∅` | `ℂ*/±1≅ℂ*`, `π₁=ℤ=Artin(A₁)`. Trivial in the empty case | True |
| R04 Layer 3 probe (r83) | `μ_p⊂μ_{p²}`, char `p` | Coinvariants `k[s]/(s^p−1)`, free with basis `1,…,t^{p−1}`. The group is nonreduced, so the pinned quotient's hypothesis fails | True |

## Not verifiable

- Waterhouse, Borel and Springer are settled as uncertified and are cited by locator only.
- Howlett–Lehrer, Dipper–Du, Carter §1.17, Lang 1956, Steinberg 1968, Serre §§2.3/3.3 and Gassmann are references without locators for specific statements (carried).
- Frenkel–Kac, Gros–Kaneda, Salvetti, Callegaro and Hedén were not opened. No passage of this round depends on them.
- The manifest key `milne-iag` records the v2.00 notes, whose numbering differs. The README cites the 2017 author copy, checked in earlier rounds, and it was not re-opened.
- `TitsSystem/Bruhat/Basic` and `Bruhat/Uniqueness` have no built object files in this worker's cache. Their statements were read in source; the R04 probe imports only `TitsSystem.Basic`.
- The three board packages that are not pull requests were not opened: AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory.

## Source issues

- **Misprint** in conrad-rgs at Remark 6.1.2, p. 186: the source writes "it" where the verb "is" is meant, saying the Borel–positive-system correspondence "it not true" on disconnected bases; it should read "that is not true"; affects nothing.
