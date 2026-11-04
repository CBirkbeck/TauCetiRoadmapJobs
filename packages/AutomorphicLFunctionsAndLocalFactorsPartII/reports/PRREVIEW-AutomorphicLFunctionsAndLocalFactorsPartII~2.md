# Review of AutomorphicLFunctionsAndLocalFactorsPartII (pull request #1756 at e331779)

**Verdict:** accepted

Incremental re-review of the 39 lines changed since 843d267 (the supplier contract for SmoothRepresentationsOfLocalGroups, §5.0, the character-change theorem of §10.3, and §10.6). Both findings of the previous review are repaired; the repairs introduced no blocking problem. One P3 note.

## R01 (P3) — §5.0 *Needs:* line labels SR.2.3 as "cuspidal support and embedding"

**Location:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:827`: "SR.2.2 (induced contragredients and geometric lemma), SR.2.3 and SR.3.1 (cuspidal support and embedding)".

**Claim:** SR.2.3 is an input to the quotient statement under that description.

**Witness:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2161` at its open head: SR.2.3 is "Pairings, canonical lifting, Iwahori invariants and Whittaker functionals". The route written in §5.0 uses only SR.0.4 (exactness and biduality of the smooth dual), SR.2.2 (*induced-contragredient*) and SR.3.1 (*cuspidal-support*, embedding into i_P(wσ)).

**Repair:** Either drop SR.2.3 from the line or give it its own label; the label "cuspidal support and embedding" belongs to SR.3.1 alone. No mathematics changes.

## Previous findings

- R01 — repaired: §5.0 now dualizes SR.3.1's embedding π̃ ↪ i_P(wσ̃) through SR.0.4 and SR.2.2, obtaining π as a quotient of i_P(wσ) for a conjugate of the whole pair, with the tail transported; the SO₄/ℚ₃ datum (2,1)↦(1,2) is a Check and §10.6 proves full-datum invariance.
- R02 — repaired: §10.3 keeps the self-dual-measure exponent Nk(s−1/2), derives it from AL.3.2.1/AL.3.3.2 with AL.1.3.1 (3.29) in rank one and the §10.29 block product for nongeneric Π, records the CPS94 line 249 exponent as a different normalization, and cites CPS94 lines 251–255 only for the global cancellation.

## Verified sound

**Head, gate, diff.** The worktree is at e331779fdaf99aa7d79d5e497dce1ba9107e9420 with a clean tree; the diff outside the roadmap folder against origin/main is empty. I reran the gate: every scanner and the targeted build pass (`set_option=0 … outside-folder=0 source-material=0 OK`, exit 0). The dependency command returned

```text
depcheck: 204 roadmaps, 1642 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line (ten edges more than at 843d267, from the new citations of SR.0.4/SR.2.2/SR.3.1, AL.1.3.1 and AL.3.7.2). `lake env lean` on `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/Suggested.lean` exited 0 with no output; the file is unchanged since the previous review, declares no name, and its docstring still lists the seventeen headline groups as not statable at the pins. Hence no `#check @name` inventory and no one-tactic padding probe apply (nothing to probe); the headline and padding verdicts of the previous report stand.

**Citations resolved this round (all at the open heads named in the brief, line numbers of the `roadmaps show` text).**

| Citation in the diff | Where it resolves | What it states |
| --- | --- | --- |
| SmoothRepresentationsOfLocalGroups SR.3.1 *cuspidal-support* | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2594`–2606 | Cuspidal datum (M,σ) up to G-conjugacy of the whole pair; every irreducible subquotient of i_P σ embeds into i_P(wσ) for some w ∈ N_G(M)/M. |
| SR.2.2 *induced-contragredient* | same file, lines 2114–2122 | (i_P^G σ)~ ≅ i_P^G σ̃ naturally, characteristic zero, P\G compact. |
| SR.0.4 *smooth-dual* (4) | same file, lines 928–940 | Over such a field V ↦ Ṽ is exact and V → Ṽ̃ is an isomorphism iff V is admissible. |
| AutomorphicLFunctionsAndLocalFactors AL.1.3.1 (3.29) | `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1140`–1160 | ε(s, ω, ψ_β) = |β|^(s−1/2) ω(β) ε(s, ω, ψ) with the self-dual measure. |
| AL.3.2.1, AL.3.3.2 | same file, lines 1924 and 1999 | Local Rankin–Selberg integrals and the local functional equation defining γ(s,π_n×π_m,ψ) with the self-dual Fourier transform at equal rank. |
| AL.3.7.2 | same file, line 2193 | Strong multiplicity one for isobaric sums; for arbitrary automorphic constituents only equality of cuspidal support. |
| EndoscopicTransferAndUnitaryTraceComparison §10.29 | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4193`–4206 | Pair L/γ/ε of a Langlands quotient defined as the product over ordered essentially square-integrable blocks. |
| CFK §1, p.7 (line 271) | CFK lines 264–275 | GSpin₂ = GL₁×GL₁, C^• = e₀∨(GL₁), the outer involution of SO_(2l)/GSpin_(2l) as the permutation of the last two simple roots, two Siegel parabolics exchanged by it. |
| CFK Corollary 4.11 (lines 1817–1828) | CFK lines 1818–1828 | Supercuspidal globalization then Theorem 4.10; general π′ a constituent of (σ₁×…×σ_d)⋊π₀ with transfer any subquotient of ×σ_i × Π₀ × ×χ_π σ_i∨, "by (3.9) and multiplicativity". |
| CPS94 Lemma 2.1 (lines 249–255) | CPS94 lines 248–255 | Local display with d = nm − m(m+1)/2, then the product formula and invariance of the central characters under k^×. |

The §5.0 route is sound as written: π̃ is an irreducible subquotient of i_P σ̃ (exactness of the dual and the induced-contragredient isomorphism), SR.3.1 embeds it into i_P(wσ̃), and dualizing with (i_P(wσ̃))~ ≅ i_P(wσ) and π̃̃ ≅ π (admissibility) gives π as a quotient of i_P(wσ); w normalizes M, so the standard parabolic is P itself. The classical-coordinate description was checked on the root data: for Sp and odd SO/GSpin the sign change s_(e_i) acts trivially on the tail's root datum, so the transported tail is isomorphic to π₀; for GSpin the reflection sends e_i∨ ↦ e₀∨ − e_i∨, which is exactly the χ_π ⊗ σ_i∨ rule; for even SO/GSpin an odd-size block inversion is in the Weyl group only together with the outer involution on the tail, and the involution of the GSpin root datum that swaps the last two simple roots fixes e₀∨ (e_n∨ ↦ e₀∨ − e_n∨, e₀∨ fixed), so χ_π is preserved by θ as §10.6 requires.

The §10.6 route for full-datum invariance was checked for circularity: it consumes §§10.0, 10.2, 10.4, 10.5 for the tail group of rank c−2l; none of those cites §10.6 (the only other mention of §10.6 is the scope clause at line 1658), and §10.4/§10.5 are stated for all five families in every rank c>1, with the rank-2 tori handled by §6.11's unordered pair. The multiset {σ_i, χ_π σ_i∨} is invariant under σ_i ↦ χ_π σ_i∨ because χ_π(χ_π σ_i∨)∨ = σ_i. The claim that θ becomes conjugation in the standard representation holds because the dual outer involution lies in O_(2m)(ℂ) ∖ SO_(2m)(ℂ).

**Seeded sample, where it falls in the changed passages.** 10.6: CFK Corollary 4.11, p.42, lines 1818–1828 re-read; the roadmap's stronger statement (the original datum with π₀ retained also transfers) is now proved through the conjugated quotient datum plus the support invariance rather than asserted from the quotient-only identity (3.9). 10.2 and 10.4, cited by the new §10.6 text, were re-read at their locators (CFK lines 738–748, HEN02 line 216; CFK line 1749); their statements are untouched and support the uses made of them (support invariance of GL γ-factors; weak transfer of every cuspidal π in rank c>1). The remaining seeded targets are untouched by the diff; their r1 audit rows carry forward.

**Adversarial table.** Rows for every statement the diff leaves untouched are carried forward from the r1 report (163 rows, all Pass except the two findings now repaired): Conventions; 0.0–0.4; 1.1–1.3; 2.0–2.4; 3.1–3.4; 4.1–4.10; 5.1–5.6; 6.1–6.11; 7.1–7.6; 8.0–8.5; 9.1–9.5; 10.0–10.2, 10.4, 10.5, 10.7 and the untouched parts of 10.3 (testing ranks, convergence bound, fixed twist). The rows below were computed this round for the changed statements.

| Statement | Instances tried | Values on the two sides / wrong-model value | Result | Change |
| --- | --- | --- | --- | --- |
| 5.0 dual route | GL₂, σ = ν^(1/2)⊗ν^(−1/2), π = trivial quotient of i_B σ | π̃ = trivial is a subrepresentation of i_B σ̃ = ν^(−1/2)×ν^(1/2) (w = 1); dualizing, (i_B σ̃)~ = i_B σ ↠ π̃̃ = π; for π = Steinberg the embedding needs w ≠ 1 and the quotient datum is ν^(−1/2)⊗ν^(1/2) | Pass | None |
| 5.0 SO₄ orbit | D₂ Weyl group on (2,1) | s_(e₁−e₂): (1,2); s_(e₁+e₂): (−1,−2); both: (−2,−1); four elements, (−2,1) absent | Pass | None |
| 5.0 SO₄ Spin pullback | torus (x,y) ↦ (xy, x/y) | ν^a(xy)ν^b(x/y) = ν^(a+b)(x)ν^(a−b)(y): (2,1) ↦ exponents 3,1; (1,2) ↦ 3,−1 | Pass | None |
| 5.0 SO₄ constituents | SL₂ exponents 1 and 3; −1 and 3 | exponent 1: trivial quotient, Steinberg sub (GL₂ Check, torus value ν(x)); exponent 3: ν³ ≠ ν^(±1) and not quadratic, irreducible; so I(2,1) has 2 constituents, 1 quotient; I(1,2) has the Steinberg⊠irreducible quotient | Pass | None |
| 5.0 tail transport, odd types | GSpin_(2n+1) reflection s_(e_i) on X∨ | e_i∨ ↦ e_i∨ − ⟨e_i, e_i∨⟩(2e_i∨ − e₀∨) = e₀∨ − e_i∨; e_j∨, e₀∨ fixed | Pass (χ_π σ_i∨ rule; tail datum fixed) | None |
| 5.0 tail transport, even types | SO_(2n), odd block size β_i with tail SO_(2m), m≥1 | −1 on β_i coordinates is an odd sign change, not in W(D_n); with one tail sign change it is, and that is the tail's outer involution | Pass (statement's "when required" clause) | None |
| 5.0 GSpin diagram involution fixes e₀∨ | GSpin_(2n) root datum | ι: e_n∨ ↦ e₀∨ − e_n∨, e₀∨ ↦ e₀∨; α_(n−1)∨ = e_(n−1)∨ − e_n∨ ↦ e_(n−1)∨ + e_n∨ − e₀∨ = α_n∨; pairings ⟨e₀, e_n∨⟩ = 0 = ⟨e₀+e_n, e₀∨−e_n∨⟩ | Pass | None |
| 5.0 reflected GSpin GL₁ block Check | σ = 1, χ_π(ϖ) = −1 | χ_π ⊗ σ∨ at ϖ: −1; σ∨ at ϖ: 1 | Pass | None |
| 10.3 ψ-change exponent sum | blocks n = (2,1), k = (1,1) | Σ n_i k_j = 2+2+1+1 = 6 = 3·2 = Nk | Pass | None |
| 10.3 ψ-change central characters | same blocks | ∏_i ω_(δ_i)(b)^(Σ_j k_j) = (ω_(δ₁)ω_(δ₂))(b)² = ω_Π(b)^k; ∏_j ω_(δ′_j)(b)^N = ω_τ(b)^3 | Pass | None |
| 10.3 Check 1 | N=3, k=1, ℚ₃, b=3, s=1/2 | three Tate ratios |3|^(0)·1 = 1, product 1; CPS94 exponent 3s−3+1 = −1/2 at s=1/2 gives |3|^(−1/2) = √3 | Pass | None |
| 10.3 Check 2 | same, s=1 | (3^(−1/2))³ = 3^(−3/2); exponent s instead of s−1/2 gives (3^(−1))³ = 3^(−3) | Pass | None |
| 10.3 Check 3 | b=1; N=k=1 | all scalars 1; ω_Π(b)ω_τ(b)|b|^(s−1/2) = AL.1.3.1 (3.29) for ω = ω_Πω_τ | Pass | None |
| 10.3 Check 4 | b=3 ∈ ℚ×, N=3, k=1 | |3|₃^(3(s−1/2)) = 3^(−3(s−1/2)), |3|_∞^(3(s−1/2)) = 3^(3(s−1/2)), other places 1; product 1 for every s | Pass | None |
| 10.3 CPS94 display versus rank one | n=m=1 | CPS94 exponent s−1+1 = s; self-dual exponent s−1/2; the difference |b|^(1/2) is the ratio of the self-dual measures for ψ_b and ψ | Pass (normalization difference recorded correctly) | None |
| 10.6 GL block invariance | pair {σ, χ_π σ∨} | image {χ_π σ∨, χ_π(χ_π σ∨)∨} = {χ_π σ∨, σ} | Pass | None |
| 10.6 SO₄ Check | data (2,1), (1,2) at ϖ=3 | {3^(−2),3^(−1),3,3²} both; product 1; fixed-tail (1,1): {1/3,1/3,3,3} | Pass | None |
| 10.6 SO₄ tail involution Check | roots {2,3,1/3,1/2} | second coordinate inverted: {2,1/3,3,1/2}; same multiset, determinant 1 | Pass | None |
| 10.6 GSpin torus Check | χ_π(ϖ) = −1, σ(ϖ) = 2 | pair (2, −1/2), determinant −1; exchanged (−1/2, 2); without χ_π (2, 1/2), determinant 1 | Pass | None |
| 10.6 degree Check | d rank-one blocks, exhausted tails | Sp: 2d+1 (Sp₀ tail degree 1); SO, GSpin: 2d; agrees with §0.3 degrees for Sp_(2d), SO_(2d), GSpin_(2d) | Pass | None |
| 10.6 θ-route non-circularity | §§10.0, 10.2, 10.4, 10.5 on the tail | no *Needs:* line of those sections names §10.6; tail rank c−2l ≥ 4 in even type, else torus | Pass | None |
| 10.6 standard parameters under θ | dual involution on SO_(2m)(ℂ) | element of O_(2m)(ℂ) ∖ SO_(2m)(ℂ), hence GL_(2m)(ℂ)-conjugation | Pass | None |

**Ownership and duplication.** The changed passages add no construction: §5.0 is the quotient form of a supplied theorem and says so; the character-change identity and the θ-invariance of γ remain targets here (no supplier states them; EndoscopicTransferAndUnitaryTraceComparison §10.29 defines the nongeneric factors but not their ψ-dependence, SR.3.1 gives embeddings not quotients). `Suggested.lean` declares nothing, so no fully qualified name can collide. Ownership against open pull requests was checked through the sibling checkouts and the `roadmaps show` heads named in the brief for the three suppliers cited by the diff.

**Declared gaps.** Unchanged since the previous review: the registry's slugged requests are local targets in this README (§5.0 for `classical-support-quotient`, §10.3 for `nongeneric-pair-epsilon-character-change`), and the six G-records remain settled as not actionable. Nothing in the diff adds or removes a gap.

## Not verifiable

- **CFK22, KAP23, YAM14:** settled uncertified; untouched by the diff and not requested.
- **The CPS94 local exponent's intended measure:** CPS94 lines 248–250 give the display with d = nm − m(m+1)/2 but do not say which additive measures are fixed; the roadmap's reading (a non-self-dual normalization, global argument unaffected) is consistent with the rank-one discrepancy |b|^(1/2) computed above, but the source's own convention cannot be confirmed from its text.

## Source issues

- **Gap** in CPS94 at Lemma 2.1 proof, printed p.163 (CPS94 lines 249–250): the source says the local ε-factor changes under ψ ↦ ψ_b by the power nm·s − d of |b| with d = nm − m(m+1)/2, without naming the additive measures; it should be nm(s−1/2) with self-dual measures on both sides, the difference being the measure ratio; affects the proof (the global conclusion survives by the product formula).
