# Review of CongruenceModulesOfThetaLifts (pull request #2921 at a56fc01)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/CongruenceModulesOfThetaLifts/`
**Verdict:** needs changes

**Summary.** Changes are needed: there are three P2 findings, and two of them concern 7.5a, on which 7.5b rests, and through 7.5b the total congruence bound (headline 1). In 7.5a, clause (a)(ii) has no route and its only support, [FormalProof], is cited without a locator. Its route also gives a false reason for leaving (a)(i) open, since Gan–Qiu–Takeda's first-term identity proves (a)(i) in a few lines. The third finding is a Check in 7.7a that calls `ℓ > t + 1` necessary when `ℓ > t` suffices. Everything else I computed holds; there are three small corrections and two format notes, and the human reviewers have a scope, a licence and a not-tested question about the formal proof.

## R01 (P2) — Statement 7.5a (a) has no route, and its only support, [FormalProof], is cited with no locator; the real-place clause (a)(ii) is a case the published literature leaves open

The chain of dependence is: 7.5a (b) rests on (a); 7.5b rests on 7.5a; and headline (1) rests on 7.5b through the multiplicities `Σ_π mult(π) = d^Z_j` used in 7.10a–7.11. GluedTargetAndDivisionInequality states the same dependence in its Layer 8 setting. So the total congruence bound stands on a statement that neither a reader nor an implementer can check.

The route of 7.5a (line 432) says "(a): the route is not given here". The References (line 1663) make [FormalProof] the reference of every *NEW* target, but no target names a module or declaration of it. The operator's copy is a Lean kernel export of about 2.7 million constants, with no source text and no docstrings, so it cannot be searched without a name.

Clause (a)(ii) asks for an archimedean Schwartz function on `W_j ⊥ ℍ^t` whose doubling zeta integral at `s = t/2` is nonzero. This is the local question that GQT14 (lines 299–305, with Theorem 1.4 (ii) at lines 290–294) could not settle for unitary groups: there it is open whether the local theta lift at a real place is nonzero exactly when the normalised doubling zeta integral is nonzero on the image of the Schwartz space. The cases it does settle are split archimedean places and `m = d(n) + 1`. Here every archimedean place of `F` is non-split in the CM field `E`, and `m = r + 2t`, `d(n) = r + t`, so `m = d(n) + 1` only when `t = 1`.

The repair is either of two things:
- name the declaration or declarations of [FormalProof] that prove (a)(ii) (a declaration name is an exact locator in a Lean formalisation);
- give (a)(ii) a route with a published locator.

For (a)(i), see R02. The same missing locator leaves the README's accounts of what [FormalProof] does and does not state uncheckable (lines 326–327, 543–546, 557–558, 691–700, 847–848, 1160–1163, 1215–1216). One declaration name at each would fix them.

## R02 (P2) — The route of 7.5a says the complementary space `W_j` enters only the second Laurent coefficient; the first-term identity expresses the residue itself through `W_j`, and that proves (a)(i)

The parenthetical at lines 441–444 is the stated reason for leaving (a)(i) without a route: "the complementary space `W_j` enters only the next coefficient, and only modulo the image of the residue". It describes Theorem 1.2 (ii) of GQT14. It is false as a statement about the residue, and it hides a short proof.

GQT14 Theorem 7.3 (i) (lines 1693–1700, arXiv v3 numbering; Kudla–Rallis, and Ichino 2004 Theorems 4.1 and 4.2 for unitary groups) applies when `m + m′ = 2d(n)` with `m > m′ > 0`, including `r′ = 0`. Its conclusion is `A_{−1}(φ) = κ·B^{n,0}_0(Ik(π_K φ))`, where `B^{n,0}_0` is the theta integral of the anisotropic complementary space (GQT14 line 777).

Here `V = W_j ⊥ ℍ^t` has `m = r + 2t` and Witt index `t ≤ n = r + t`. The complementary space is `W_j` itself: `m′ = r`, and `r′ = 0` because a totally definite space is anisotropic. The pole is at `s_{m,n} = t/2`, as in 7.5a.

So the residue at `t/2` of the doubling zeta integral of `y ⊗ ȳ` is `κ` times the integral over `[U(V_j)]²` of the theta integral of `W_j` paired against `y ⊗ ȳ`. Through the doubling map (MetaplecticAutomorphicForms §6.10), that is a sum of Petersson products `⟨θ(φ₁, y), θ(φ₂, y)⟩` of theta lifts of `y` to `U(W_j)`, and it vanishes when every such lift vanishes. All groups involved are definite, so every integral is over a compact quotient.

Replace the parenthetical with this route for (a)(i), stating GQT14 Theorem 7.3 (i) with `r′ = 0` as a *KNOWN* input of 7.5a with its locator. MetaplecticAutomorphicForms §§6.4–6.6 state GQT14 Theorems 7.1, 7.3 (ii), 7.4 and 1.2, but not 7.3 (i), so no supplier section covers it. After this repair, only (a)(ii) is without a route (R01).

## R03 (P2) — Check (i) of 7.7a says the generator choice needs `ℓ > t + 1`, but `ℓ > t` suffices

At lines 646–647 the Check concludes "so the generator choice requires ℓ > t + 1". With `χ_cyc(g)` a generator modulo `ℓ`, every factor `1 − χ_cyc(g)^{−i}` with `0 < i < t` is a unit as soon as `t − 1 < ℓ − 1`.

For example, take `ℓ = 5`, `t = 4` and `χ_cyc(g) ≡ 2`. Then `1 − 2^{−1} ≡ −2`, `1 − 2^{−2} ≡ −3` and `1 − 2^{−3} ≡ −1` modulo 5, all units, and the residual roots `χ̄_1(g)·2^{−(c−1)}` are distinct. The example in the Check (`ℓ = t = 3`) fails because `ℓ ≤ t`. LengthBoundsInPadicFamilies §1.8e (4), in its Check, states the sharp form: `p ≤ t` fails.

Write "so the generator choice needs `ℓ > t`; 7.7a assumes `ℓ > t + 1`". The statement of 7.7a is unaffected.

## C01 — Headline (3) of the Summary does not say for which cut `c(π)` is formed

At lines 20–22 the Summary bounds "the congruence ideal" at a lifted point whose residual representation has an absolutely irreducible rank-`r` part. The bound of 7.7b is for `c(π)` relative to a cut `X_s` whose points satisfy the inertial relation (R)(iii) at the type places, such as the cut by the type or by a label tuple (7.1 (2), (3)). The other clauses of (R) and (L′) hold for lifted points by 7.4 (4), (8). Adding "for the cut by the type" would make the headline match 7.7b.

## C02 — 7.10a names two family roadmaps as suppliers of chain data that no *Needs:* line or supplier contract mentions

The hypothesis at lines 940–941 asks for "chain data of Layers 2–5 of the family (ThetaChainsOnDefiniteUnitaryGroups, TaylorBoundsAndDepthsOnHeightTwoFormalGroups, LocalGainOfThetaChains, RowTowerAndRallisIdentities)". The second and third appear in no *Needs:* line, no `## Exact supplier contracts` subsection and not in the layer's Dependencies, so a reader cannot tell what 7.10a takes from them. Both are earlier in the family's order, so this is not an upward citation. Either name their sections and add the contracts, or drop them from the hypothesis if nothing of theirs is used.

## C03 — The Check of 7.11 says the bound "fails" without the budget, which nothing shows

At lines 1165–1166 the text says that without the budget "the bound fails". No host is given for which the inequality is false. What the sentence supports is that this layer has no other input bounding the groups `Ш¹(E, ℓ, e)`, and that is how it should read. As a Check it tests nothing; it would read better as a remark.

## N01 — The section numbering is the family's, which the README does not say

The single layer is Layer 7. Its sections skip 7.2, 7.3 and 7.12–7.14 (7.12–7.14 are GluedTargetAndDivisionInequality's). One sentence in the Conventions saying that the numbers are shared across the family would stop a reader from looking for missing sections. The placement of 7.9 before 7.6 is already explained (line 209).

## N02 — 7.4 (1) fixes the Frobenius normalisation by stipulation; a rank-one Check would pin it

Something like this would do: for `r + t = 1`, the root of the Hecke polynomial is the inverse of the value of `BC(Π)_w` at a uniformiser. By the Conventions, that is the value of `r_x` at the arithmetic Frobenius, and the inverse convention would give the value at a uniformiser itself.

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| 7.1 Check | `M = {(a,b) : a ≡ b mod ℓⁿ}`, `Z_good` the first point; split `M` | `e_YM = O`, `M ∩ V_good = ℓⁿO`, so `η = n`; split: `η = 0` / same | holds |
| 7.1 (2), (3) | LengthBoundsInPadicFamilies §1.7a (4), (4′) with `Z′ = Z_good ∩ X_𝔪`, `Z = Z_good ∪ (X_𝔪 ∖ X_s)` | `X_𝔪 ∖ Z = X_s ∖ Z` because `Z ∩ X_s ⊂ Z_good`, so `cc_Z(π) = c(π)`; `A_α = \|G₀\|` | holds |
| 7.4 (1) | `n = r + t = 1, 2`; geometric-uniformiser convention | roots `β·N^{(1−n)/2}` equal the arithmetic-Frobenius eigenvalues of `rec(BC(Π)_w ⊗ \|det\|^{(1−n)/2})`; `T_{w,k}` defined by this | consistent |
| 7.4 (5), (6) | polarisation `r^c ≅ r^∨ ⊗ χ_cyc^{1−n}`; Jacquet–Shalika bound | `HT_{τ∘c} = (n − 1) − HT_τ`; `\|α\| < N^{1/2}` for unitary generic components | holds |
| 7.5 (1) | twists in rank `n = r + t` | `−(n − r)/2 = −t/2`; `(t−1)/2 − (c−1) − (n−1)/2 = −r/2 − (c−1)`; block weights `{0, …, t−1}` | holds |
| 7.5 (2) | `χ_1` at place `c` of `Speh(χ, t_i)` | Jacquet–Shalika bound and unitarity give `t_i = t + 2(c−1)`; only `t` residual characters, so `c = 1`, `t_i = t` | holds |
| 7.5a (a)(i) | GQT14 Theorem 7.3 (i), `m = r + 2t`, `m′ = r`, `r′ = 0` | README: `W_j` enters only `A₀` / GQT14: `A_{−1} = κ·I_{W_j}(Ik π_Kφ)`; residue vanishes when the lifts vanish | R02 |
| 7.5a (a)(ii) | real places non-split, `m = d(n) + 1` iff `t = 1` | no route, no locator / GQT14 lines 299–305 leave this local question open | R01 |
| 7.5b | the dimension count | `dim V_x ≤ dim(Σ-part) = dim(image) ≤ dim V_x`; injectivity of the descent needs 7.5a | conditional on R01 |
| 7.9 (a) | Tau Ceti Jordan theorem at `p ∈ (N/2, N−3]` | `p + 3 ≤ N` holds; transitive with a `p`-cycle, `p > N/2`, so primitive; solvable image cannot contain `A_N`, `N ≥ 8` | holds |
| 7.6 (a) and Checks | window count; `SizeThin`; Check (ii) | `2(Sc+2η_s+2σ⁺+4)+1` integers; `m ≤ r` gives `< w″`; low `= (t−1)/2 + (t+3)/2 = t+1`, distance 2 | holds |
| 7.7a | `v_δ`; generator choice at `ℓ = 3, t = 3` and `ℓ = 5, t = 4` | `v_δ = 2` / 2; at `ℓ = 5, t = 4` the factors `−2, −3, −1` are units, so `ℓ > t` suffices | R03 |
| 7.7b (i), (ii), Check | LengthBoundsInPadicFamilies §1.8e (2) with `Col = ∅`, `N = r` | constant `4(r+t)v_δ`; `Σ_bΣ_wν = Σ_w(ν_ρ + tν_χ)`; all terms 0 give `c(π) = O` | holds |
| 7.7b formal form, 7.10b | `e_ρ = 2r·e_max`, `e_χ = 2e_max`, `#{w} = 2f` | `2f(2r + 2t)e_max = 4f(r+t)e_max` / matches 7.10b | holds |
| 7.7d | `dim H¹_f` with `χ_cyc` of weight `−1` | `ℚ_ℓ(1)` has `dim H¹_f = 1`, so negative weights count; only the `m` lows, giving `≤ n_u·m` | holds |
| 7.8 (1), (2) | (H5) at `o_δ = 15`; `ε′/(2t)` | `ζ₃ − 1 \| 3` (ℓ ≠ 3), `ζ₅ − 1 \| 5` (ℓ = 3), units; SelmerLengthBounds §3.26 clauses 1, 3 with `ν_s = v_ℓ(w_{tr}(E))` | holds |
| 7.10a | `χ_1(ς₀) − 1` at `A(ℓ)`; row 5; row 4 constant | `Φ₁₅(1) = 1` so unit; 2 splits iff `d ≡ 7 (8)`; §4.10d (4) at `n = 2`: `3re + 8me′ + 3(rS + 2m((H+1)/(ℓ−1)+1))` | holds |
| 7.10b | `v_ℓ\|G₀\|` | `f·r(r−1)/2 + f·Σ_{a≤r}2a = f(3r² + r)/2 ≤ 2fr²` | holds |
| 7.10c, 7.11 (headline 1) | `L = x^ε`, `B₀ = fmbx^ε`; UniformWildKernelBounds §7.6 with `κ = C_t` | `fmbL² = x^εB₀`; `V(E,t) ≤ V(E,⌊x^{C_t}⌋) ≤ b ≤ B₀`, so `κ_W = 1` | holds |
| 7.8 (2) (headline 2) | SelmerLengthBounds §3.26 | `Q = 𝔓 ∪ c𝔓`, `#Q ≤ 4R`; Selmer length `≤ ν_s + ε′`; tame cost `≤ ε′` | holds |
| 7.15 Check and (b) | `M = 𝒪²`, `ℓ = 2` unramified, `Z` the diagonal; odd `ℓ` | `PM = 𝒪(1,1)/2`, `(PM)^∨ = 𝒪(1,1)`, `eη = 1`, `ℐ = ℐ⁺ = 1` = bound; odd `ℓ`: `0 = 0` | holds |
| 7.16 Check (ii) (headline 4) | `ℚ(i)`, `ℓ = 19`, `λ = (44,0)`, `μ = (25,19)` | shifted `{45,0} ≡ {26,19} ≡ {7,0}`; `κ = 3`; `mw = 0`; `dp = 19 > 0`; `β̄ = ᾱ^{19}` | holds |
| 7.16 *Stabilisers* | `ℓ` unramified, `n + 1 < ℓ` | `Φ_ℓ` irreducible over `E`, degree `ℓ − 1 > n` | holds |
| 7.16a (3)(b), Check | `\|Φ_th\| ≤ f/2`; bottom alcove | `30·(f/2)·mbx^{2ε} = 15x^εB₀`, `+ 2mb ≤ x^εB₀`; `ℓ > ⟨λ+ρ, α^∨⟩` gives `Δ = ∇`, `ex = 0` | holds |
| Summary headline (3) | 7.7b hypotheses | (R)(ii), (iv), (v) and (L′) automatic for lifted points; (R)(iii) needs the type cut | C01 |

- Source locators checked against the text: GQT14 Theorems 1.2, 1.3, 1.4, 7.1, 7.3, 7.4 and lines 299–305, 777, 1707 (operator-local arXiv v3); [Announcement] read whole (4 pages); [FormalProof]: none, since the README gives no locator.
- Library declarations opened at the pins: `TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem` (`TauCeti/GroupTheory/Perm/Jordan.lean:154`), `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:105`), Mathlib's `continuousCohomology` (`Mathlib/RepresentationTheory/Homological/ContCohomology/`). Neither pin has crystalline or de Rham representations, Hodge–Tate weights, Bloch–Kato `H¹_f`, Wach modules, algebraic modular forms or congruence modules, which confirms the docstring of `Suggested.lean`.
- Cross-roadmap citations resolved: 43 section ids on main (AutomorphicGaloisRepresentationsPartII, IntegralHeckeAndGaloisDeterminants, ArithmeticGaloisDuality, AutomorphicLFunctionsAndLocalFactors, SmoothRepresentationsOfLocalGroups, AutomorphicFormsOnReductiveGroups, AlgebraicModularFormsAndSerreWeights, ReductiveGroups, ClassFieldTheory, ArithmeticGaloisRepresentations, AnalyticNumberTheoryPartI, ArithmeticStatisticsPartIII, Chebotarev, PadicFamilies, SelmerIwasawaCohomology, PhiGammaModulesAndIwasawaCohomology, EndoscopicTransferAndUnitaryTraceComparison, MetaplecticAutomorphicForms). Supplier statements read at the open heads: LengthBoundsInPadicFamilies §§1.7a, 1.8e; SelmerLengthBoundsAndLocalLifting §§3.26, 4.10d (4); UniformWildKernelBounds §7.6; RowTowerAndRallisIdentities §5.9; ThetaChainsOnDefiniteUnitaryGroups §2.1.
- Consumers: every id that GluedTargetAndDivisionInequality, ThetaChainsAndFrobeniusPrimeSums and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties cite here (18 distinct, among them 7.10a ×37, 7.11 ×26, 7.15 ×17) exists in this README.
- Dependency check against the candidate order: `depcheck: 171 roadmaps, 2003 edges, 0 problem(s)`. The family's own order puts TaylorBoundsAndDepthsOnHeightTwoFormalGroups and LocalGainOfThetaChains above this roadmap.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so the `#check @name` comparison had nothing to compare and nothing changed.
- Automatic checks: every check passed on the worker's run; my own run flagged only the two items set aside below.

Overlap check: read GluedTargetAndDivisionInequality, ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, RowTowerAndRallisIdentities, SelmerLengthBoundsAndLocalLifting, AutomorphicGaloisRepresentationsPartII, AutomorphicGaloisRepresentations, EndoscopicTransferAndUnitaryTraceComparison and LengthBoundsInPadicFamilies. The shared objects and their owners:
- congruence modules and the Ribet-type bounds belong to LengthBoundsInPadicFamilies (cited; this roadmap states the instances);
- twist selection belongs to SelmerLengthBoundsAndLocalLifting §3.26 (cited; 7.8 is the instance);
- the Galois representations of definite unitary groups belong to AutomorphicGaloisRepresentationsPartII and BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1 (cited; 7.4 is the chain's instance, and the README says how it differs);
- the congruence lengths, the dual index and the Weyl exponent belong to this roadmap, and the two consumers cite them.

Source independence: 7 passages compared by hand with 2 sources (7.5a statement and route against GQT14 Theorems 1.2–1.4, 7.3 and §11; the Summary, the Conventions on routes, the References entries and the `Suggested.lean` docstring against [Announcement]), and the whole README and `Suggested.lean` by shared runs of 8 words. Nothing is shared beyond bibliographic titles (the longest run, 15 words, is GQT14's title). The largest share is [FormalProof], with 10 of the 10 in-text source citations, none with a locator. Contents could not be compared with [FormalProof], which is a kernel export with no text or table of contents. The single layer follows the dependency order stated at line 209.

Research link: Layer 7 is the congruence-module input of the theta-chain route to the Riemann hypothesis for Dirichlet L-functions in Alpöge's formal proof announced in 2026. Its methods are Ribet's (1976) and Hida's (1981) congruence modules, Bloch–Kato Selmer groups (1990) and the Gan–Qiu–Takeda (2014) Siegel–Weil and Rallis formulas. This line rests on the README's motivation and References and on GQT14.

## Not verifiable

- [FormalProof]: the operator holds only a Lean kernel export (no source text, docstrings or module list), and the README names no declaration. None of the 15 sampled targets could be checked against it, so each was checked by computation and against its suppliers.
- [FormalProof], the GitHub repository the References link: the sources service has no licence class for the host, so I did not open it.
- The classical works of the References (Ribet, Hida, Arthur–Clozel, Labesse, Chenevier–Harris, Caraiani, Barnet-Lamb–Gee–Geraghty–Taylor, Moy–Prasad, Jacquet–Shalika, Kudla, Howe, Piatetski-Shapiro–Rallis, Kudla–Rallis, Ichino, Yamana, Bushnell–Kutzko, Henniart, Bushnell–Henniart, Shintani, Jordan, Bellaïche–Chenevier, Donkin, Wach, Colmez, Berger, Bloch–Kato, Fontaine–Laffaille, Greenberg, Wiles, Poitou, Tate, Sah, Gross, Minkowski, Jantzen) carry no theorem or page locators in the README and were not opened.

Automatic checks set aside as false positives: two items, both from my own run. Against the default merge order, the check of files outside the folder flags the three family-index files, which this pull request owns. The dependency check reports the roadmap as not yet placed in the order; against the candidate order it reports no problem.

## Source issues

- none

## For the human reviewers

- Scope: the principal source, [FormalProof], is an unrefereed Lean formalisation announced on 20 November 2026. [Announcement] (`https://alpo.ge/remark.pdf`, four pages) gives no mathematical account. The theory this layer instantiates (Ribet 1976, Hida 1981, Bloch–Kato 1990, Gan–Qiu–Takeda 2014) is published.
- Licence: I fetched [Announcement] from `alpo.ge`, vouching that it is the author's own page. The operator's copy of [FormalProof] is a kernel export with no licence file, and the sources service classifies no host for the GitHub repository the README links.
- Not tested: [FormalProof] has the largest share of the source citations, but there is no readable text or table of contents for it here, so the wording and arrangement checks were not run against it.
