# Review of GrossZagierAndArithmeticHeightsPartII (pull request #2457 at 5bccce0)

**Verdict:** accepted

**Summary.** Accepted: no statement of the roadmap was found false, unsupported or unowned, and both findings of the previous review are repaired. The one mathematical change since then, the removal of the GSpin section in favour of GrossZagierAndArithmeticHeights §6.20a, is sound: that section exists at its open head with the parts (a)–(d) cited, and its hypotheses contain the case p = 2n − 2 used in §§12.6b and 12.7. There are three small corrections (a section locator in Zhang's paper that does not exist, a supplier not named where its theorem is used, and text left over from the moved section) and one format note, none blocking. Two questions of scope and two of licence are left for the human reviewers.

## Deferred findings

- D01 — resolved: §12.6a left this folder; GrossZagierAndArithmeticHeights §6.20a owns both objects, and ComplexMultiplicationAndExplicitReciprocityPartII's head cites §6.20a(e)–(f) as their owner.

## C01 — §§12.2 and 12.11 cite subsections 10.1 and 10.2 of Zhang's paper, which has none in its section 10

A reader who looks for "Z §10.1" or "Z §10.2" finds nothing: in the version the References cite, §10 (Z line 2569) runs without numbered subsections to §11 (Z line 2647). Its results are numbered Theorem 10.1 (Z line 2579), Remark 10.2, Corollary 10.3 (Z line 2628) and Corollary 10.4, and §9 is the last section before it with subsections (9.1–9.4). The theorem and corollary numbers in the two citations are right; only the section labels are wrong.

In §12.2 (README line 1429) write "Z §8.2, Proposition 8.2; §10, Theorem 10.1", and in §12.11 (line 1593) write "Z §10, Corollary 10.3".

## C02 — §12.5 builds the unitary Borcherds product from the orthogonal one without naming the roadmap that proves the orthogonal one

The route of §12.5 (README line 1481) "constructs ψ(f) by pulling back Borcherds' product from the orthogonal Shimura variety", and its statement cites Bor98 Theorem 13.3 for that product, but the *Needs* line (line 1501) names no supplier for it, so an implementer cannot tell whether Borcherds' theorem is to be proved inside §12.5 or imported. It is a supplier's theorem: GrossZagierAndArithmeticHeights §6.20a(e), at its open head, constructs Ψ_j(f) for a quadratic space of signature (p, 2) over ℚ with p ≥ 3 and weight 1 − p/2, which at p = 2n − 2 is the weight 2 − n and the range n ≥ 3 of §12.5 (2n − 2 ≥ 3 exactly when n ≥ 3). The contract for that roadmap (line 1942) says §6.20a is "used in §§12.6b and 12.7" only.

Add "GrossZagierAndArithmeticHeights §6.20a(e)" to the *Needs* line of §12.5 and to the Layer 12 dependencies, and "12.5" to the list of users in the contract; or, if §12.5 is meant to construct the product itself from the theta lift of §12.4, say so in the route.

## C03 — Three passages still describe the GSpin section that moved to GrossZagierAndArithmeticHeights

The Examples of Layer 12 (README line 1605) end with two sentences about objects this layer no longer treats: the modularity that "comes from Kudla–Millson and the vanishing of the first Betti number", and the GSpin curves of x² − 3y² − 3z² and x² − y² − z². Both are true and are Checks of GrossZagierAndArithmeticHeights §6.20a, but a ternary form has p = 1, which no unitary pullback reaches (p = 2n − 2 is even), so they illustrate the supplier and not this layer. Either cite §6.20a at these sentences or replace the second by a unitary instance (over ℚ and n = 2 the space has signature (2, 2), reached there through its pullback (c)).

In the References, three entries list locators that no target cites any more: Bor99 keeps "§2, p. 3", "Theorem 4.1 and its proof", "Lemmas 4.3–4.4", "Theorem 4.5" and the remark of p. 10, while only Theorem 3.1 is cited (§12.5); YZZ09 keeps Proposition 3.1 and §4.1, while only Theorem 1.3 is cited (§12.7); KM90 keeps Theorem 2, while only Theorem 3 is cited (§12.6b). Trim each list to what the text cites.

## N01 — Page numbers for Zhang's paper are in a pagination the References do not name

The References say that locators into Z "are section, theorem and equation numbers, which agree between the two versions", yet about a dozen citations add pages (Remark 8.5, p. 42; Appendix A, Theorem A.1, p. 73; Lemma B.2(ii), p. 77). They are the pages of arXiv v3 (Z lines 2349, 4330); the Annals pages differ. Add "page numbers are those of arXiv v3" to the entry.

## Previous findings

- R01 — repaired: the Check of §13.9 now reads "obtained by dividing the bracket … of LL1 (9.3), p. 44, and of §4.6 by (q_v^(2r) − 1)/(q_v+1)", and the Source corrections carry the entry on LL1 Proposition 9.1 and (9.2).
- R02 — repaired: §5.4 reads "which for t ≥ 6 uses the case ²D_n, n = t/2 ≥ 3, of Lusztig76 7.3 with 6.1"; the Layer 5 dependencies and the Lusztig76 reference agree, and the sentence on an omitted case t = 6 is gone from the Source corrections.

## Verified sound

| # | Statement | Instances tried | Values computed (README side / check side) | Result | Change |
|---|---|---|---|---|---|
| 1 | 0.1 Hom convention (sample) | rank one, h(x,x) = ϖ^a; scalar a | h(ax,y) = a·h, H(ax,y) = ā·H; dual ϖ^(−a)O_F·x for both; LZ lines 304–319, 411–422 | holds | none |
| 2 | 0.2 unramified cycles (sample) | x = 0; negative valuation; unit multiple | Z(0) = N_n; lifted homomorphisms form an integral lattice (LZ line 424); dependence on the span only (LZ line 432) | holds | none |
| 3 | 0.9, 3.5 unramified identity (sample, headline) | a = 1, 3, −3 | D = 1−X, 1−X+X²−X³; −D′(1) = 1, 2; (a+1)/2 at −3 is −1 against 0. LZ lines 448–450, 712–718 | holds | none |
| 4 | 1.3 horizontal degree | valuation 2 | D = (1−X)+X²; D(−q) = 1+q+q² = (q²+q)+1, the two primitive degrees | holds | none |
| 5 | 2.1 Coxeter eigenvalues | d = 1; 0 < 2j ≤ d | degrees 1, 1, 2 for m = 0, 1, 2; 1+q²+q(q²−q) = q³+1; dual eigenvalues q^(2j), −q^(2j−1) | holds | none |
| 6 | 2.4, 2.7 local modularity (sample) | type-three Λ | −q²(1+q)+(q³+1) = 1−q²; transform (q³−q)/q = q²−1 on Λ; shell −(1+q)/q+1/q = −1. LZ lines 1773–1810 | holds | none |
| 7 | 3.1 Whittaker normalization | n = 1, valuation 1; L = ⟨ϖ⟩ | W′ = (1+q⁻¹)·2 log q; count (q+1)q^N over q^N gives q+1, not Den = 0 | holds | none |
| 8 | 4.3, 4.5 almost self-dual identity (headline) | a = 0, 2 | D_Λ = (1−X)(1+qX)+X²(1−X); −D′(1) = q+2; (q+1)·1 = (q+2)−1; a = 0: 0 = 1−1 | holds | none |
| 9 | 5.2 modular line (sample) | type-four ℙ¹ | χ([O]−[ω]) = 1−((q−1)+1) = 1−q; LL2 lines 1193–1208, 1274–1285, 1339–1340 | holds | none |
| 10 | 5.5, 6.8 exotic identity (headline) | (b₁,b₂) = (0,0), (0,1), (1,1), (1,2) | 2, 4, 2(q+3), 2(2q+4); density side at invariants (1,3): 2·2 = 4 | holds | none |
| 11 | 6.1 exotic density | invariants (1,1), q = 3 | D = 1−X²; Den(H₂,L) = (1−q⁻²)(1−q⁻⁴) = (8/9)(80/81) = 640/729 | holds | none |
| 12 | 6.2 exotic split (sample) | definition against LL2 | 2·#{M : t(M ∩ H) = 1}; LL2 lines 682–692 (Definition 2.20), 1461–1525 (2.45–2.50) | holds | none |
| 13 | 6.5 exotic curve function | on Λ | −q(1+q)+(q²+1) = 1−q; transform (−1−q+q²+1)/q = q−1 | holds | none |
| 14 | 6.7 two-overlattice case | a = 3 example | norm(u⁻¹e ± x₀) = −β+β = 0; h(e, ·) = −βu, valuation one | holds | none |
| 15 | 6.9 relative and absolute (sample) | F₀ = ℚ_p; scaling u²/ϖ | unit scaling keeps valuations; LL2 lines 2176–2202 (Corollaries 2.65–2.66, isometry) | holds | none |
| 16 | 7.5a, 8.7 Krämer identity (headline) | (α,β) = (0,0), (0,1), (1,1); H₁; diag(−π₀u₁, −π₀u₂) | χ = 1: 0, 1, 2−2q; χ = −1: 0, 1, 2+2q; H₁: 1−q; ∂Den = 3(1−q)+(q−1) = 2−2q | holds | none |
| 17 | 8.4 partial integral | ⟨1⟩ ⊥ ⟨π₀⟩, norm −π₀⁻¹ | det = (N(β)−1)−N(β) = −1; complement ⟨π₀⟩ ⊥ ⟨−π₀⁻¹⟩ split; value 2q·vol(L♭) ≠ 0 against K line 3451 | holds | none |
| 18 | 8.6 hypothesis (H_n) | H₁ | norm(l₁+πl₂) = −2π₀, valuation 2 = val(H₁); coefficient 1/(2π) ∉ O_F; K lines 3934–3936 fail there | holds | none |
| 19 | 9.2 semi-Lie intersection (sample) | definition against Z | Z lines 750–777: the same graph–diagonal product and projection formula; finiteness for regular semisimple pairs | holds | none |
| 20 | 9.3 orbital integrals | ℚ₃, γ = ((−2,1),(−3,2)) | γ² = 1; shells v(t) = 0, −1 give 1−3^s; det γ = −1, det(e, γe) = −1, ω = 1; ∂Orb = −log 3 | holds | none |
| 21 | 9.4 Cayley comparison (sample) | block identity; factor √ε | Schur complement: det(1−g′) = (1−d)·det(1−g); N(√ε) = −ε. Z lines 868–870, 919–935, 1017–1035, 1071–1078 | holds | none |
| 22 | 9.8 low rank | ℚ₉, γ = ((−4,1),(−15,4)) | γ² = 1 (16−15); v(1−16) = 1; 1−9^s; ∂Orb = −log 9 = −1·log q | holds | none |
| 23 | 12.1 divisor series (sample) | constant term | Z lines 2184–2198: −φ(0)·c₁(ω), weight-n Whittaker factors, values in Ch¹ ⊗ ℚ | holds | none |
| 24 | 12.2 CM fixed line (sample, C01) | u ⊥ z_δ | u lies in the δ-stable z_δ^⊥, so is not cyclic; Z lines 2255–2259, 2579–2597; no §10.1 in Z | holds; locator | C01 |
| 25 | 12.5 Borcherds products (sample, C02) | plane Q = −x²−y²; criterion | [w,w̄] = −4, ‖w‖² = 1/(πe^γ); BHKRY lines 3038–3050, 3453–3460, 4787–4789; Bor98 line 2589 | holds | C02 |
| 26 | 12.6b, 12.7 Chow modularity (headline) | n = 2, 3; [F₀:ℚ] = 2 | p = 2n−2: weights 2, 3; signatures (2,2), (4,2); [x,x] = 2Q(x); supplier (a)–(d) read at its head; Liu11a pp. 873–876 | holds | none |
| 27 | 12.9 CM series (headline) | n = 2, 3 | weight 2−n = −1 gives uniqueness, 0 does not; [E:F₀]/[E:F] = 2 | holds | none |
| 28 | 13.3 admissible data (sample) | K (G0)–(G5), (H1)–(H4) | K lines 4055–4074, 4099–4109: six lattice and level conditions, four moduli conditions, each matched | holds | none |
| 29 | 13.9 modified derivative (sample) | q = 3, n = 2 | ratio 4/8 = ½, c₀·ratio = −⅛; (9.2) times (q^(2r)−1)/(q+1) gives (q^r+1)/(q+1), not 1/(q+1). K lines 219–232 | holds | none |
| 30 | 13.8, 13.10 arithmetic Siegel–Weil (headline) | F₀ = ℚ; ramified v, n ≥ 4 | an imaginary quadratic field ramifies, so F₀ ≠ ℚ; LZ line 3857; K lines 4161, 4179; (H_m) carried | holds | none |
| 31 | 14.2 corrected derivative | expansion | (2∂J+Int_(K−B))+Int_B = 2∂J+Int_K; Z line 3903 against 3981 and 3999 | holds | none |
| 32 | 14.4 orbitwise AFL (sample) | Z Corollary 14.8 | Z lines 4062–4075: q(u) ≠ 0, nonnegative away-from-v test function; Lemma 13.7, Proposition 13.8 at lines 3698, 3720 | holds | none |
| 33 | 14.5 strongly regular AFL (headline) | (n,p) = (3,3), (5,5) | residues of F¹: 4, 6; excluded values up to n+1 = 4, 6; the step uses S_(n−1) only at p′ ≥ n | holds | none |

- Source locators: about 95 checked against 9 cached texts (LZ, Z, LL2, K, LL1, BHKRY, Bor98, Bor99, Liu11a), among them every locator of the fifteen sampled targets; one pair wrong (C01). Liu11a pages were recomputed from the printed headers.
- Pinned declarations opened: `Module.equiv_directSum_of_isTorsion` (Mathlib/Algebra/Module/PID.lean:230), `IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean:46), `TauCeti.FormalScheme.Spf.carrier` (Carrier.lean:73), `TauCeti.FormalScheme.Spf.structureSheaf` (StructureSheaf.lean:262), `Matrix.localDensity` (LocalDensity/Basic.lean:546), `TauCeti.AlgebraicGeometry.Chow.ChowGroup` (Chow/Basic.lean:295). Neither pin has Rapoport–Zink spaces, Shimura varieties, hermitian densities, orbital integrals or arithmetic Chow groups.
- Cross-roadmap citations resolved by heading: 27 suppliers and about 150 section citations, on main or at the open heads of PELModuliPartII, LubinTateFormalModulesAndQuasiCanonicalLifts, MetaplecticAutomorphicForms, EndoscopicTransferAndUnitaryTraceComparisonPartII and GrossZagierAndArithmeticHeights; all found, including §6.20a with parts (a)–(f). No roadmap cites a section of this one that the head drops.
- Automatic checks rerun at this head: every check 0. Dependency check: `depcheck: 199 roadmaps, 2183 edges, 0 problem(s)`. The diff outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there is no signature to `#check` and nothing to probe for padding; each of the eight headlines is named in the module docstring with the carriers it lacks.
- The pull request's title and description agree with this head, including the pullback from GrossZagierAndArithmeticHeights.

Overlap check: read PELModuliPartII, GrossZagierAndArithmeticHeights, ComplexMultiplicationAndExplicitReciprocityPartII, MetaplecticAutomorphicForms, EndoscopicTransferAndUnitaryTraceComparisonPartII, EndoscopicTransferAndUnitaryTraceComparison, HilbertModularVarietiesAndShimuraCurves and AutomorphicLFunctionsAndLocalFactorsPartII. PELModuliPartII owns the Rapoport–Zink spaces and the exotic strata (§3.7), cited; special cycles are this roadmap's. GrossZagierAndArithmeticHeights owns the GSpin divisor modularity and orthogonal Borcherds products (§6.20a), cited. MetaplecticAutomorphicForms owns the uncertainty principle (§3.3a), cited. The two endoscopic roadmaps own Jacquet–Rallis transfer, requested by declared gaps. Nothing else shared.

Source independence: 13 passages compared with 6 sources (LZ, Z, LL2, K, BHKRY, LL1), none shared beyond formulas and standard names; largest share LZ and Z, 63 each of 307 locators; contents compared with LZ (15 sections) and Z (15 sections): independent. Layers 1–3 regroup LZ §§3–8 (its §3 enters Layer 3 after §§4–6, its §5 is split over Layers 1 and 2); Layers 9, 11, 12 and 14 each merge several sections of Z with other sources, in an order forced by the *Needs* lines of §§11.5, 12.8 and 14.2.

Research link: The local targets are the Kudla–Rapoport identities of Li–Zhang (2022), Li–Liu (2022) and He–Li–Shi–Yang (2023); Layers 13–14 are the arithmetic Siegel–Weil formula of Li–Zhang and Zhang's arithmetic fundamental lemma (2021); they feed Li–Liu's arithmetic inner product formula (2021). This rests on the README's References and on LZ, Z, K as read.

## Not verifiable

- Lusztig76 (uncertified, paywalled): 7.3 with 6.1 and 1.18 were not read; §§2.1 and 5.4 are checked only through LZ §5.3 and LL2 Lemma 2.32.
- LL1 Proposition 9.1 and (9.2) in the Annals version: only the author copy the References cite was read.
- The pagination of Z in the Annals version: only arXiv v3 was read (N01).

Automatic checks set aside as false positives: none; every check passed. The two code names the citation search did not find in the pinned sources are named targets of EtaleCohomologyFoundations §§0.7–0.8 on main.

## Source issues

- **Misprint** in LL1 at Proposition 9.1, p. 40, and (9.2), p. 44: the source says the coherent term has coefficient log q_u over q_u^r − 1; it should be log q_u over q_u^(2r) − 1, as (9.3) on the same page requires; affects a stated result.
- **Misprint** in Z at §14.3, the display before Theorem 14.6, p. 70: the source says E♭ is twice ∂J_hol plus Int; it should be ∂J_hol plus Int, as Proposition 14.5 and the expansion in the proof of Theorem 14.6 give; affects nothing.
- **Error** in K at Theorem 8.2, p. 64: the source says the analytic partial integral vanishes at normal vectors of negative valuation; it should assert only constancy at nonnegative valuation (the value is 2q·vol(L♭) for ⟨1⟩ ⊥ ⟨π₀⟩ at norm −π₀⁻¹); affects a stated result.
- **Error** in K at Lemma 9.6, p. 74: the source says every pair (L♭, x) with x outside L♭ ⊕ W has a presentation of smaller valuation; it should exclude lattices whose largest invariant is odd, such as the hyperbolic plane H₁; affects the proof.
- **Gap** in Z at Theorem 5.5, p. 26: the source says joint local constancy holds with no bound on the residue cardinality; it should assume q at least the semi-Lie dimension, which the scalar avoidance borrowed from Proposition 4.12(i) needs; affects a stated result.

## For the human reviewers

- Scope: §8.7 and §13.10 are headlines stated in rank n ≥ 4 under the hypothesis (H_m) of §8.6 (README line 1043), which the README says no published argument proves; K Lemma 9.6 fails as printed (K lines 3934–3936).
- Scope: §14.5 asserts less than Z Theorem 15.1 (Z line 4079): the group version at p = n ≥ 5 is excluded (README line 1851) because of the step discussed in §9.5.
- Licence: LRZ (arXiv:2404.02214v2, README line 2034) is cited as a preprint with no journal reference; it supplies the integral geometry of §4.2, used by the headline §4.5.
- Licence: LL1, LL2 and Zha12 are read from author pages and YZZ09 from an institutional archive (README lines 2028, 2029, 2046, 2047); the LL1 misprint was not checked against the journal.
