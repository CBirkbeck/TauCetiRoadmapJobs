# Review of CompactGroupsPartII (pull request #1047 at e409ddc)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** needs changes

Eight findings, four blocking (P2). The gate passes at this head, the fourteen sorried theorems
survive the one-tactic probe, and every sampled source locator that can be read legally is
correct. The blocking findings are all in Layer 6 and are all of one kind: targets that roadmaps
on main already own are stated again here, and three supplier citations break when the open
LieHighestWeight revision merges.

## R01 (P2) — §6.1 constructs a representation ring that TopologicalKTheory T6 on main already owns

**Location.** `README.md` lines 749–755: "Construct R(K), the Grothendieck ring of
finite-dimensional continuous complex representations, with addition by direct sum, multiplication
by tensor product, unit, dual, restriction … Reuse the generic additive group-completion engine
(`Algebra.GrothendieckAddGroup`)". `Suggested.lean` lines 15–18 say "the pins do not supply the
continuous-representation Grothendieck ring".

**Claim.** R(K) is a construction target of this roadmap.

**Witness.** `TauCetiRoadmap/TopologicalKTheory/README.md` on main, T6 item 2, lines 1235–1257
(G a compact Lie group): R(G) is defined as `SplitK0` of the continuous finite-dimensional
representations, with its monoidal structure, restriction, naturality and the forgetful ring map
to the pinned `TauCeti.repRing`
(`TauCeti/RepresentationTheory/RepresentationRing/Basic.lean:106`). Two owners, two carriers.

**Repair.** Delete the construction of R(K) from §6.1 and cite TopologicalKTheory T6 for the
carrier, its ring structure, restriction and naturality; keep in §6.1 only what T6 does not state
(the free basis on irreducible classes, the dual, the injective trace map onto the ring generated
by continuous characters). Name `TauCeti.repRing` next to `TauCeti.virtualCharacters` in the
supplier contracts. TopologicalKTheory T6 item 1 consumes this roadmap's §2.1 (through
`gap:banach-gfinite-density`), so citing T6 from Layer 6 makes the two roadmaps supply each other:
to keep one direction, move the ring-level targets (§6.1, §6.7 and the ring statements of §6.8)
into a continuation placed after TopologicalKTheory. Layers 0–5 and 7 and §§6.2–6.6, 6.9 need no
ring and stay. The trivial-group Check (`R(1) = ℤ` by dimension) holds on T6's carrier.

## R02 (P2) — §6.5 states as targets the compact structure theory that LieGroups Layers 5A, 6 and 7 on main own

**Location.** `README.md` lines 34–37 ("the compact center/derived splitting, the complexified root
dictionary … are explicit targets of Layer 6 here"), lines 892–898 (the first two targets) and
lines 920–936 (the root dictionary).

**Claim.** The splitting `𝔨 = 𝔷 ⊕ [𝔨,𝔨]`, the negative-definite Killing form, `𝔱 = 𝔷 ⊕ 𝔱'`, the
Cartan subalgebra `𝔱' ⊗ ℂ`, the root characters ξ_α with one-dimensional root spaces, and the
compactness of the simply connected cover are built here.

**Witness.** `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` on main: Layer 5A
(lines 641–658) owns the Ad-invariant form, skew-adjoint `ad`, the orthogonal splitting and the
negative-definite Killing form; Layer 6 "Compact real roots and the Weyl comparison" (line 750)
owns `t = z(g) ⊕ t_ss`, `dχ_α = iα`, the Cartan subalgebra, multiplicity one and the comparison
with LieHighestWeight's `rootSystem`; Layer 7 "Compact semisimple integration" (lines 883–891) owns
finite π₁ and the compact universal cover. CharacteristicClasses C5 item 1 on main already cites
Layers 5A and 6 for exactly these facts.

**Repair.** Delete those statements from §6.5 and its API bullets, and cite LieGroups Layer 5A,
Layer 6 (compact real roots) and Layer 7 (compact semisimple integration) in the supplier
contract, in the Scope paragraph and in the `*Needs:*` lines of §§6.5–6.7. §6.5 keeps what main
does not state: the closed derived subgroup and the commuting product (Knapp, Theorem 4.29), the
covering `q : Z(K)⁰ × K_der,sc → K` with its finite kernel F, the image of `X*(T)` as the
characters trivial on F, and the dominance comparison. The U(2) Check (kernel `{(1,I),(−1,−I)}`,
`(−1)^(q−a)`) is unchanged by the deletion.

## R03 (P2) — the period lattice and the integral-form comparisons of §§6.2 and 6.5 have owners on main

**Location.** `README.md` lines 798–800 and 806–807 (§6.2: "`ℓ_χ(ker exp_T)⊆2πℤ` … precisely the
functionals integral on the exponential kernel"), lines 943–946 (integer coroot values), lines
950–958 (the simply connected bijection onto P_der; the index under a finite covering).

**Claim.** These four lattice statements are targets here.

**Witness.** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md` on main, T1 lines 40–51:
the 2π-normalized period and weight dictionary of a compact torus, characters identified by
`(1/i)dχ`, the integer character/coroot pairing, and the finite-index lattice comparison under a
central isogeny with the U(2) index-two Check.
`TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` on main, Layer 10 lines 1726–1755:
`Y = Q∨` for the simply connected compact group, the dual form of `X*(T_sc) = P`.

**Repair.** Cite ConvexityToric T1 for the period dictionary, the coroot integrality and the
isogeny index, and LieHighestWeight Layer 10 for the simply connected case; keep here the
translation into the notation `χ ↦ λ_χ` (one sentence each) and the Knapp locators as references.
§6.2 keeps the weight-space decomposition, `R(T) ≃ ℤ[X]` and the trace formula. The Check
"the functional 1/2 gives `exp(iπ) = −1`" agrees with T1's `α_χ(λ)/(2π) ∈ ℤ`.

## R04 (P2) — supplier citations of LieHighestWeight Layers 1, 2 and 4, which the open revision of that roadmap drops

**Location.** `README.md` lines 186–190, 739, 929, 944, 947, 949–950, 954, 980–981, 1018,
1052–1053, 1136 and 1222 (Layers 1, 2, 4 by number, or inside the ranges "Layers 0–5", "Layers 0–6").

**Claim.** LieHighestWeight Layer 1 supplies the root-system vocabulary, Layer 2 the integral
weights, Layer 4 the dominant integral classification.

**Witness.** Pull request #1220 (LieHighestWeight, head beea1d2): its README has Layers 0, 3 and
5–10 only, and lines 13–26 say a consumer "cites the declaration, not a layer of this roadmap". No
old → new mapping is given, so these citations break when #1220 merges.

**Repair.** Cite the declarations, which exist at this pull request's pins and stay valid before
and after #1220: Mathlib `LieAlgebra.IsKilling.rootSystem`
(`Mathlib/Algebra/Lie/Weights/RootSystem.lean:411`); `TauCeti.integralWeightLattice`
(`TauCeti/Algebra/Lie/Weights/WeightLattice.lean:188`) and `TauCeti.exists_int_apply_coroot`
(`TauCeti/Algebra/Lie/Weights/Integrality.lean:149`); `TauCeti.IsDominantIntegral`
(`TauCeti/Algebra/Lie/HighestWeight/Basic.lean:286`) and
`TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`
(`TauCeti/Algebra/Lie/HighestWeight/Existence.lean:234`). List them under "From Mathlib" and
"From Tau Ceti" and replace "Layers 0–5" by "Layers 0, 3 and 5" plus these names.

## R05 (P3) — the docstring says the pins lack a Hilbert–Schmidt carrier and maximal tori; they have both

**Location.** `Suggested.lean` lines 19–20: "the continuous-kernel comparison needs the
Hilbert–Schmidt operator carrier". `README.md` §0.2 and its `*Needs:*` (lines 257–258, 272–273)
cite only OperatorIdeals Part C. `Suggested.lean` lines 16–18: "the pins do not supply … maximal
tori of compact Lie groups with their character lattices"; the README cites maximal tori only as
LieGroups Layer 6.

**Witness.** At the pinned Tau Ceti: `ContinuousLinearMap.hilbertSchmidtEnergy` and
`ContinuousLinearMap.hilbertSchmidtNorm`
(`TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Basic.lean:89, 212`), `HilbertBasis.columnOperator`
(`…/HilbertSchmidt/Columns.lean:105`) and `TauCeti.convolutionOperator`
(`TauCeti/RepresentationTheory/Compact/Convolution.lean:320`). What the pins lack is the integral
operator `A_k` of a continuous kernel on a general compact space. Also at the pin, in
`TauCeti/Geometry/Lie/Subgroup/Torus.lean`: `TauCeti.Lie.IsTorus` (:82), `TauCeti.Lie.IsMaximalTorus`
(:88), `exists_isMaximalTorus` (:214), `IsTorus.nonempty_continuousMulEquiv_pi_circle` (:241), and
`IsMaximalTorus.finite_normalizerQuotient` (`…/Subgroup/Weyl/Finite.lean:194`); the character
lattice of such a torus is Mathlib's `PontryaginDual`. What Layer 6 lacks at the pins is the root
characters with a positive system, the continuous representation ring and the finite central cover.

**Repair.** In the docstring, name the missing carrier as the integral operator of a continuous
kernel on a compact space with a finite Borel measure. Likewise name the root
characters and positive system, not maximal tori, as what the Layer 6 headlines lack. In the
README, list the four Hilbert–Schmidt declarations and the five torus declarations under "From Tau
Ceti" (for §0.2, and for §§6.2 and 6.4, where "LieGroups Layer 6's identification of a compact
torus with a finite product of circles" is the pinned theorem), and say in Scope in one clause how §0.2 differs from the kernel
step of the base roadmap's Layer 5 (general compact X and the exact norm identity, rather than
compactness of the Haar convolution operator). The two-point Check (`‖A_k‖²_HS = 1 = 4·1/4`) is
unaffected; note that `hilbertSchmidtNorm` is 0 on operators of infinite energy, so the identity is
stated with the energy or after finiteness.

## R06 (P3) — `not_separable_L2_circleProduct` is a control, with two instances kept only for it

**Location.** `Suggested.lean` lines 128–137 (`circleProductMeasurable`, `circleProductBorel`,
`not_separable_L2_circleProduct`).

**Witness.** The statement is the instance `G = Circle^J`, J uncountable, of
`separable_L2_iff_countable_irrepClass` and `secondCountable_iff_countable_irrepClass` (an
uncountable product of circles is not second countable), and it mirrors the README Checks of §3.1
(`‖χ_j − χ_k‖² = 2`). The two local instances are definitions no headline needs; the pull request
description counts "three definitions" where the file has five `def`/`instance` declarations.

**Repair.** Delete the theorem and the two local instances from `Suggested.lean`; §3.1 keeps the
circle-product statement and its Checks in prose (drop the backticks on the three names there).

## R07 (P3) — §6.4 Check: `diag(−1,1,1)` is not in the maximal torus of SU(3)

**Location.** `README.md` lines 877–878: "each multiplied by diag(−1,1,1)∈T to have determinant 1".

**Witness.** `det diag(−1,1,1) = −1`, while T ⊂ SU(3) consists of diagonal matrices of
determinant 1.

**Repair.** Write "each multiplied by `diag(−1,1,1)`, which is diagonal and so commutes with T, to
have determinant 1". The computed values are unchanged: `(s₁s₂)·e₁ = s₁·(s₂·e₁) = s₁·e₁ = e₂` and
`(s₂s₁)·e₁ = s₂·e₂ = e₃`.

## R08 (P3) — a page range and a process word

**Location and witness.** (a) `README.md` line 1317: "Lecture 11, §37, pp.199–204". The notes end on
printed page 203 (Etingof2024 line 219); the sixth page of the file is the course footer. (b)
`README.md` line 78: "the old subspace-only condition holds" refers to an earlier state of the
text.

**Repair.** (a) "pp.199–203". (b) "the condition that only the trivial subspaces are invariant
holds, but irreducibility is false".

## Verified sound

**Gate and build.** The worker's gate at e409ddc passes every check. Dependency check output:
`depcheck: 235 roadmaps, 2270 edges, 0 problem(s)` (no UPWARD or CYCLE line). The pins are those of
main (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b). Outside the folder the pull request changes only the
family index `TauCetiRoadmap/RepresentationTheory/README.md` (two added entries, both accurate).

**One-tactic probe.** A scratch copy with every `sorry` replaced by
`first | (simp; done) | rfl | infer_instance | (exact?; done)` was elaborated with `lake env lean`:
all 14 theorems stay open, and there is no other error. The 17 elaborated types were compared with
the README statements: `compactCharacter` does not carry `[IsTopologicalGroup G] [CompactSpace G]
[T2Space G]` and does not need them; every theorem carries its hypotheses.

**Sources (sample).** Knapp2021 (author edition; file page = printed page + 18):
Prop. 2.13 p.136 (line 6121); Prop. 4.8 and Cor. 4.9 p.240 (lines 10109–10120); Prop. 4.24,
Cor. 4.25, 4.26 p.249 (lines 10491–10511); Thm 4.29 pp.250–251 (line 10549); (4.31) p.253 and
(4.32) p.254 (lines 10683, 10710); Prop. 4.58 pp.264–265 and Prop. 4.59 p.265 (lines 11115,
11137); Prop. 4.67 p.267 (line 11241); Thm 4.69 p.268 (line 11261); Thm 5.107 p.334 (line 14142);
Thm 5.110 and proof pp.335–336 (lines 14203–14247). Each supports the statement it is cited for;
Cor. 4.26 gives a semidefinite form and the definiteness on the derived algebra uses its
semisimplicity. Etingof2024: §37.1 p.199 (lines 5–11) and Thm 37.5 p.202 (lines 151–157), both
under the countable-base hypothesis, as the README says.

**Library declarations opened at the pins (65).** Every name in "From Tau Ceti" resolves, among
them `TauCeti.haarProb` (`Compact/Haar.lean:93`), `TauCeti.IrrepClass` (`Compact/PeterWeyl.lean:670`),
`TauCeti.stdPeterWeylBasis` (:713), `TauCeti.representativeStarSubalgebra_dense`
(`Compact/RepresentativeDensity.lean:139`), `ContRepresentation.integratedOperatorL1`
(`Continuous/Integrated/Basic.lean:144`; hypotheses read: additive monoid, `R1Space`, inner regular
measure, no commutativity, separability or second countability, as §2.1 claims),
`comp_integratedOperatorL1` (:211, argument `−h + g`), `tendsto_integratedOperatorL1_apply` (:437),
`ContRepresentation.matrixCoeff` (`Continuous/MatrixCoefficient.lean:70`, `⟪π g v, w⟫`),
`TauCeti.SU2.symPowerModel` (`SU2/Exhaustion.lean:97`, on `ℂ^(d+1)`),
`TauCeti.SU2.symPower_torusHom_weightBasis` (`SU2/Weight.lean:134`),
`TauCeti.peterWeylFamily_fourierIrrepModel` (`Compact/FourierPeterWeyl.lean:147`),
`TauCeti.Hodge.complexificationConjugation` (`Geometry/Hodge/Conjugation.lean:106`). Mathlib:
`Representation.IsIrreducible.finrank_eq_one_of_isMulCommutative`
(`RepresentationTheory/Irreducible.lean:91`), the discreteness instance of the dual of a compact
group (`Topology/Algebra/PontryaginDual.lean:87`),
`Circle.eq_one_of_forall_pow_mem_centeredArc_pi_div_two`
(`Analysis/SpecialFunctions/Complex/Circle.lean:483`), `Summable.countable_support_ennreal`. No
pinned declaration states a G-finite predicate, a product-dual theorem, the compact abelian
character basis, the U(2) criterion or the SU(2) multiplicity theorem.

**Cross-roadmap citations resolved (12).** OperatorIdeals Part C OI-C01–OI-C11 (main, lines
540–558); LieGroups Layers 0, 2–7 (main); LieHighestWeight Layers 0–7, 9 (main; see R04 for the
open revision); AutomorphicFormsOnReductiveGroups §2.1 and §2.7; SmoothBanachRepresentations §4.1;
CharacteristicClasses C5 item 1; Completed/OrthogonalL2Bases Part B; CharacterTheory Layers 0–4.
The base roadmap on main states no Banach density, product dual, abelian Fourier basis, global form
or U(n) embedding target. Consumers (AutomorphicFormsOnReductiveGroups, TopologicalKTheory,
IndexTheory, SmoothBanachRepresentations, NoncompactQuantumSymmetry) address
`gap:banach-gfinite-density` to "CompactGroups Layer 5"; the names they expect (`IsGFinite`,
`gFiniteSubmodule`, `gFiniteSubmodule_dense`, conclusion `Dense (gFiniteSubmodule π.toRepresentation : Set E)`)
are exactly those of §2.1.

**Adversarial table.**

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| `positive_selfIntertwiner_existsUnique_scalar` | `T = 2I` on ℂ; `V = 0` | `⟪1,2⟫ = 2 > 0`, `c = 2` unique; `V = 0` fails `IsIrreducible` | holds |
| §1.1 Gram convention | `T = 2I`, `h(1,i)`; swap action on ℂ² with `diag(1,2)` | `2i` (other slot `−2i`); `h(πe₁,πe₁) = 2 ≠ 1` | Checks correct |
| §1.3 block change | `U = diag(1,i)`, `A = [[1,1],[1,2]]` | `UAU† = [[1,−i],[i,2]]`, `U†AU = [[1,i],[−i,2]]` | Check correct |
| §0.2 norm identity | two points of mass 1/2, `k = 1`; `k(1,2) = i` | `1 = 4·1/4`; entry `i/2`, both sides `1/4` | holds |
| `IsGFinite`, `gFiniteSubmodule` | `v = 0`; trivial action over 𝔽₂ | span `⊥`, dimension 0; dimension 1 | holds |
| `gFiniteSubmodule_dense` | `E = 0`; rotations on `C(S¹)`; ℤ on `ℓ²(ℤ)` | dense; `‖R_θ − 1‖ = 2` yet orbit maps continuous; non-compact, excluded | holds |
| §2.1 covariance Check | S₃, `h = (12)`, `t = (23)` | `ht = (123)`, `th = (132)` | Check correct |
| `secondCountable_iff_countable_irrepClass` | trivial group; `Circle^J`, J uncountable | both sides true; both false | holds |
| `separable_L2_iff_countable_irrepClass` | finite G; `Circle^J` | index `Σ d² = |G|`; `‖χ_j − χ_k‖² = 2` | holds |
| `character_finite_coordinates` | `J = ∅`; `S₃ × C₃` | `F = ∅`, `χ = 1`; `sign·ω ↦ −ω` | holds, non-abelian factors allowed |
| `exists_productDualEquiv` | `J = ∅`; `Circle²`, exponents `(1,−1)` at `(i,−1)` | both groups trivial; `i·(−1)⁻¹ = −i` | holds; `e` pinned on generators |
| `circleProduct_character` | `J = ∅`; `J = ℕ` at the constant tuple −1 | `n = 0`; `χ_n = −1` for all n | holds; uniqueness by `z^(n_j)` |
| `exists_irrepClass_characterEquiv` | trivial group; Circle at `i` | one class; scalar `i`, coefficient `−i` | holds; `e` determined since dim = 1 |
| `compactCharacter_span_dense`, `exists_characterBasis` | trivial group; C₃; `f = c_χ + 2c_ψ` | span `ℂ·1`; `(1+ω+ω²)/3 = 0`; `1 + 4 = 5` | hold |
| §6.4 left action | SU(3), `s₁ = (12)`, `s₂ = (23)` | `(s₁s₂)·e₁ = e₂`, `(s₂s₁)·e₁ = e₃` | correct; see R07 |
| §6.5 descent | U(2), kernel `(−1,−I)` | `(−1)^(q−a)`: `(1,1)` descends, `(0,1)` does not | correct |
| §6.8 U(n) congruence | U(3), `λ = (2,1,−1)`; `(1,0)` with `q = 0` | `q = 2`, `a₁ + 2a₂ = 5 ≡ 2`; `ζ⁻¹ ≠ 1` | correct |
| `u2_weight_character_iff` | `f = 0`; `Sym² ⊕ det`; support `{(1,−1),(−1,1)}`; `det⁻¹` at `diag(i,−1)` | `n = 0`; `1 ≤ 2`, `0 ≤ 1`; `1 ≤ 0` fails at `(0,0)`; trace `i` | holds in both directions |
| `su2_multiplicities_and_faithfulness` | `n = 0`; `Sym¹`; `Sym²` at `−I` | `m = 0`, not injective; kernel `{I}`; `(−1)² = 1`, kernel `{±I}` | holds |
| `exists_su2_of_multiplicities` | `m = 0`; `m = 2·δ₁` | dimension 0; dimension 4 | holds |
| §7.1 count | `n = 0,…,4` | `p − p_odd = 0, 0, 1, 1, 3` | correct |

**Headline theorems.** Stated: the scalar metric classification (§1.2), Banach G-finite density
(§2.1), the countability criteria (§3.1), the product dual and torus characters (§4.1), the abelian
character bijection, density and basis (§5.1), the U(2) criterion (§6.9), SU(2) multiplicities,
faithfulness and realization (§7.1). Named in the docstring as not statable: the representation
ring comparison and the Layer 6 root dictionary (no continuous representation ring, no root
character or positive system of a compact group and no conjugacy of maximal tori at the pins; the
maximal-torus predicate itself is pinned, see R05), and the multiplicity-space comparison. The
ring isomorphism and the highest-weight classification need those missing carriers, so no Layer 6
headline beyond §6.9 is statable. The continuous-kernel item is R05.

## Not verifiable

- Conway, *A Course in Functional Analysis*, VII.9, Exercises 8–11 (cited in §4.1 and §5.1): the
  book is behind the publisher's paywall and the README records it as a locator-only citation; no
  legal copy was found, so the exercise numbers were not checked. The statements themselves were
  checked by computation (table above).
- Ownership against open pull requests was checked through the roadmap search over the open heads
  and main; the closest open roadmaps (AutomorphicFormsOnReductiveGroups, NoncompactQuantumSymmetry,
  SmoothBanachRepresentations, LieHighestWeight, SmoothRepresentationsOfLocalGroupsPartII) consume
  §2.1 and state none of this roadmap's targets.

## Source issues

- none
