<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13054#issuecomment-6790546731 -->
Review (codex) of c9c8d0b

Verdict: needs_changes

1. **F01** (P1) Raw reduction does not extend a Dirichlet character

   **Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:5056. “ψ′ is ψ composed with reduction modulo M”.

   **Claim:** Composition with the ring reduction from modulus MM′ to M produces a Dirichlet character of modulus MM′, with square equal to the principal character.

   **Witness:** M=4, M′=3, ψ=χ₋₄: raw composition at 3 modulo 12 is −1. But 3 is a nonunit modulo 12, so every Dirichlet character there is 0; its square is also 0.

   The pinned definition is Mathlib/NumberTheory/DirichletCharacter/Basic.lean:39, using MulChar. The nonunit law is Mathlib/NumberTheory/MulChar/Basic.lean:74 and :130. Thus raw composition has square 1 at this argument, whereas the principal character modulo 12 has value 0. The Lean predicate itself is sound; this defect is in its promised API.

   **Exact repair:** Use the existing DirichletCharacter.changeLevel with the divisibility M ∣ MM′. Describe composition on **unit groups**, followed by extension by zero on nonunits, and cite Basic.lean:65, :79, :88 and :103. No new generic character construction is needed. Add the negative-control Check M=4, M′=3: value 0 at 3 and −1 at 7. A scratch Lean test on complex-valued χ₄ proved the raw value −1, noninvertibility of 3 modulo 12, the corrected values 0 and −1, and the principal-character value 0. Injectivity of changeLevel preserves nontriviality; its monoid-homomorphism law preserves the square.

2. **F02** (P2) The enlarged ramification set incorrectly changes the p-adic conditions

   **Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:4180 and :4219; also :4169. “if Σ ∩ S_p ≠ ∅ then p > 2”; “At a place of Σ_σ − Σ_π … the rank-two condition is unramified”.

   **Claim:** Both statements are made after defining Σ=Σ_π∪Σ_σ.

   **Witness:** At p=2, take the rank-two factor crystalline with weights {0,1}, and the fixed factor semistable with nonzero monodromy. Then N_π=0, rank N_σ=1: σ-only ramification does not contradict hypothesis (4). See nt26 line 1226.

   The source's implication uses the ramification of π: its proof invokes nonzero monodromy of r_π, contradicting the required potential crystallinity when p=2 (nt26 lines 1222–1230). Hypothesis (4), nt26 lines 1192–1194, imposes no such crystallinity condition on σ. Moreover, an unramified automorphic π_v at v|p corresponds here to a crystalline Galois representation with weights {0,1}, not an unramified Galois representation: the latter has only weight 0. The new wording therefore also asks for the wrong local deformation ring.

   **Exact repair:** Replace the parenthetical by “if Σ_π ∩ S_p ≠ ∅ then p > 2”. Restrict the newly added **unramified rank-two conditions** to (Σ_σ−Σ_π) outside S_p, in the layer introduction and Check as well as the construction. At places above p retain the rank-two crystalline/ordinary/semistable condition determined by π, independently of σ's ramification. Keep all σ-ramified places in the unitary level. On the witness, Σ_π∩S_p is empty, Σ∩S_p is nonempty, N_π=0 and N_σ≠0; the repaired implication imposes no false exclusion of p=2, and the crystalline ring retains weights {0,1}. This repairs the setup, without narrowing Theorem 4.1.

3. **F03** (P2) The irreducibility bound is incorrectly asserted to give adequacy

   **Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:3644. “Sym^{n−1} of SL_2(𝔽_t) is irreducible and adequate for t > n − 1”.

   **Claim:** t>n−1 suffices for both properties.

   **Witness:** t=n=13 gives 13>12 and a 13-dimensional Sym¹². Its identity matrix is nonzero, invariant and trace-zero in characteristic 13. Hence H⁰(H,ad⁰)≠0, so the image is not adequate.

   The cited supplier explicitly excludes characteristic dividing dimension. See open pull request #856, TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:5242 (§7.9), especially the adequacy definition and the symmetric-power criterion at :5320. That criterion requires t≥2n+2 for this general application. The source application, nt21b lines 1254–1258, asserts irreducibility under t>n−1, not this stronger adequacy assertion.

   **Exact repair:** Separate the two claims: irreducibility for t>n−1; adequacy under the already chosen t>8n(n−1), by the supplier's criterion t≥2n+2. Add the t=n=13 negative control. For n≥3, 8n(n−1)>2n+2, so no prime-choice or endpoint change is required. For the package's n=3, t=53 numerical test, 53>48 and 53≥8; both correct criteria apply. The false test t=n=13 is excluded by the repaired adequacy bound.

4. **F04** (P2) The archimedean coefficient needs trace-one normalization

   **Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:1445. “f_v a coefficient of σ_v”; the next line concludes σ_v(f_v)=1.

   **Claim:** An unspecified matrix coefficient has trace 1, and the transferred trace is consequently a sign.

   **Witness:** G=U₁(ℝ), σ=1, Haar volume 1. The constant function 2 is a matrix coefficient; σ(2)=∫2=2, not 1. Linearity also scales its transferred trace by 2.

   No normalization of the coefficient is given in the package's conventions. The source uses the same compressed coefficient terminology at nt21 lines 558–560; the normalized test-function interpretation must be made explicit, not extended to arbitrary coefficients. The cited supplier distinguishes normalized pseudo-coefficients and their trace laws: TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:920 (§2.10).

   **Exact repair:** Specify a coefficient normalized to have σ_v(f_v)=1 with the chosen Haar measure, or a normalized pseudo-coefficient with that trace property. Retain the linear identity for arbitrary coefficients separately only if needed. Add the rank-one scaling Check: f=1 gives trace 1; 2f gives trace 2 and fails the normalized premise. This keeps the source's intended character identity and makes the excluded model explicit.

5. **F05** (P3) The local abelian Galois group is not its pro-p character quotient

   **Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:609. “G_{ℚ_p}^{ab} ≅ ℤ_p^× × ℤ_p”.

   **Claim:** This identifies the full abelian absolute Galois group.

   **Witness:** For p=3 there is an unramified quotient C₅. But ℤ₃^××ℤ₃ ≅ C₂×ℤ₃² has no nontrivial continuous quotient C₅. Counts of continuous homomorphisms to C₅ are 5 versus 1.

   **Exact repair:** Write G_{ℚ_p}^{ab} ≅ ℤ_p^××ℤ̂, and then explain that fixing the residual character leaves pro-p deformation directions, giving the stated two-dimensional polydisc after fixing torsion. Cite the existing local reciprocity contract, ClassFieldTheory Layer 6 (TauCetiRoadmap/ClassFieldTheory/README.md:1171). Add the unramified degree-five test and distinguish the full group from its deformation quotient. With ℤ̂ the homomorphism count becomes 5 on both sides; the two pro-p directions and the dimension 2 remain unchanged.

6. **F06** (P3) Failure of the ordered ratio does not rule out a Steinberg lift

   **Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:2780. “would not be a single q-string and no Steinberg lift could exist”.

   **Claim:** The sufficient ordered congruence of §6.9 is also necessary for the unordered local semisimplification to be of Steinberg type.

   **Witness:** n₁=n₂=1, q=2, residual characteristic 5, ψ₁(ϖ)=2 and ψ₂(ϖ)=1. The displayed ratio is 2·2=4≠1. Nevertheless {2,1} is a q-string; reversing its order gives the required adjacent ratio.

   A common normalization twist does not change this calculation. These characteristic-zero characters themselves give the semisimplification of an unramified twist of St₂; reduction preserves it. Thorne's theorem gives a sufficient ordered condition, not this converse (th24 lines 1769–1775).

   **Exact repair:** Delete the claimed converse. Replace it by a genuine obstruction: in rank two the unordered eigenvalue ratio must belong to {q,q⁻¹}. For q=2 in 𝔽₇, the pair {3,1} has ratios 3 and 5, neither 2 nor 4, and is not a q-string. Include {2,1} as the reversed-order positive control. The original theorem and its sufficient hypothesis need no change.

7. **F07** (P3) Remove the remaining process wording

   **Location:** packages/ModularityAndLanglandsExtensionsPartII/README.md:4646. “the case covered by the repaired set S of Layer 12”.

   **Claim:** The mathematical explanation depends on repair history.

   **Witness:** This is the sole “repaired” occurrence in the README; Layer 12 already defines S using both factors' ramification.

   **Exact repair:** Replace it by “the case covered by S including the ramification of σ in Layer 12”, respecting R02's distinction at p. The case σ Steinberg and π unramified away from p is still described, with no reference to a repair round.

Seven findings, four blocking. The two Lean headline statements elaborate and are not padding. The requested repairs from round 4 are present; the added character API nevertheless introduces a false construction. The remaining findings concern the scope of local conditions, adequacy, normalization, Checks and timeless wording. No authored package file was changed.

## Verified sound

### Previous findings, checked first

All seven requested repairs are present. “Repaired” below describes the former finding, not an acceptance of every surrounding passage.

| Prior id | Status | Repaired passage and verification |
|---|---|---|
| F01 | Repaired | §4.8 distinguishes “I” from “B = I × ⟨ζ⟩”; §4.10 uses a panel fixer. ct17 lines 264–274 explicitly give index 2 and panel index q+1. At rank zero the two Hecke ranks are 1 and 2; the sign character has I-fixed dimension 1 and B-fixed dimension 0. The corrected convention propagates to §§5.6–5.7 and the Iwahori contract. |
| F02 | Repaired | §5.6 requires E/F “unramified at every finite place outside” the listed places and prescribes the infinity type in both cases. ct17 lines 1480–1504 and 1630–1648 support both conditions. Counts for l=5,7 and s=0 are (1,2), (2,4). Shifting the infinity type gives highest weight (1,1,1,0,−1,−1,−1), not 0. |
| F03 | Repaired headline; new regression R01 | Suggested.lean:116 states the general-level entire-extension theorem using HasQuadraticSelfTwist. README §14.5 states “k ≥ 2” and “n ≥ 1”. The new theorem matches its elaborated signature. The modulus-inflation API added with it is false as described in R01. |
| F04 | Repaired | §2.2 now says “finite étale surjective morphism”; §2.4 uses that surjectivity. nt21 lines 2558–2577 construct the character-extension cover. Empty cover has 0 preimages; identity cover has 1; restriction along pℤ_p⊂ℤ_p has p geometric preimages. |
| F05 | Repaired | §2.2 requires a modulus prime to p and cites GL2AutomorphicRepresentationsAndTransfer §R16.1.7 in the statement, route, Needs and supplier contract. Its current heading is at TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:698 (#931). For ⟨2⟩⊃⟨4⟩, reduction mod 3 has even-exponent kernel; reduction mod 1 has all exponents. |
| F06 | Repaired | Corollary 1.13 now has “pp. 16–17”; Theorem 4.1 “pp. 25–26”; Lemma 5.8 and proof “pp. 42–44”. The intervening page markers are nt21 line 755 and nt26 lines 1190 and 2035. |
| F07 | Repaired | §§12.1 and 14.4 now have prose API lists. The former names “group determinants t, t′”; the latter gives degree at most n+1, constant term 1 and symmetry. Tensor ranks 2,4 and Euler degrees 1,2,3 verify the new API's elementary cases. R02 concerns the surrounding local-condition scope, not the existence of these lists. |

The previously settled duplication objection about SmoothRepresentationsOfLocalGroupsPartII is not re-raised: this package precedes it and already identifies it as a consumer of §4.9. Changing that other roadmap is not a repair authorized in this package.

### Seeded source verification

All fifteen requested targets were checked in the cached legal texts, including theorem numbers, page markers, hypotheses and the relevant proof steps. No additional author-flagged unverified locator was found. The table distinguishes a correct source locator from an incorrect surrounding Check or normalization.

| README target | Text read at locator | Outcome |
|---|---|---|
| §0.2, line 566 | nt21 lines 1432–1488, §2.11.1, pp.30–31; chen14 lines 2063–2102, §§4.1–4.2, pp.50–51 | Determinants, irreducible locus, Azumaya algebra and splitting near a split E-point agree. Nonreduced bases are retained. Group-identification Check needs R05. |
| §3.1, line 1141 | nt21 lines 2620–2654, Theorem 3.2, pp.53–54; bk05 lines 67–130, Theorems A/B and corollary, pp.2–3 | Boundary annulus, degree-one components and slopes agree. The cuspidal indexing starts at 1; the slope-zero Eisenstein piece is excluded explicitly. |
| §3.6, line 1280 | nt21 lines 2736–2744, Lemma 3.6, p.56 | Same annulus and n-regularity are retained; rank-two case is separated. |
| §4.2, line 1440 | nt21 lines 553–603, Propositions 1.6–1.7 and §1.5, pp.12–13 | Places, odd rank, parameters and transfer normalizations match. Trace-one coefficient must be made explicit (R04). |
| §4.4, line 1515 | nt21 lines 705–772, Proposition 1.12 and Corollary 1.13, pp.15–17 | Odd residue characteristic, order-six condition, characters and compact induction match; repaired corollary page range is correct. |
| §5.8, line 2301 | ct17 lines 1758–1806, Proposition 4.1 and proof, pp.34–35 | Ordinary contribution, semistability correction, partition possibilities and cuspidality match; nilpotent kernel inequality has the right direction. |
| §5.10, line 2369 | ct17 lines 1809–1888, Theorem 4.2 and proof, pp.35–37 | l=5,7 only; pairing, localized ranks and a>b contradiction agree. No general-l conclusion is asserted. |
| §6.6, line 2647 | ct17 lines 2105–2166, Lemmas 5.5–5.6, pp.41–43 | Distinct inertial characters, good extension and five prime conditions retained. The characteristic-l additive-independence misprint is corrected to multiplicative independence. |
| §6.8, line 2718 | ct17 lines 2204–2228, Theorem 5.7, p.44 | Eight hypotheses, residual blocks, cyclotomic restrictions and long-block threshold retained. |
| §7.7, line 3013 | ct17 lines 2242–2302, Theorem 6.2 and proof, pp.45–46 | Ordinary weight zero, a>1, both adequacy assumptions, primitive-root residue cardinality and residual ramification retained. The CM compositum in the proof is corrected. |
| §8.2, line 3094 | nt21 lines 4510–4590 and following patching argument, Proposition 8.3, pp.92–95 | All five conclusions retained, including p>max(2(n+1),(n−1)k), unramified p-components and regular refinements at ramified places. Auxiliary smoothness is a declared supplier gap. |
| §10.6, line 3657 | nt21b lines 1191–1213, Proposition 3.10, pp.25–26 | Seasoned input, p≥5, weight two, sc deletion and the p≠q qualification agree. Automorphy implication has the right direction. |
| §11.6, line 3982 | nt26 lines 930–979, Proposition 3.9, pp.20–21 | Two applications of finiteness and removal of the extra Steinberg condition are stated. The additional supplier hypothesis is explicitly a declared gap, not silently assumed. |
| §12.1, line 4173 | nt26 lines 1214–1319, reductions (10)–(16) and CM setup, pp.26–28 | Characters, tensors, integral models and determinants match. Extending Σ to include σ requires the correction in R02; the source's dyadic exclusion concerns π only. |
| §14.5, line 5022 | nt21b lines 34–50, Theorem A and Corollary B, pp.1–2; nt21 line 89; supplied standard-L-function holomorphy | Non-CM regular algebraic cuspidality supports the entire extension after the motivic shift. Finite omitted local inverse factors are polynomials. R01 affects the new character API, not this analytic conclusion. |

### Computed adversarial table

Each row records actual values, dimensions, ranks, finite sets or truth values. These are diagnostic instances, not claims that finite testing proves the deep theorems. All 110 numbered targets and their API/Checks were read; previous evidence was reused only where it contained a computation. This compact table covers the seeded targets, headline theorems, repaired constructions and every finding.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| §0.1 components | xy=0 versus a disc | Node has 2 irreducible components, disc 1; vanishing on one node branch need not vanish on the other | Component hypothesis retained |
| §0.2 nonreduced deformation | E[ε]/ε² versus E | Tangent dimensions 1 and 0; reduction deletes ε | Nonreduced carrier retained |
| §0.2 local characters | p=3, target C₅ | Hom counts 5 for G_ab, 1 for C₂×ℤ₃² | R05; ℤ̂ restores 5 |
| §§0.3–0.4 polarization | rank 1 infinitesimal character 1+εψ | Inverse 1−εψ; conjugate-duality requires ψᶜ=−ψ, not +ψ | Sign correct |
| §§1.1–1.4 regularity | n=3, ratio −1; ratio 2 | Sym² eigenvalues (1,−1,1) repeat; (1,2,4) distinct, discriminant 36 | Regularity is not mere distinct rank-two roots |
| §2.1 twin | Δ, k=12, slopes 3 and 8 | 3+8=11=k−1; twin twice returns 3 | Convention consistent |
| §2.2 cover | empty, identity, p-th-power character restriction | Fibre sizes 0,1,p | Empty cover excluded by repair |
| §2.2 Chevalley | 2^a mod 3 and mod 1 | (−1)^a: kernel 2ℤ; mod 1: kernel ℤ | Excluded-prime modulus contract correct |
| §§2.3–2.4 component propagation | finite surjective cover of a point; empty cover | At least 1 lift versus 0 | Repaired route uses surjectivity |
| §2.5 bad locus | roots 1,−1 and 1,2,4 | Discriminants 0 and 36 | Closed divisor test discriminates |
| §3.1 boundary | v₂(w)=1/2, w=4, w=0 | Slopes (1/2,1,3/2), (2,4,6); w=0 outside 0<v₂(w)<3 | Matches cuspidal theorem |
| §3.2 valuations | exponents 1,2,4 | 5^j−1=4,24,624; valuations 2,3,4 | Odd/even branches correct |
| §3.4 Δ residual roots | X²−X+3 over 𝔽₅ | Roots 2,4; sum 1, product 3. Inverse pair (3,4) has sum 2 and product 2 | Polynomial and Frobenius must be transported together |
| §3.6 annulus criterion | n=2; n=3 ratio −1 | Sym¹ has rank 2; Sym² list (1,−1,1) fails regularity | Rank-two tautology confined to README; bad ratio excluded |
| §§3.7–3.8 ping-pong headline | m=2, i=1 | k′=2+8−1=9, slope 2; twin slope 6=2(2²−1) | Target component X₃, consistent |
| §4.2 archimedean trace | trivial U₁, f=1 and f=2 | Traces 1 and 2, claimed normalized RHS 1 | R04 |
| §4.3 sign condition | one wrong-parity rank-one block | Multiplicity 1 is odd; two such blocks have multiplicity 2 | Even-multiplicity condition discriminates |
| §4.4 depth-zero | q=3, p=7 | 3³=−1 mod 7, order 6; q(q−1)=6 | Small odd residue characteristic retained |
| §§4.5–4.6 types and transfer | n=3,q=3,p=7; n=5 | Type dimensions 6 and 32, torus order 28; extra quadratic factors have dimension 1. Residue characteristic 3>3 is false | Types exist at q=3; the transfer criterion excludes that place |
| §4.7 Frobenius blocks | A=(0 a;1 0) | det A=−a, A²=aI, charpoly(A²)=(X−a)² | Cyclic sign and direction agree |
| §4.8 fixer API | k=0; determinant-sign character | Hecke ranks H_B=1, H_I=2; invariant dimensions B:0, I:1 | F01 repair excludes wrong model |
| §4.8 quadratic relation | q=3, T_s | T_s²=2T_s+3; eigenvalues 3,−1 | Source's unnormalized alternative fails |
| §§4.9–4.10 tempered parameter | SL₂ q-weight diag(2,1/2), regular unipotent | s noncompact, commuting factor s₀=1 compact | Corrected tempered criterion |
| §4.10 panel | n=7, q=3 | Panel dimension 2, [P:B]=4; maximal vertex index 4·40·364=58240 | Not maximal parahoric |
| §§4.11–4.12 localization/sign | q≡−1 mod l; n=7,9 | q+1=0 in k; exponent-count differences 7−1=6 and 11−1+2=12 | Integral averaging and sign factors agree |
| §§5.1–5.2 type datum | n=3 and n=5 | Block ranks 2+1=3 and 2+3=5; T₃ order 1 means q≡1; T₂ order 2 sends Θ to Θ⁻¹≠Θ | Type slots and normalizing twists retained |
| §5.3 quadratic-base-change trace | two signed contributions +1,−1 | Half-sum 0; after squaring half-sum (1+1)/2=1 | Base change removes cancellation |
| §5.4 type-raising headline | n=3,5 | Required block sums 1+2=3 and 3+2=5 | Full rank retained |
| §5.5 angular convention | z=−1 | z/abs(z)=−1, z/conj(z)=1 | Wrong angular character excluded |
| §5.6 packet counts | s=0,1; l=5,7 | l=5: (1,2),(2,4); l=7: (2,4),(8,16) | Repaired ramification/infinity conditions retained |
| §5.8 partitions | (3,3,1),(5,1,1),(7) | dim ker N=3,3,1; dim ker N²=5,4,2; ranks N=4,4,6 | Generic kernels ≤ residual kernels |
| §§5.9–5.10 headline | a=2,b=1 | Ambient a+3b=5; isotropic rank a+b=3 requires 6≤5, false | Correct contradiction |
| §§6.1–6.2 indices | factors 12 and 32; empty auxiliary set | Product 384; empty product 1 | Finite-index and empty-set conventions correct |
| §6.4 Steinberg headline | n=3 | p>6; local degree >4; R₂ order n−2=1 | Small rank not silently discarded |
| §6.5 dimension loss | n=3, degree d_F, antiunit rank 0 or 1 | Bounds 1+3d_F and 3d_F; partition (1,1,1) has largest part 1≤n₁=2 | No reduction claim without the strict partition condition |
| §6.6 character change | diag(ζ,ζ⁻¹), ζ^m=1; unipotent block | m-th powers I versus I+mN with N≠0 in characteristic 0 | Distinct finite-order types matter |
| §6.6 genericity | k=𝔽₅; units 1+T,1+2T in k[[T]] | 5(1+T)=0 additively; rational-function valuations at −1,−1/2 give exponents (a,b), forcing a=b=0 | Source additive misprint corrected |
| §§6.7–6.8 long-block headlines | block sizes 3,4 | Length 5>4; length 4 is not >4 | Strict long-block threshold retained |
| §6.9 ordered ratio | q=2 mod 5; ψ values 2,1 | Ordered expression 4≠1; unordered eigenvalues form {1,2} | R06; false converse |
| §6.9 negative control repair | q=2 mod 7; ψ values 3,1 | Ratios 3,5 versus allowed 2,4 | Correct obstruction |
| §§7.1–7.3 CM seed | conjugate pair; odd exponent | Conjugation exchanges 2 terms; exchanged block determinant −1 | Odd-block sign retained |
| §§7.4–7.6,14.1 seed headlines | weights {0,1} and {0,2} | Sums {0,1,2,3}; equal spacings {0,1}+{0,1} repeat 1 | Separate rank-two input retained |
| §7.7 headline | l=5,7 | Sym⁶ rank 7, Sym⁸ rank 9; residual ranks 4+3=7 and 4+5=9 | Exponents/ranks agree |
| §8.1 discriminant | Sym² of diag(1,−1), diag(1,2) | 0 versus (1−2)²(1−4)²(2−4)²=36 | Nonregular divisor test |
| §8.2 prime bound | k=12,n=3 | max(8,24)=24; 23 fails, 29 passes numerical bound | Other smoothness hypotheses remain separate |
| §§8.3,14.2 propagation headlines | one ramified place; rank 2 | Conductor-place count 1→0; Sym¹ rank 2 | Induction and base case correctly oriented |
| §§9.1–9.2 Artinian symmetric powers | rank 2 weights {0,1}, n=3 | Sym² weights {0,1,2}, rank 3 | P→R direction: rank-two lift induces determinant |
| §§9.3–9.4 Taylor–Wiles | C₂ local diamonds | Single-character quotient order 2; full ordered rank-two quotient order 4 | Distinct level constructions retained |
| §§9.5–9.6 dyadic patching | −1 modulo 4; x²+2x fibre | −1=3≠1 but square 1; fibre algebra free rank 2 | Squaring alone is not free action; gap retains action hypotheses |
| §§9.7–9.8 lifting headline | E versus E[ε]/ε²; p^a=4,8 | Tangent dimensions 0,1; 4>5 false, 8>5 true | Regularity and residual-size conditions matter |
| §§10.1–10.4 conductor/image | semistable unipotent rank 2; dihedral order t | Inertial semisimplification dimension 2 despite N rank 1; projective inertia order t | Semisimple conductor does not erase separate monodromy data |
| §10.5 adequacy | t=n=13; n=3,t=53 | tr I₁₃=0, I₁₃≠0; 53>48 and 53≥8 | R03; stronger supplied criterion applies |
| §10.6 removal | sc={5,q}, p=5≠q | Output sc={q}; cardinality 2→1; seasoned prime q remains | Matches source conclusion |
| §§10.7–10.8,14.3 headline | sc={2,3} | Dyadic/triadic steps give {3}, then ∅; Sym¹ rank 2 | Full ramification induction, not good-prime-only endpoint |
| §§11.1–11.4 residual tensors | r=2,3 | Ranks 3+1=4 and 4+2=6; weights respectively 0,…,3 and 0,…,5 | Block/twist dimensions agree |
| §11.5 special fibres | n=4; k[x]/x and k[x]/x² | Ring dimension 17, fibre dimension 16; example lengths 1 and 2 | Reduced-fibre equality is not scheme equality |
| §11.6 finiteness | 𝔽₇,q=3,Φ=diag(1,2) | Adjoint-twist eigenvalues 3,3,6,5: no 1; adding/removing v₂ changes count by +1/−1 | Non-scalar comparison already supplied; two finiteness applications explicit |
| §§11.7–11.9 components | graph with edges 1–2–3 versus 1–2 and isolated 3 | Seed reaches 3 vertices versus 2 | Connectivity needed for all-component conclusion |
| §11.10 headline | r=1,2,3 | Tensor ranks 2,4,6; r=1 needs no SP₀ | Boundary not a Lean padding theorem |
| §12.1 tensor API | r=1,2 | Ranks 2,4; {0,1}+{0,2}={0,1,2,3}; XXᶜ=χ∘N cancels duality twist | New API itself consistent |
| §12.1 p-adic scope | p=2, π crystalline, σ semistable noncrystalline | N_π=0, rank N_σ=1; Σ_π∩S_p empty, Σ∩S_p nonempty | R02 |
| §§12.2–12.3 torsion tensor | r=1,2; Q empty | Tensor ranks 2,4; empty diamond group order 1 | Coefficient-quotient compatibility remains explicit gap |
| §12.4 ordered Hecke data | r=1, α=2,β=3,γ=5 | η=(10,15), cumulative products 10,150; erroneous formula gives 30 | Corrected cumulative factor and quotient order 4 |
| §§12.5–12.7 lifting headline | r=2; ordinary weight sums | Tensor weights 0,1,2,3; equal spacing gives 0,1,1,2 | Regularity correct; p=2 exclusion applies to π, not σ |
| §13.1 two dihedral places | characteristic 2, q≤6 | q=2 or 4, q±1 in {1,3,5}; no prime >6 divides | Two-place argument repairs strict-bound issue |
| §§13.2–13.3 companions | two adjoints; r=2 product versus diagonal | Weights {−1,0,1} versus {−2,0,2}; tensor dimension 4, diagonal decomposition dimensions 3+1 | Independent-image argument discriminates |
| §13.4 inertia propagation | r=4,q=17,x=2,y=3 | Forbidden set size 8≤14; eigenvalues 7,6,10,11,14,12,3,5 all distinct | Arithmetic correct; wording R07 |
| §§13.5–13.6 residual headlines | r=1,2 | Witness ranks 2,4; r=1 coefficient conjugate, no SP₀ | Residual conclusion not promoted to characteristic-zero equality |
| §13.7 replacement | Δ determinant ε⁻¹¹; residual twist ε̄⁵ | 2·5−11=−1 residually; characteristic-zero finite twist leaves weight 11≠1 | Residual/characteristic-zero distinction correct |
| §§13.8–13.10 all-rank headline | n=6,7,11 | (p,r)=(5,1),(5,2),(7,4); block ranks (4,2),(3,4),(3,8) sum to n | Smaller indices positive; r=1 uses no SP₀ |
| §14.4 Euler-factor definition | n=0,1,2; α=2,β=3 | 1−x; 1−5x+6x²; 1−19x+114x²−216x³; same after swapping α,β | Natural subtraction stays in range |
| §14.4 zero parameters | n=2,α=β=0 | Product 1, degree 0≤3, constant term 1 | Degree is correctly “at most” |
| §14.4 level-one headline | Δ,n=2 | a₂=−24, αβ=2048; factor 1+1472x−3014656x²−8589934592x³; convergence bound 12 | Motivic shift and signs agree |
| §14.5 self-twist predicate | CM y²=x³−x; Δ candidate χ₋₄ | CM: a₃=0, 0·(−1)=0; a₅=−2, −2·1=−2. Δ: 252·(−1)=−252≠252 | Positive and negative tests discriminate |
| §14.5 modulus positivity | M=0 versus M=1,2 | No prime coprime to 0; unit groups at 1,2 have one character | M=0 excluded; small moduli supply no nontrivial witness |
| §14.5 change of level | M=4→12, at 3 and 7 | Raw values −1,−1; true changed-level values 0,−1 | R01; scratch Lean verification |
| §14.5 analytic headline | n=0; CM n=4; non-CM k=12,n=2 | n=0 partial ζ has pole 1; CM fourth power has central ζ(s−2) pole 3; asserted non-CM half-plane starts at 12 | n≥1 and non-CM restrictions meaningful |
| Both Lean headlines: denominators | k=12,n=2,Re(s)=13,p=2 | Each Satake monomial times p⁻ˢ has modulus 2^(11−13)=1/4<1, hence each 1−term is nonzero | No total-division junk in asserted half-plane |
| Both Lean headlines | n=1 versus arbitrary n | Native factor degree 2 versus n+1; native entire extension only for original cusp form | No one-lemma replacement of universal theorem |

### Lean acceptance test and pinned declarations

The pins inspected are Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5, from lake-manifest.json.

The requested lake env lean invocation, run from the content checkout on the package's Suggested.lean, exited 0. Its only warnings were the two “declaration uses sorry” warnings at lines 97 and 116. No TauCeti object-file build was needed.

A separate scratch copy checked all four declarations with #check @name. The two definitions have real bodies. Both theorems preserve f, n, 1≤n, α, β and the prime-indexed Satake equations; the general-level theorem additionally preserves [NeZero N], 2≤k and ¬HasQuadraticSelfTwist f. Its Satake equations and Euler product use exactly p∤N. No binder disappeared and no signature edit was required.

Every sorried theorem was probed with simp, rfl and infer_instance: all six attempts failed to close the goal, and the scratch file elaborated with only its two expected sorry warnings. Exact-library-lemma candidates were compared by type: the native newform Euler product and original cusp-form entire-extension theorems do not prove arbitrary symmetric-power holomorphy. Generic Euler-product, Dirichlet-L-series and half-plane analyticity results likewise do not imply entire continuation of these higher-degree factors. No padding finding is raised. The one proved symmetry example tests nontrivial reindexing of the retained factor definition.

Pinned definitions and declarations opened, rather than inferred from name search:

| Declaration | File and line | Contract checked |
|---|---|---|
| DirichletCharacter | Mathlib/NumberTheory/DirichletCharacter/Basic.lean:39 | MulChar on ZMod; positive modulus is extra, not built into the type |
| MulChar.map_nonunit | Mathlib/NumberTheory/MulChar/Basic.lean:130 | Nonunits map to 0, including for the principal character |
| DirichletCharacter.changeLevel and injectivity | Mathlib/NumberTheory/DirichletCharacter/Basic.lean:65, :79 | Unit-group composition followed by zero extension; nonzero target modulus for injectivity |
| ZMod.χ₄ | Mathlib/NumberTheory/LegendreSymbol/ZModChar.lean:42 | Explicit values 0,1,0,−1 |
| UpperHalfPlane.qExpansion | Mathlib/NumberTheory/ModularForms/QExpansion.lean:172 | Native period-dependent coefficient series; no CM predicate |
| HeckeRing.GL2.Newform | TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104 | Nonzero eigenform, new subspace and a₁=1; actual Γ₁(N) carrier |
| satakeParameters, pair criterion | TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:91, :108 | Roots of X²−a_pX+χ(p)p^{k−1}; sum/product characterize the pair |
| exists_satakeParameters_eq_pair | TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:117 | Pair exists; headline Satake choices are not inconsistent premises |
| prod_map_one_sub_mul_satakeParameters | TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:161 | Original degree-two factorization, not arbitrary symmetric powers |
| satakeParameters_of_not_coprime | TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:173 | Bad-prime pair {a_p,0}; not a ramified higher-rank local Langlands carrier |
| LSeries_eulerProduct_hasProd_satakeParameters | TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:191 | Re(s)>(k+1)/2, original newform only |
| CuspForm.hasEntireExtension_qExpansion_coeff | TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean:192 | Positive weight; original coefficient L-series only |
| padicValNat.pow_two_sub_one | Mathlib/NumberTheory/Multiplicity.lean:401, underlying theorem :359 | Existing alias; odd x>1, positive even exponent, valuation formula |
| Polynomial.discr | Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:934 | Commutative ring; discriminant of a constant is 1, so expected degree matters |
| GaussianInt | Mathlib/NumberTheory/Zsqrtd/GaussianInt.lean:50 | Zsqrtd(−1) |
| Nat.exists_prime_lt_and_le_two_mul | Mathlib/NumberTheory/Bertrand.lean:225 | n≠0; n<p≤2n, enough for the stated induction |
| NumberField.abs_discr_gt_two | Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:275 | Degree>1, absolute discriminant>2 |
| HasProd | Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:107 | Limit over finite subsets, not an unconditional value assigned to a divergent product |
| Differentiable | Mathlib/Analysis/Calculus/FDeriv/Defs.lean:172 | Differentiability at every point of ℂ |
| Complex.cpow | Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean:27 | Exponential of log away from zero; prime bases are nonzero |
| EulerProduct.eulerProduct_hasProd | Mathlib/NumberTheory/EulerProduct/Basic.lean:175 | Summability and multiplicativity, no entire continuation |

The declared missing headline carriers were searched by object at both pins. Generic symmetric powers, Galois representations and elliptic CM endomorphisms do not furnish cuspidal GL_n automorphic representations, their attached representations, unitary packets, eigenvarieties or pseudodeformation spaces.

### Headline coverage

| README headline | Acceptance-file disposition |
|---|---|
| Component propagation §§2.4,3.8 | Named in module docstring; eigenvariety and automorphy carriers missing |
| Type and Steinberg level raising §§5.4,5.10,6.4,6.7–6.9 | Named; unitary automorphic and local-type carriers missing |
| Seeds, Theorem E and small powers §§7.5–7.7,8.3,14.1–14.2 | Named; higher-rank automorphy carrier missing |
| Symmetric-power lifting §9.8 | Named; deformation, patching and automorphic-attachment carriers missing |
| Untwisted tensor §11.10 and tensor lifting §12.7 | Named; same missing carriers, with fixed-factor tensor data |
| Twisted residual witnesses §§13.5–13.6 | Named; residual automorphic attachments missing |
| SP_n over totally real fields §13.10 | Named; Hilbert/higher-rank automorphic carriers missing |
| All-place non-CM functoriality §14.3 | Named; higher-rank local/global carriers missing, including bad-place local Langlands |
| Entire symmetric-power L-functions §§14.4–14.5 | Both stated on native newforms, with only two simple definitions |

No statable headline is omitted or replaced by a free-Prop surrogate. The partial Euler product is an analytic consequence; it does not narrow the all-place theorem of §14.3.

### Supplier order, ownership and shape

The mechanical dependency check produced:

```text
depcheck: 237 roadmaps, 2168 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. All 111 Needs lines and the supplier contracts were read. Citation resolution against main and the supplied open heads reported no missing roadmap citation and no missing own Lean name. Definitions of the suppliers and especially the changed contracts were opened; a resolver hit alone was not treated as proof of the claimed scope (R03 is one scope mismatch).

The board package index was read before ownership searches. roadmaps grep searched main and the indexed open heads by the objects: self-twists, pseudocharacters, local Hecke/chamber-fixer algebras, Kazhdan–Lusztig classification, tensor lifting and patching. Supplier snapshots were read for the cited sections. Representative ownership resolutions:

| Object / contract | Owner resolved now |
|---|---|
| Base eigenvariety, triangulation, symmetric-power maps; endpoint statements | ModularityAndLanglandsExtensions §§4.3–4.4,4.5–4.12,4.20,4.23,4.29–4.31, #1180; Part II supplies the detailed intermediate arguments rather than a new carrier |
| Polarized forms and lifting, weak primitivity, semistable determinant rings | PotentialAutomorphyInfrastructurePartII Layers 0–9, #2135; §8.16 at TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md:1910 retains its additional cyclotomic-image hypothesis, exactly the declared gap |
| Rank-two modules and patching | GL2ModularityLifting Layers 2–3,6, #1071; here the additional object is simultaneous rank-two/rank-n pseudodeformation patching |
| Prescribed lifts and compatible systems | PotentialModularityAndCompatibleSystems §§9.2,10.10, #1075; not reconstructed here |
| Rational modularity and weight-one inputs | ClassicalSerreModularity, #1020; its scope is distinct from these higher symmetric powers |
| Chevalley avoidance | GL2AutomorphicRepresentationsAndTransfer §R16.1.7, README:698, #931 |
| Non-CM self-twist condition | GL2AutomorphicRepresentationsAndTransfer §R16.4.6, README:1227, #931; package predicate specializes to native Newform coefficients, not a second general automorphic carrier |
| Strong multiplicity one | AutomorphicLFunctionsAndLocalFactors AL.3.7.1, README:1784; used for the coefficient self-twist comparison |
| Connected Iwahori / chamber fixer | ReductiveGroupsPartII §RG2.3.3 and §RG2.4.2; SmoothRepresentationsOfLocalGroups SR.1.5, README:1583, supplies the split presentation; the quasi-split extension is explicitly a gap |
| Local rings, global rings and abstract patching | LocalGaloisDeformationRings §§2.13,2.18,2.24,2.26–2.27,8.12,8.14; GlobalGaloisDeformations §§4.11,8.1,8.5; DeformationAndDerivedPatchingAlgebra §§5.6,6.6 |
| Rigid components and base extension | AdicSpacesPartV Layer 1 plus the declared components-under-field-extension contract |
| Drinfeld-space level-raising input | CompletedCohomologyAndLocalGlobalCompatibility §0.7, README:379; contract specifies the localized derived tensor, not bare cohomology concentration |
| Tempered unitary packets and finite-group inputs | EndoscopicTransferAndUnitaryTraceComparison §§11.2,2.11 and RepresentationTheory/CharacterTheory Layer 9, with precisely labeled gaps |

The overlap facts contain no competing edit of this roadmap, dropped cited id, or id defined only by an open revision. The five closest scopes (#2135, #1180, #1075, #1071, #1020) were compared as above. No new ownership collision was found. The four fully qualified Lean names are not duplicated by the other readable roadmaps.

All 13 gap slugs and their needs sentences agree **verbatim** between README and design/plan.json. Each has a named earlier supplier. They are: geometric-weak-primitive-auxiliary-finiteness; dyadic-definite-unitary-forms; components-under-field-extension; tensor-taylor-wiles-primes; formal-torus-patching; artinian-crystalline-quotients; unobstructed-auxiliary-prime-and-slope-count; level-raising-prescribed-components; explicit-tempered-unitary-packets; deligne-lusztig-transfer; iwahori-matsumoto-quasi-split; drinfeld-steinberg-detection; deligne-lusztig-finite-unitary. In particular the formal-torus contract assumes free action chunks, not merely square-equivariance, and the finiteness gap does not request the non-scalar comparison already supplied. These declared contracts are not findings or missing-source requests.

Shape checks: 15 mathematical layers, 15 Examples subsections, 15 Dependencies subsections, 110 numbered targets and 376 Check bullets; every numbered target has at least three. The retained definition targets have prose APIs, including the two repaired lists. The main roadmaps QuadraticCharactersAndReduction and TensorProductCombinatorics were read for house shape. The target has the required Summary, scope, conventions, supplier contracts, build explanation and references. Its layer order is forced by the component, local-type, level-raising, seed, lifting and induction dependencies; no layer is named after a source chapter. The organization does not make a source's exposition mandatory. R07 identifies the remaining process residue.

Suggested.lean has one Mathlib import and one used TauCeti module import, its namespace, a module docstring, two real-bodied definitions, two theorem declarations and one proved reindexing example. No sorry'd data, set_option, admitted example, algorithm, arbitrary Prop condition or hypothesis containing a headline conclusion was found. No route-specific exclusion replaces the general endpoints. All 18 works in References have manifest entries; the three settled uncertified texts retain their original entries.

## Not verifiable

- kl87: settled uncertified. Its Theorem 7.12 / Corollary 7.13 locators were retained; the original text could not be inspected. The accessible ct17 formulation and the package's concrete Hecke checks were inspected.
- bbm82: settled uncertified. Théorème 3.1.1 could not be inspected directly; the Artinian crystalline-quotient use remains an explicit supplier contract, with the accessible Newton–Thorne applications read.
- kw09: settled uncertified. Proposition 9.3 could not be inspected directly; the formal-torus contract records the required free actions and compatibility, and the accessible Newton–Thorne patching statements were checked.
- These three statuses are settled by the brief. No refetch, renamed manifest key, or new missing-reference request was made. No source needed for the fifteen seeded checks was unavailable.

## Source issues

- **Gap** in nt21 at Proposition 1.6, p.12: the source says an unspecified coefficient has trace one; it should specify the trace-one coefficient normalization; affects a stated result.
- **Misprint** in nt21 at Lemma 2.34, pp.51–52: the source says the character family exists after a finite étale morphism; it should specify the surjectivity its construction supplies and later point-lifting uses; affects a stated result.
- **Error** in ct17 at §2.1, pp.6–7: the source says characteristic double-coset generators have roots 1 and −q; it should give roots q and −1; affects a stated result.
- **Error** in ct17 at §2.1, p.7: the source says braid-group generators present the algebra over ℤ; it should use the positive braid monoid or invert q; affects a stated result.
- **Misprint** in ct17 at Lemma 5.6(3), p.42: the source says characteristic-l eigenvalues have no integer-linear relation; it should require multiplicative independence, since additive l-multiples vanish; affects a stated result.
- **Misprint** in ct17 at proof of Theorem 6.2, p.45: the source says E₂ is F₂F₁; it should be F₂E₁, retaining the CM extension; affects the proof.
- **Misprint** in nt21b at proof of Theorem 3.1, p.27: the source says the original π has the asserted large 3-adic image; it should use the newly constructed good-dihedral π′; affects the proof.
- **Gap** in nt26 at proof of Theorem 4.1, reduction (13), p.26: the source says S contains only p and the ramification of π; it should also include σ's ramification for the tensor and unitary level; affects the proof.
- **Misprint** in nt26 at §4, Taylor–Wiles maximal-ideal generators, p.32: the source says the i>r generator uses only the final partial γ-product; it should also include the product of the first r γ-values; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c9c8d0b92ff32f58841bd83ea7d30934bff3520a", "job": "REV-PKG-ModularityAndLanglandsExtensionsPartII~5", "model": "gpt-6-astra", "worker": "chris-8"} -->
