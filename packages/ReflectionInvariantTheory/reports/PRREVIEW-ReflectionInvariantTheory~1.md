# Review of ReflectionInvariantTheory (pull request #2539 at 43615d1)

**Verdict:** needs changes

**Summary.** Changes are needed for three reasons. First, no target in the README has a source locator, so none of the roughly thirty-five statements can be checked against a text. Second, §1.2 asks for a proof that `m = dim V` from a hypothesis that does not imply it. Third, a Check of §2.2 gives the Jacobian of the elementary symmetric polynomials with the wrong sign. All three are P2. The `Suggested.lean` statements are true as stated, match the README, and elaborate with `sorry` as the only warning. There are five small corrections and one format note, none blocking, plus one question for the author. The human reviewers have three points to decide, including that the arrangement and wording checks could not be run against a most-cited source.

## R01 (P2) — No target in the README carries a source locator, so no statement can be checked against a source

The References list fourteen works (lines 1085–1106), but no target in Layers 1–5 points to a theorem, section or page of any of them. Where a source is named at all, it is by author only: "Route (Fleischmann; Fogarty)" in §1.1 (line 131), "(Hochster–Eagon)" in §1.2 (line 151), "Steinberg's theorem" in §2.5 (line 347), "Macdonald's product formula" in §4.5 (line 674). The main results of Layers 3 and 4 (Chevalley's theorem, `∏ dᵢ = |W|`, the coinvariant algebra, Coxeter elements and their eigenvalues, the height partition) name no source at all. An implementer cannot find the proof a target refers to, and a reviewer cannot confirm that a cited source proves the statement at the stated generality. Of the fifteen sampled targets, none has a locator to verify.

The smallest repair is a locator at each target, in parentheses at the claim. Here are some I checked in the texts:
- for Steinberg's theorem in §2.5: Steinberg 1964, Theorem 1.5, p. 394. That theorem is stated over ℂ, for the pointwise stabilizer of any subspace.
- for the orthogonal-complement step of §3.4: Theorem 1.2(c), p. 393 of the same paper; for `dim C = |G|`, its Theorem 1.3(e′), p. 393.
- for §1.1: Fogarty 2001, §2, displays (1)–(3), pp. 6–7.

## R02 (P2) — §1.2 asks for a proof that `m = dim V` from a hypothesis that allows `m > dim V`

The hypothesis of §1.2 (lines 148–151) is only that `A` is finite over `K[θ₁, …, θₘ]`. Any family with redundant members satisfies it, and for such a family the first and second conclusions are false. Take `G` trivial acting on `V = K`, so `A = K[x]`, and `θ = (x, x²)`. Both are homogeneous invariants of positive degree, and `A` is finite over `K[x, x²] = K[x]`. But `m = 2 ≠ 1 = dim V`. Nor is `θ` a regular sequence on `A`: `x²` acts as zero on `A/xA = K ≠ 0`. The parenthetical "a homogeneous system of parameters of `A`" names the hypothesis just stated. It is not read as the standard condition that also requires `m = dim A`.

The smallest repair is to add `m = dim V` to the hypotheses, as the standard definition of a homogeneous system of parameters does (equivalently, the `θᵢ` algebraically independent). The bullet "prove that `m = dim V`" then becomes a remark: this is the Krull dimension of `A` (`Representation.ringKrullDim_symmetricAlgebraInvariants`).

## R03 (P2) — The Jacobian in the second Check of §2.2 has the wrong sign

The Check on line 268 states that the Jacobian of `(e₁, e₂, e₃)` is `J = (x − y)(y − z)(z − x)`. With rows `∂eᵢ` and columns `x, y, z` (the definition on line 245), the matrix at `(x, y, z) = (0, 1, 2)` is `[[1,1,1],[3,2,1],[2,0,0]]`, whose determinant is `−2`. At the same point, `(x − y)(y − z)(z − x) = (−1)(−1)(2) = 2`. In general `J = x²(y − z) − y²(x − z) + z²(x − y) = −(x − y)(y − z)(z − x)`. The point of the Check (degree `3`, the hyperplanes `xᵢ = xⱼ`, `e_H = 2`) is unaffected. Write `J = (x − y)(x − z)(y − z)`, or say "up to sign".

## C01 — Two roadmaps on main link to heading anchors this revision removes

LieHighestWeight (lines 120 and 902 on main) links to `README.md#2-complex-branch-shephardtodd-in-both-directions`. RootSystems (line 57) links to `README.md#4-crystallographic-weylcoxeter-dictionary`. After the merge both links land at the top of the page rather than at the cited layer. The README states no mapping from the old headings to the new ones. One option is an explicit anchor line before `## Layer 2` (line 190) and before `## Layer 4` (line 588), for example `<a id="2-complex-branch-shephardtodd-in-both-directions"></a>`; this keeps both links working without editing the other roadmaps. Another is a sentence saying that Layer k is the former §k.

## C02 — The route of §4.1 extends scalars from `K` to `ℝ`, but `K` need not embed in `ℝ`

§4.1 (lines 599–600) says that "by §3.3 the degrees may be computed after extending scalars to `ℝ`". By Convention 7, `K` is any field of characteristic zero, such as `ℂ` or `ℚ_p`, and neither has an embedding into `ℝ`. The route needs the rational form of a crystallographic root pairing, which is Mathlib's `RootPairing.restrictScalarsRat` (`LinearAlgebra/RootSystem/BaseChange.lean`, line 132). §3.3 is then applied twice: to `ℚ ⊆ K` and to `ℚ ⊆ ℝ`, with the fixed directions of §3.3 when the roots do not span `M`. §4.4 relies on the same transfer when it uses §3.6 for `Σ eᵢ = |Ref(W)|` (line 663). Naming `RootPairing.restrictScalarsRat` in both *Needs:* lines would close the gap.

## C03 — §5.2 cites the wrong Tau Ceti lemma for "swapping the colours inverts it"

On lines 805–806 the claim is attributed to `CoxeterSystem.isConj_bipartiteCoxeterElement_inv`. At the pin that lemma states that the bipartite Coxeter element is conjugate to its inverse (`GroupTheory/Coxeter/Bipartite.lean`, line 178). The inversion under exchanging the colours is `CoxeterSystem.bipartiteCoxeterElement_recolorOfEquiv_boolNot` (same file, line 169). Cite that lemma there and in the *Needs:* line (line 809).

## C04 — Two Checks of §2.1 drop hypotheses that the Checks of Layer 1 state

§2.1 "holds over every field" (line 208), but its second Check (line 234), `{±1}²` acting by sign changes with basic invariants `(x², y²)`, needs `char K ≠ 2`. In characteristic 2 the sign changes are trivial and the basic invariants are `(x, y)`. The rank-one Check (line 239), `G = μₘ` with `A = K[xᵐ]`, needs `K` to contain `m` distinct `m`-th roots of unity, as the first Check of §1.1 says (line 140). Add those hypotheses to the two Checks.

## C05 — The title describes the change as a template update

"Template update: ReflectionInvariantTheory" suggests a change of form only. The change rewrites most of the README, adds targets (§1.1 in positive characteristic, §1.2, §2.3, the completed local comparison of §2.5, §4.8, the classification of §5.3), and adds ten admitted theorems to `Suggested.lean`; the description says so. A title such as "ReflectionInvariantTheory: current layout, new targets and headline statements" would match it.

## N01 — `poincarePolynomial_weylCoxeterSystem_eq_prod` assumes `[Finite P.weylGroup]`, which the README does not mention

`Suggested.lean` line 138 carries the hypothesis because the pinned Tau Ceti proves finiteness only when the roots span or `P` is a root system (`RootPairing.finite_weylGroup_of_span_eq_top`, `RootPairing.finite_weylGroup`). Convention 7 or §4.1 could say that the Lean statement assumes it.

## Questions for the author

- Is Steinberg's stabilizer theorem (§2.5) meant as a headline? It is statable at the pins with `MulAction.stabilizer` and `Subgroup.closure` of the elements whose fixed space has codimension one and that fix `v`. `Suggested.lean` does not state it, and its module docstring does not list it among the headlines that cannot be stated. The Summary does not list it either, which is why this is a question rather than a remark.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §1.1 Noether bound | `μₘ` on `K`; Fogarty's identity | `A = K[xᵐ]`, bound `m` attained, `m − 1` fails; `g·𝔪^g ⊆ J`, `g` invertible gives `𝔪^g ⊆ J` | true; route matches Fogarty 2001 §2 |
| §1.2 Hochster–Eagon (sample) | trivial `G` on `K`, `θ = (x, x²)`; `{±1}` on `K²`, `θ = (x², y²)` | `m = 2`, `dim V = 1`, `x²` zero on `A/xA = K`; second: rank 2, `(1+t²)/(1−t²)²` | false as stated: R02 |
| §2.1 `IsBasicInvariants` (sample) | `S₃` on `K³`; `fᵢ = 0` or constant; char 2 | `e` and `p` both degrees `{1,2,3}`; `0` or constant breaks injectivity, so `dᵢ ≥ 1`; char 2 makes `{±1}²` trivial | definition right; Checks: C04 |
| §2.2 Jacobian formula | `S₃` with `e`; `μₘ` | `det` at `(0,1,2)` is `−2`, product `2`; `J = m x^(m−1)`, exponent `e_H − 1 = m − 1` | formula true; Check sign: R03 |
| §2.3 étale covers (sample) | `n = 1` Hurwitz; three counterexamples | `2g − 2 = −d − m ≥ −2` gives `d = m = 1`; Artin–Schreier, `ℂ/ℝ`, `z²` on `𝔾_m` | true; hypotheses needed |
| `shephard_todd_target`, §2.4 | `ℤ/2` trivial on `K`; `{±1}` on `K²`; `μₘ` | `K[x]` polynomial, subgroup `⊥`, so faithfulness needed and `⊥ ⊔ ker = ⊤`; both false; both true | true, matches README |
| §2.5 Steinberg (sample) | `S₃` at `(1,1,2)`; `{±1}` at `0`; source | stabilizer `⟨(1 2)⟩`; `G₀ = G` with no pseudoreflection; Steinberg 1964 Thm 1.5 p. 394, over ℂ | true; no locator given (R01) |
| §3.1 chambers (sample) | `I₂(m)`; `S₃` on plane; `uC` | sector `π/m`, `st` rotation `2π/m`; 6 chambers, `ℓ(w₀) = 3`; walls `u·αᵢ` give `ℓ_C(u⁻¹wu)` | true |
| §3.4 harmonics (sample) | `{±1}` on `ℝ`; source | `𝓗 = span(1, x)`, `S = ℝ[x²] ⊕ ℝ[x²]x`; orthogonal complement is Steinberg 1964 Thm 1.2(c) | true |
| `poincareSeries_coinvariants_eq_prod`, §3.5 | `S₃`; nonfaithful `ℤ/2 × ℤ/2` on `ℝ` | `(1+t)(1+t+t²) = 1+2t+2t²+t³`, lengths `1,2,2,1`; `Hilb = 1 + t`, `d = 2` | true without `hρ` |
| `prod_degrees_eq_card`, `sum_…`, regular rep, §3.6 (sample) | `S₃`, `I₂(m)`, `H₃`, `H₄`, `V = 0` | `6 = 6`, `6 = 3 + 3`; `2m`, `m + 2`; `120`, `14400`; `∏∅ = 1 = |1|`, `Σ = 0` | true |
| §3.8 flag polynomial (sample) | `SU(2)`, `U(2)`, `SU(3)` | `1 + q²`; `(1−q²)(1−q⁴)/(1−q²)² = 1 + q²`; wrong normalisation `1 − q⁴`; `1+2q²+2q⁴+q⁶` | true |
| `poincarePolynomial_weylCoxeterSystem_eq_prod`, §4.1 (sample) | `A₃`, `B₂`, `G₂`; `K = ℂ` | `[1,2,2,1]∗[1,1,1,1] = [1,3,5,6,5,3,1]`; `B₂`, `G₂` match; `ℂ` has no map to `ℝ` | true; route gap C02 |
| `IsCoxeterElement`, §4.2 (sample) | `A₂` | `s₁s₂`, `s₂s₁` conjugate by `s₁`; `s₁s₁s₂` excluded by `Nodup` and support | definition right |
| `charpoly_coxeterElement_eq_prod`, §4.3 (sample) | `A₁`, `A₂`, `B₂` | `X + 1 = X − e^(πi)`; `e^(2πi/3)`, `e^(4πi/3)`; `±i`; differentials give `ζ^(−eᵢ)` | true |
| `card_eq_card_support_mul_orderOf`, §4.4 (sample) | `E₈`, `A₁`, empty `ι` | `240 = 8·30`, `2 = 1·2`; `IsIrreducible` with a root forces the roots to span `M` | true |
| `card_height_eq_card_degrees`, `height_highestRoot_…`, §4.5 | `G₂`, `B₂`, `A₁`; Macdonald product | heights `1,1,2,3,4,5` against `e = {1,5}`; `1,1,2,3` against `{1,3}`; `m_j = #{dᵢ > j}`; `ht θ + 1 = 2` | true |
| `exists_degree_eq_of_coprime`, §4.6 (sample) | `E₈`, `H₃`, `I₂(5)` | units mod 30 are all 8 exponents; `3, 7` missing for `H₃`; `2, 3` missing for `I₂(5)` | true for Weyl only |
| §4.7 reducible (sample) | `A₁ × A₂` | `8/3` not an integer; `ord c = lcm(2,3) = 6`; `5` prime to 6, not an exponent | true |
| §4.8 Lie invariants (sample) | `𝔰𝔩₂`; supplier | Killing form, degree 2; `lieChevalleyRestrictionIso` needs char 0, algebraically closed, `IsKilling`, Cartan | true; hypotheses match |
| §5.3 affine diagrams | `Ã₃`, `D̃₄`, `D̃₅`, `C̃₃` | 4 of 8 preserve; 24 preserve; 4 of 8 exchange; reversal changes parity iff `r` odd | true |
| §5.2 citation | lemma at pin | `isConj_…_inv` is `IsConj c c⁻¹` (line 178); exchange lemma at line 169 | C03 |

- Source locators checked against the text: 0 in the README. 4 in sources, checked to supply repairs: Steinberg1964 lines 46–53, 58–71, 101–103; Fogarty2001 lines 48–52, 102–135.
- Library declarations opened at the pins: 26. Mathlib: `Irreducible.lean:148`, `Base.lean:540`, `WeylGroup.lean:55,62,132`, `BaseChange.lean:132`, `Regular/Flat.lean:47`, `Invariant/Basic.lean:142`, `Monoidal/Tor.lean:50`. Tau Ceti: `Presentation.lean:167`, `Poincare.lean:87`, `Pseudoreflection.lean:70`, `HilbertIdeal.lean:84`, `SymmetricAlgebra/Basic.lean:229`, `HighestRoot.lean:94`, `Free.lean:295`, `Galois.lean:221`, `Inertia.lean:259`, `Unramified.lean:42`, `Jacobian.lean:88`, `Bipartite.lean:169–195`, `ChevalleyRestriction.lean:101–177`, `Hurwitz.lean:72`, `Weyl/Group.lean:470–476`, `RegularLocalRing/ProjectiveDimension.lean:465`.
- Backticked library names in the README: all found by name at the pins except `Scheme.Hom.etale_of_etaleAt_codimOne`. That is PurityOfBranchLocus's own proposed name for its §2.2, and the citation matches that section.
- Cross-roadmap citations resolved on main (68a511a): PurityOfBranchLocus §2.2; RootSystems §2.1, §3.2, §§3.3–3.5, §6.1, Layer 4; LieGroups Layers 5A, 6, 8; CharacteristicClasses C5.1–C5.3, C5a.2, C5a.7; LieHighestWeight Layer 7.
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2193 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives eleven `declaration uses 'sorry'` warnings and nothing else. `#check @` of all 13 declarations, run on a copy of the file, matches the README statements; no binder is lost.
- Padding: by reading, none of the eleven theorems closes with one tactic. No pinned declaration states any of them; the converse of Shephard–Todd is absent at the pin.

Overlap check: read ReductiveGroups, OrthogonalTamagawaAndLatticeMass, PseudolineArrangementsAndOrientedMatroids (open), and RootSystems, LieHighestWeight, RootSystemsPartII (main). Shared objects and their owners:
- the Coxeter presentation of Weyl groups and the finite Coxeter classification: RootSystems and Tau Ceti, cited here;
- the chambers of general finite real reflection groups: this roadmap (RootSystems line 57 agrees);
- Chevalley restriction and orbit separation: LieHighestWeight Layer 7 and Tau Ceti, cited here;
- `|W| = ∏ dᵢ`: this roadmap, cited by OrthogonalTamagawaAndLatticeMass (README line 528).

Ownership was also searched by object across all open heads, for étale covers of affine space, the Noether bound, Hochster–Eagon, Coxeter elements and systems of basic invariants: no second owner.

Source independence: 8 passages compared with 2 sources (Steinberg1964, Fogarty2001); none shared beyond forced terms ("reflecting hyperplanes", "orthogonal complement"). Largest share: none, since the README has 0 locators. Contents not compared: there is no most-cited source, and Humphreys' contents page could not be read.

Research link: Layer 2 is the Chevalley–Shephard–Todd theorem (Shephard–Todd 1954; Chevalley 1955) with Steinberg's stabilizer theorem (Steinberg 1964, Thm 1.5). Layer 4 is the Coxeter-element and exponent theory of Coleman 1958, Kostant 1959 and Springer 1974, which CharacteristicClasses C5a uses for rational cohomology of compact Lie groups. Rests on the README's References and Steinberg1964.

## Not verifiable

- Sampled targets 1.2, 2.1, 2.3, 3.1, 3.6, 3.8, 4.1, 4.2, 4.3, 4.4, 4.6, 4.7, 4.8: the README gives no locator, so there was nothing to check at a locator. The mathematics was checked by computation (table above).
- Sampled targets 2.5 and 3.4: no README locator; checked by me against Steinberg 1964, Theorems 1.2(c), 1.3(e′) and 1.5.
- Humphreys 1990, table of contents: the publisher's pages returned HTTP 403 and 500, so the arrangement comparison was not run.
- Hochster–Eagon 1971, Chevalley 1955, Kostant 1959, Coleman 1958, Springer 1974, Macdonald 1972, Kane 2001, Bourbaki, Smith 1995: not fetched, since no locator names a passage in them.

## Source issues

- none

## For the human reviewers

- Not tested: the README has no source locators, so no source has the largest share. Wording was compared only with Steinberg 1964 and Fogarty 2001, and the arrangement was not compared, because Humphreys' contents page could not be read.
- Licence: Steinberg 1964 (Trans. AMS 112) and Fogarty 2001 (ERA-AMS 7) were read from the free back-issue PDFs on ams.org. The sources service had no class for that host; I recorded them as publisher-open.
- `STATUS.md` in this folder (generated, not changed by this pull request) reports Tau Ceti proofs after the pin of both Shephard–Todd directions, `∏ dᵢ`, `Σ dᵢ`, the Jacobian formula and the regular representation. Several `Suggested.lean` statements will then be library theorems.
