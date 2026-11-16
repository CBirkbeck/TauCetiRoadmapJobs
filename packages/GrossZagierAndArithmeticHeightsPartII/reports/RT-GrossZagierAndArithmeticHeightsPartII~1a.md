<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13085#issuecomment-6911113650 -->
Red team round 1 pass a (claude) of 71f5745

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §8.6 is a target with no proof route, and the headlines §8.7 and §13.10 rest on it

   **Location.** `README.md:1126` (§8.6): "A proof may supply a separate identity for lattices containing a hyperbolic block H_b with this property, or a different well-founded invariant for the induction". `README.md:1138` (§8.7): "§8.6 and K's reduction confine the support of Φ_L♭ … to L♭ ⊕ W". `README.md:1862` (§13.10) uses §8.7 at ramified places.

   **Claim.** The Krämer identity Int(L) = ∂Den(L) is proved for every full-rank L, and with it the modified arithmetic Siegel–Weil formula; both are listed as headline theorems (`README.md:1986`, `Suggested.lean:17–19`).

   **Witness.** The only source of the reduction is K Lemma 9.6 (K lines 3934–3975), which the README itself refutes. §8.6 then states what must be proved and gives no route, no source and no supplier. The failure is not confined to rank two or to lattices with a unimodular summand (where K Lemma 9.1 and §7.7 would reduce the rank): for n = 3, L = ⟨e⟩ ⊥ H₃ with h(e,e) = π₀ and H₃ = (0, π³; −π³, 0), L♭ = ⟨e⟩ ⊥ ⟨l₁ + πl₂⟩ has val 2 + 4 = 6 and x = l₂ ∉ L♭ ⊕ W; every Gram entry of L lies in π²O_F and every Gram determinant of a rank-two sublattice lies in π⁶O_F₀ (h(v,v) ∈ π⁴O_F₀ for v ∈ H₃, cross terms in π³O_F), so every L♭′ has val ≥ 6 and no decrease exists; L has invariants (2,3,3), no unimodular summand.

   **Repair.** Either supply a proof with its route, or state the dependence. For the second, replace the last two sentences of §8.6 ("The target is: … would change the theorem of §8.7.") by:

   > For a full-rank integral lattice L write a_n(L) for its largest fundamental invariant. In a normal form the rank-one blocks have even invariants (their norms lie in F₀) and the hyperbolic blocks H_b have odd b, so a_n(L) is odd exactly when every block carrying it is hyperbolic. For every nondegenerate L♭′ of rank n−1 with L♭′ + O_F·x′ = L, the normal component of x′ has norm in F₀, of even π-adic valuation val(L) − val(L♭′); hence val(L♭′) ≥ val(L) − a_n(L) + 1 when a_n(L) is odd, with equality for L♭′ = L₀ ⊥ ⟨l₁ + πl₂⟩ when L = L₀ ⊥ H_(a_n). K's minor count gives only val(L) − a_n(L) < val(L♭). So for x ∉ L♭ ⊕ W the decrease of K Lemma 9.6 exists unless a_n(L♭ + O_F·x) is odd and val(L♭) = val(L♭ + O_F·x) − a_n + 1; when a_n is even the complement of a rank-one block of invariant a_n gives it. Statement (H_n): for every integral lattice L of rank n ≥ 3 in the Krämer special Hom space, of either sign, with all fundamental invariants positive and a_n(L) odd, Int(L) = ∂Den(L). Lattices with a zero invariant are reduced in rank by §7.7 and K Lemma 9.1. No proof of (H_n) is known to this roadmap and none is in K; it is an open step, recorded here with its exact statement. Checks: H₁ (n = 2, invariants (1,1), handled in rank two); ⟨π₀⟩ ⊥ H₃ (n = 3, invariants (2,3,3), minimum of val(L♭′) equal to 6 = 8 − 3 + 1).

   and change §8.7 to "Prove that, if (H_m) of §8.6 holds for 3 ≤ m ≤ n, then for every full-rank lattice L …"; in §13.10 add "at a ramified place the coefficient identity is conditional on (H_n) of §8.6"; in the Summary, in "Acceptance file" and in the `Suggested.lean` docstring, write the Krämer identity and the modified arithmetic Siegel–Weil formula as conditional on §8.6. Tested on the two instances above: both are covered by (H) or by rank two, and neither is claimed proved.

2. **F02** (P1) §14.5 claims the group AFL at p = n through a step §9.5(b) leaves unproved

   **Location.** `README.md:1246` (§9.5(b)): "the converse at q = n is a separate target: … find ξ ∈ F^1 with det(1 − ξg′) and 1 − ξd both units, or prove the implication by another argument". `README.md:1948` (§14.5): "by the q = n step of §9.5(b) for p = n".

   **Claim.** Conjecture 3.8(a) holds over ℚ_p for all odd p ≥ n (also `README.md:3`, `README.md:1986`, `Suggested.lean:23–24`).

   **Witness.** For p = n ≥ 5 (n = 5, 7, 11, …) the passage from the semi-Lie AFL on V_(n−1) to the group AFL for S_n is exactly the unproved converse: q + 1 = n + 1 residues of F^1 against n + 1 excluded values (`README.md:1251`). Z lines 1309–1313 obtain 1 − d ∈ O_F^× from "integrality of det(1 − g)", which is available only when U(V_(n−1)) is compact, that is n ≤ 3. No other route is given.

   **Repair.** In §14.5 replace the first sentence by: "Prove that for F₀ = ℚ_p, p odd: Conjecture 3.8(b) holds for matching strongly regular pairs of S_(n−1) × V′_(n−1) and U(V_(n−1)) × V_(n−1) when p ≥ n; and Conjecture 3.8(a) holds for matching strongly regular elements of S_n and U(V_n) when p ≥ n + 1, and for n ≤ 3 (§9.8)." Replace "and by the q = n step of §9.5(b) for p = n" by "the group version at p = n ≥ 5 is not proved here (§14.6)". In §9.5(b) replace the clause quoted above by: "the converse at q = n is not proved here for n ≥ 4. For n ≤ 3 it holds: V₁ and V₂ are anisotropic, U(V_(n−1)) is compact, so g has integral characteristic polynomial, det(1 − g) ∈ O_F, and det(1 − ξg′) = (1 − ξd)·det(1 − g) a unit forces 1 − ξd a unit." Add the case p = n ≥ 5 to the last sentence of §14.6 and of the scope paragraph (`README.md:11`), and write "p ≥ n + 1 (group version) and p ≥ n (semi-Lie version)" in the Summary, in "Acceptance file" and in the `Suggested.lean` docstring. The induction itself is unaffected: at n it uses the group AFL for S_(n−1) only at primes p′ ≥ n = (n−1) + 1. Tested at n = p = 5: the semi-Lie statement on V₄ is kept, the group statement for S₅ is no longer claimed.

3. **F03** (P1) The Krämer rank-two identity is used as a base case and is neither a target nor cited

   **Location.** `README.md:1138` (§8.7): "rank two and the cancellation law §7.7 give the base cases". `README.md:1114` (§8.5), citing K Lemmas 9.1 and 9.3–9.4. `README.md:1016` (§7.7), citing K Proposition 2.12. `README.md:978` (§7.5), citing K Theorem 4.3.

   **Claim.** Layers 7–8 prove the Krämer identity from the listed suppliers and K.

   **Witness.** K line 3894: for n = 2 the horizontal identity "is a consequence of" Shi's Theorem 1.1 and He–Shi–Yang's U(1,1) Theorem 1.1. K line 614: Int(I₂) = 0 is taken from the same two papers. K lines 1121–1130: the cycles Z_s^±, Z^h(y) and Theorem 4.3 are quoted from them. The README has no rank-two Krämer target (the unramified and exotic settings have §1.4 and §5.5) and its References list none of the three papers.

   **Repair.** Add a target between §7.5 and §7.6, with its Checks and *Needs*, and make §§7.7, 8.5 and 8.7 need it:

   > ### 7.5a Krämer rank-two intersection
   > Prove that for n = 2 and every full-rank lattice L in the Krämer special Hom space V₂, of either sign, Int(L) = ∂Den(L), with ∂Den as in §8.1; in particular Int(I₂) = 0 for unimodular I₂. Prove on the way the decomposition of Z(y), y ≠ 0, on N₂ into the quasi-canonical components of §7.5 and vertical components supported on the exceptional and type-two curves, with their multiplicities, and the intersection numbers of these components (Shi, Special cycles on unitary Shimura curves at ramified primes, Theorems 1.1 and 1.3 and §3; He–Shi–Yang, The Kudla–Rapoport conjecture at a ramified prime for U(1,1), Theorems 1.1 and 4.1 and Corollary 3.11; as used in K Proposition 2.12, p. 15, Theorem 4.3, p. 28, and Lemma 9.3, p. 73).

   Add both papers, and He–Shi–Yang, Kudla–Rapoport conjecture for Krämer models (whose Theorem 4.2, Propositions 2.6 and 3.2 and Corollaries 3.5–3.7 K quotes for §§7.5–7.7), to References and `sources.toml`; I did not read them, so their locators above are K's and need checking against the texts. Tested on the instance: Int(I₂) = δ_odd(2) = 0 of the §7.7 Check then has an owner.

4. **F04** (P3) gap:jr-afl-local-inputs asks the supplier again for theorems an earlier roadmap already requests from it

   **Location.** `README.md:138`: "(ii) … the existence of smooth transfer in both of Zhang's formulations … in both directions"; "(i) … the Jacquet–Rallis fundamental lemma for the unit test functions".

   **Claim.** The gap is minimal and names what is missing.

   **Witness.** `packages/GanGrossPrasadUnitaryGroups/README.md:153` and `:157` (merge order 239, before this roadmap at 350) request from the same supplier `gap:relative-finite-transfer` ("every compactly supported smooth test on G′ has a matching finite family on all U_h and conversely … all ramification and p=2") and `gap:relative-fundamental-lemma`.

   **Repair.** In the contract sentence add, after "that roadmap requests from EndoscopicTransferAndUnitaryTraceComparison": ", and from the existence of smooth transfer and the fundamental lemma in the homogeneous formulation that GanGrossPrasadUnitaryGroups requests from it (gap:relative-finite-transfer, gap:relative-fundamental-lemma)", so that parts (i)–(ii) ask for the passage to S_n and to the semi-Lie space and for the Fourier compatibility, not for a second proof of transfer. Mirror the clause in `design/plan.json`'s `needs`.

5. **F05** (P3) §2.7 uses Hirzebruch–Riemann–Roch without a supplier

   **Location.** `README.md:470` (§2.7): "Riemann–Roch factors the Euler functional through the same quotient"; *Needs* at `README.md:478` and the contract at `README.md:82` stop at SchemeAndStackFoundations §5.7.

   **Witness.** SchemeAndStackFoundations on main: "### 5.8 Grothendieck–Riemann–Roch and Hirzebruch–Riemann–Roch" (χ(X, E) = deg(ch(E)·td(T_X))_n for smooth projective X); §5.7 has K₀, G₀ and ch(L) = e^(c₁(L)) only.

   **Repair.** In `README.md:82` write "§§5.1, 5.3–5.4, 5.7 and 5.8 (… the Chern character, and Hirzebruch–Riemann–Roch on smooth projective varieties over a field)"; add "SchemeAndStackFoundations §5.8" to the *Needs* of §2.7 and to the Dependencies of Layer 2.

6. **F06** (P3) A proper name is in lower case in the title

   **Location.** `README.md:1`: "# Roadmap: gross–zagier formulas and arithmetic heights, part II — …".

   **Witness.** `Suggested.lean:4` has "Gross–Zagier formulas and arithmetic heights, Part II"; titles on main keep proper names ("the Jacobian challenge, part II").

   **Repair.** "# Roadmap: Gross–Zagier formulas and arithmetic heights, part II — unitary special cycles and the arithmetic fundamental lemma".

Six findings: three P1 (R01–R03), three P3 (R04–R06). `packages/GrossZagierAndArithmeticHeightsPartII/README.md` was read in full (2031 lines), `Suggested.lean` in full (51 lines, no declarations).

## The adversarial pass (computed values)

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| §0.5 Tor₁ Check | V₁, val 1 | Z(x) = Spec O/ϖ; Tor₁ = (ϖ)/(ϖ²) ≅ O/ϖ | holds |
| §0.6 curve Check | C ≅ ℙ¹, O(D)\|_C = O(−1) | χ(O_C) − χ(O_C(1)) = 1 − 2 = −1 | holds |
| §0.7 negative control | Λ_j = ⟨ϖ^(−j)e, ϖ^(j+1)f, a⟩ | Gram ϖ·(H ⊥ 1), type 3, det V₃ = −ϖ odd | holds |
| §0.9 | a = 1, 3, −3 | −D′(1) = Σ i(−1)^(i+1) = 1, 2; D = 0 at a < 0 | holds |
| §1.3 degree | n = 2, val 2; val 1 | D(−q) = 1 + q + q²; q + 1; q²·D(−1/q) agrees | holds |
| §2.1 | d = 1 | 1 + q² + q(q² − q) = q³ + 1; dual eigenvalues q^(2j), −q^(2j−1) | holds |
| §2.4 | Λ, isotropic and anisotropic shells | f = 1 − q², 1, 0; f̂ = q² − 1, −1, 0 | eigenvalue −1 |
| §3.1 | n = 1, L = ⟨ϖ⟩ | kernel of norm mod ϖ^(N−1): (q+1)q^N; W′ = (1 + 1/q)·2 log q | holds |
| §3.2 weights | a = 0, 1, 2, 3 | 0, 1, 1 + q, (1 + q)(1 − q²) | holds |
| §3.5 | L♭ = ⟨e⟩, norm ϖ | val(u) = 2, val(u^∨) = −2 | holds |
| §4.3, §4.5 | rank one, a = 0, 2 | overlattices of diag(ϖ², ϖ): two; ∂Den_Λ = q + 2; (q+1)·1 = (q+2) − 1 | holds |
| §5.5, §6.8 | (b₁,b₂) = (0,0), (0,1), (1,1), (1,2) | 2, 4, 2(q+3), 2(2q+4); invariants (1,3): exactly two integral overlattices, since α²ε₁ + β²ε₂′ ≡ 0 needs −ε₁ε₂′ a square | holds |
| §6.1 | type 2, 4; q = 3 | 2, 2(1 − q²); Den(H₂, L) = (8/9)(80/81) = 640/729 | holds |
| §6.5 | Λ of type 4 | −q(1+q) + q² + 1 = 1 − q; transform q − 1, −1, 0 | eigenvalue −1 |
| §6.7 Check | a = 3 | h(u⁻¹e ± x₀) = −β + β = 0; h(e, ·) = −βu; block u·(unimodular), invariants (2,2) | holds |
| §8.4 | n = 3, norms 1, π₀, −π₀⁻¹ | Gram (π₀, β̄; β, (Nβ − 1)/π₀), det −1; 2q classes; value 2q·vol(L♭) | K Theorem 8.2 vanishing fails |
| §8.6 | H₁; ⟨π₀⟩ ⊥ H₃ | norm −2π₀, coefficient 1/(2π); min val(L♭′) = 2, resp. 6 | no decrease (R01) |
| §9.1 Checks | n = 3, 4 | gᵗJg = J; h(u,u) = 1; det(u, gu, g²u) = −1; 4×4 determinant 7 − (−1) = 8 | holds |
| §9.3 | ℚ₃, n = 2, three γ | Orb = 1; 1 − 3^s; conjugate by diag(3,1): −3^s, ω = η̃(1/3) = −1, ∂ = log 3 = 0 − log(1/3)·1 | law holds |
| §9.5(b) | q = n = 3; q = n = 5 | q = 3: c̄ = (−1,1,1) forced, all units, so V would be split: no failure; q = 5: relation space of dimension 3, zero coordinates allowed | open for n ≥ 5 (R02) |
| §9.8 | ℚ₉, γ = ((−4,1),(−15,4)) | γ² = 1; shells v(t) = 0, −1; 1 − 9^s; −log 9 | holds |
| §10.1 Check | a = ((1,b),(0,1)), b̄ = −b | h(x′₁,x′₂) = b̄, h(x′₂,x′₂) = 1 − b² | aᵗTā |
| §12.4–12.5 Checks | ℚ(i)³, diag(1,1,−1) | norm-one x ⊥ (0,1,2): x₂ = 2x₃, \|x₁\|² + 3\|x₃\|² = 1; L′ = ½L, Q(μ) = ½; [w,w̄] = −4 for (1,i) | hold |
| §12.6a | parity; forms | k − σ/2 = 0 and 2; 1+1+1−3 = 0; descent mod 3 for both anisotropic forms; dim(𝔲 ∩ 𝔭) ≥ 2 for p ≥ 3 | hold |
| §12.10 control | u = e₁ + e₃ | h(u,u) = 6, det(u, gu, g²u) = −1 | holds |
| §0.3 strata | W rational isotropic in U | A = U^⊥ and W span an isotropic space, maximal dimension d, so W ⊂ U^⊥ | "containing W" is correct |

## Dependency check

`depcheck: 254 roadmaps, 2421 edges, 0 problem(s)`. No UPWARD or CYCLE line. This roadmap is at position 350 of `merge-order/ORDER.txt`; every named supplier is on main or earlier (PELModuliPartII 188, QSeriesPartitionsAndMockModularForms 248, GrossZagierAndArithmeticHeights 340, LubinTateFormalModulesAndQuasiCanonicalLifts 344).

## Verified sound

- **Declarations read:** 0 (`Suggested.lean` has a module docstring and an empty namespace; no `#check @name` file was elaborated because there is no declaration). Its single import is `import Mathlib`; no `set_option`. The pinned names in the README exist: `IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean:46), `TauCeti.FormalScheme.Spf.carrier` (Carrier.lean:73), `TauCeti.FormalScheme.Spf.structureSheaf` (StructureSheaf.lean:262). No headline is statable at the pins: a grep of both pins for Rapoport–Zink spaces, hermitian densities, orbital integrals and arithmetic Chow groups finds none. No padding.
- **Targets read:** all 107 numbered targets of Layers 0–14, with their API lists, Checks and *Needs*.
- **Checks tested:** about 70 recomputed (table above for those with numbers); none false.
- **Sibling citations checked:** 144 section ids in 25 supplier roadmaps resolved to headings at main, at the open heads or in the board package (PELModuliPartII, which has no open roadmap pull request); all exist. Statements read against the citation for GrossZagierAndArithmeticHeights §7.2, GeometryOfNumbersAndQuadraticArithmetic §§2.7 and 3.2 (all six declaration names), MetaplecticAutomorphicForms §§3.3a–3.3b, AutomorphicFormsOnReductiveGroups §4.4 `fourierUnitVanishing`, ArakelovGeometryAndAbelianHeights §1.8, SchemeAndStackFoundations §§5.4, 5.7–5.8, EtaleCohomologyFoundations §0.7, EndoscopicTransferAndUnitaryTraceComparisonPartII (gap:jr-local-comparison). The four names of `scratch/citations.md` are supplier target names, present in the suppliers.
- **Gaps:** the four slugs of `design/plan.json` equal the four README contracts, each with a named supplier and section.
- **Locators verified:** 47 against the cached texts (LZ 9, K 8, Z 8, LL2 5, LRZ 4, BHKRY 2, Zha12 2, Liu11a 2, YZZ09 3, ES 2, and one each for Bor98, Bor99, KM90, VZ84, GS19, Mih16, KR11, Ter13b); page numbers agree once cover pages (YZZ09, KM90, VZ84, Liu11a) and LRZ's printed numbering (printed 60 on PDF page 78) are taken into account.
- **Ownership.** No roadmap on main or at an open head owns Kudla–Rapoport cycles, the AFL, unitary or orthogonal Borcherds products or the Yuan–Zhang–Zhang modularity. `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md` §4.2a (merge order 371, later) states an integral Borcherds section on GSpin models; it is the later roadmap and should cite §12.6a(e) here, which is not a defect of this package.
- **Policy.** The pull request changes only this package's folder; no process words, pull-request numbers, `lemma` or `set_option` in the README or the Lean file.

Source independence: 9 passages compared with 5 sources (LRZ Definition 14.2.2 and Theorem 14.6.2, LZ Theorem 3.4.1 and Lemma 2.9.2, K Lemma 9.6, Theorem 9.7 and Theorem 8.2, Z Proposition 4.12 and Theorem 15.1), longest shared run 9 words in a theorem statement, none copied; largest share LZ, 62 of about 260 locators; contents compared with LZ (§§2–15): independent (LZ §3 is split between §0.9 and Layer 3, LZ §§5–6 are regrouped as Layers 1–2, LZ §§11–15 are spread over Layers 10 and 13).

## Not verifiable

- Shi 2022 and the two He–Shi–Yang papers (R03): not in the sources cache and not cited by the roadmap; their locators in the repair are K's.
- Lusztig76 and McGraw03: settled as uncertified; cited by locator only.
- §4.6 against LL1 §§8–9 and §13.9 against K (1.7)–(1.11): coefficients not recomputed, only compared for internal consistency with §§4.5 and 8.1.
- Whether (H_n) of R01 or the q = n converse of R02 is true: I found no proof and no counterexample to the statements themselves; only the published arguments fail.

## Source issues

- **Gap** in K at Lemma 9.6, p. 74: the source removes the last vector of a normal basis to lower the valuation; it should treat separately lattices whose largest invariant is odd, where that sublattice is degenerate; affects the proof.
- **Error** in K at Theorem 8.2, p. 64: the source says the vertical partial integral vanishes on normal vectors of negative valuation; it should claim only constancy on W_(≥0) ∖ {0} (rank-three value 2q·vol(L♭) at norm −π₀⁻¹); affects a stated result.
- **Gap** in Z at Proposition 4.12(i), proof, p. 23: the source deduces that 1 − d is a unit from integrality of det(1 − g); it should also exclude the residue of d⁻¹, which needs q ≥ n + 1 when n ≥ 4; affects a stated result.

## For the human reviewers

- The README asserts gaps in two refereed proofs (K Lemma 9.6, Invent. Math. 2023; Z Proposition 4.12(i), Ann. of Math. 2021) and one false clause (K Theorem 8.2); see "Source corrections", `README.md:2000–2004`. An expert confirmation would settle R01–R02.
- LRZ (arXiv:2404.02214v2) is an unpublished preprint; §§4.2 and 4.5, a headline, rest on its Theorem 14.6.2.
- McGraw03 is cited without a legal copy of the text (`README.md:2025`); LL1, LL2 and Zha12 are author copies, YZZ09 is read from an institutional archive host.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "71f5745a15b6ff88c143f0594d2c3c5043c3d7ba", "job": "RT-GrossZagierAndArithmeticHeightsPartII~1a", "model": "fable", "worker": "chris-x88"} -->
