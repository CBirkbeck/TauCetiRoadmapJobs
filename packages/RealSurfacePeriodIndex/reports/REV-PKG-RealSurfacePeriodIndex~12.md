<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13094#issuecomment-6913770060 -->
Review (claude) of 40ff3c2

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §1.1 cites an affine-only injectivity statement for a non-affine open

   **Location.** `packages/RealSurfacePeriodIndex/README.md:552` (§1.1, standing line): "Br(U) ↪ Br(k(X)) for open U (injectivity for regular integral schemes)."; `README.md:579` (§1.1 *Needs:*) and `README.md:771` (Layer 1 Dependencies): "SchemeAndStackFoundations §2.22 (`brauer_regular_injectivity`)".

   **Claim.** SchemeAndStackFoundations §2.22 supplies the injectivity of Br(U) → Br(k(X)) for every open U of a smooth integral X, with Br = H²_ét(·, 𝔾_m).

   **Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5597` on main: "Prove `brauer_regular_injectivity`: for **affine** `X` regular integral and Noetherian, `Br(X) → Br(K(X))` is injective" (the Azumaya group). U = ℙ²_ℝ (the §7.6 Check) is not affine.

   **Exact repair.** The fact is HeightsRationalPointsAndObstructions §2.16b, which §1.1 already cites: `smoothBrauer_residueExact` is exact at Br X for smooth integral X in characteristic zero and every dense open (its API `restrict_injective`), and that section states the generic injection.

   - `README.md:552`: replace "Br(U) ↪ Br(k(X)) for open U (injectivity for regular integral schemes)." by "Br(U) ↪ Br(k(X)) for every nonempty open U, by the injectivity clause of `smoothBrauer_residueExact` (exactness at Br of the smooth variety U for each of its dense opens, and the generic injection stated there)."
   - `README.md:579`: delete "SchemeAndStackFoundations §2.22 (`brauer_regular_injectivity`); " from the *Needs:* line of §1.1.
   - `README.md:771`: delete "SchemeAndStackFoundations §2.22 (`brauer_regular_injectivity`); " from the Dependencies of Layer 1 (no other section of Layer 1 uses it).
   - Leave §0.9 (`README.md:385`, the regular local ring `O_{C,x}`, which is affine), its *Needs:* line, the Layer 0 Dependencies and the contract line `README.md:76` as they are.

   **Repair test.** U = ℙ²_ℝ, smooth integral over ℝ, dense open 𝔸²_ℝ: Br(ℙ²_ℝ) = Br(ℝ) = ℤ/2 → Br(𝔸²_ℝ) = ℤ/2 → Br(ℝ(x, y)), the Hamilton class going to ℍ ⊗ ℝ(x, y), a division algebra because ℝ(x, y) is real; injective, and given by §2.16b with no affineness. On the instance of §0.9 (C = 𝔸¹_ℝ, x = 0, `O_{C,x}` = ℝ[t]_(t)) the citation kept there applies as stated: Br(ℝ[t]_(t)) → Br(ℝ(t)) is injective and (−1, t) is not in its image (residue −1 ≠ 1 in ℝˣ/ℝˣ²). §5.2 (`README.md:1427`, "Br(T) → Br(T_U) is injective") already cites `smoothBrauer_residueExact` only and needs no change.

One finding, P3 (a supplier cited for a statement it does not make; the fact is owned by another supplier the same section already cites). The three round-11 findings are repaired. `Suggested.lean` elaborates with `sorry` as the only warning, no statement is padding, the dependency check is clean and the three declared supplier gaps are still valid contracts. No package file was changed by this review; `sources.toml` gained no entry.

## Verified sound

### Round-11 findings

| Finding | Repaired passage | Status and recomputation |
|---|---|---|
| F01 (P2), §2.8 | `README.md:950–951`: "Over the generic point of S, the surface T_b meets ℙ¹ over ℂ(S) in the zero scheme of a nonzero binary form of degree dn … the degrees [L_i : ℂ(S)] add up to dn" | **Repaired.** Against B19 lines 244–248 the new steps share no run of 8 words (mechanical sweep) and do not follow its clauses: the source takes the degree of T over S, the README decomposes the generic fibre. Mathematics: the generic fibre is a localisation of the reduced T_b, hence reduced; a nonzero form of degree dn ≥ 1 has length dn, so r ≥ 1; α = 0, n = d = 1: length 1, one field of degree 1, gcd(1, 2) = 1; Enriques, n = 2: gcd(2d, 2d + 2) = 2; 2T₀ ∈ \|2H\|: length 2, one dominating component of degree 1, 1 ≠ 2, so reducedness is used. |
| F02 (P3), §0.10 | `README.md:409`: "EKM, Lemma 19.4, p. 80, for the direction "an isotropic residue form makes q isotropic", which uses completeness; EKM, Lemma 19.5, p. 80, for the direction "anisotropic residue forms make q anisotropic"" | **Repaired.** EKM line 4161 (Lemma 19.4, complete DVR, printed p. 80) and lines 4168–4174 (Lemma 19.5, any DVR, p. 80) read. ⟨1, y₁, −y₂, −y₁y₂⟩: residue forms ⟨1, y₁⟩, ⟨−1, −y₁⟩ at y₂, then ⟨±1⟩ over ℂ, all anisotropic; ⟨1, −1⟩ ⊥ t⟨1⟩ over ℝ((t)): zero (1, 1, 0), residue ⟨1, −1⟩ isotropic. `sources.toml` carries "Lemmas 19.4, 19.5, 19.10; Exercise 19.15". |
| F03 (P3), §§7.11, 7.13 and two Lean binders | `README.md:2092`: "Let K be a field extension of ℝ of transcendence degree 2, not necessarily finitely generated, in which −1 is a sum of squares"; `README.md:2132` the same with degree 1; `Suggested.lean:145–149`, `158–162` without `[Algebra.EssFiniteType ℝ K]` | **Repaired.** `#check` shows exactly `[Field K] [Algebra ℝ K]`, `Algebra.trdeg ℝ K = 2` (resp. `1`), `¬IsSemireal K`, `[FiniteDimensional K V]`, `5 ≤ Module.finrank K V`. Algebraic closure of ℝ(x, y): every form of dimension ≥ 2 isotropic; ℝ(x, y), ⟨1, 1, 1, 1, 1⟩: anisotropic, so nonreality is needed; ℂ(x, y, z), ⟨1, x⟩ ⊗ ⟨1, y⟩ ⊗ ⟨1, z⟩: dimension 8, anisotropic by Springer three times; ℂ(x, y), q₁ = ⟨1, x, y, xy, 0⟩, q₂ = ⟨0, 0, 0, 0, 1⟩: no common zero. B19 lines 1305–1308 (p. 95) derive 0.10 and 0.13 from 0.12, stated for every field of transcendence degree 2 (line 138, p. 66). |

The repaired pattern in the rest of the package: the other five declarations with `Algebra.EssFiniteType` (de Jong, the norm bound, Theorems 0.3 and 0.4, sharpness of 0.12). Sharpness needs it (over an algebraic closure of ℝ(x, y) there is no anisotropic form on K⁴). The other four are stated at the generality of B19 (Theorems 0.1, 0.3, 0.4 are stated for surfaces) and their routes (§§2.9, 2.10, 7.4, 7.6) use a projective model, so the hypothesis is used; no finding.

### Adversarial table (repaired passages, sampled targets, headlines, the target of R01)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.3 real closure at an ordering | F = ℝ; F = ℚ; F nonreal; ℂ ⊃ ℝ; ι(P) ⊂ squares versus ι⁻¹(squares) = P | one ordering, (ℝ, id); real algebraic numbers; no ordering, predicate empty; ℂ not real closed; the squares of R are an ordering whose comap contains P, and an ordering contained in another equals it | sound |
| §0.3, Br(R) for R real closed | R = ℝ | Br(R(i)/R) = Rˣ/norms = Rˣ/R_{>0} = ℤ/2; H³(G, ℤ(1)) = ℤ/2 on the topological side (§1.2 Check) | sound |
| §0.5 (uses §0.3) | M_d(R); ℍ_R; M_{d/2}(ℍ_R) | trace form signature d; 2⟨1, −1, −1, −1⟩ of signature −2; (d/2)·(−2) = −d | sound |
| §0.11 Amer–Brumer | ⟨1, −1⟩ twice over ℝ; ⟨1, 1⟩ and ⟨1, −1⟩; x² + xy + y² twice over 𝔽₂; both forms 0 | (1, 1) common, (1 + t)⟨1, −1⟩ isotropic; no common zero and ⟨1 + t, 1 − t⟩ isotropic iff t² − 1 is a square, it is not; x² + x + 1 has no root in 𝔽₂(t); every vector common, 0 isotropic | sound; EKM Theorem 17.14 is for arbitrary fields and arbitrary forms |
| §0.7 (consumed by §7.13 via §0.14) | i = 0; F(x) step | more than d⁰ = 1 variable: algebraically closed; N(m + 1) unknowns against (dm + c + 1)·d^i, N ≥ d^{i+1} + 1 wins for m large | sound |
| §1.1 unramified locus | (x, y) on 𝔸²_ℝ; 2(x, y); Spec of a field; U = ℙ²_ℝ | residue at x = 0 is the class of y in ℝ(y)ˣ/2, nonzero; U_{2α} = 𝔸²; U_α = X; ℙ² not affine | statement sound; citation R01 |
| §1.2 Kummer and topological sequences | Spec ℝ; ℙ¹_ℂ, n = 2; degree one on Spec ℝ | H^q(G, ℤ(1)) = 0, ℤ/2, 0, ℤ/2 for q = 0..3, so Br(ℝ)[2] ≅ H³[2]; H² = ℤ/2 = Pic/2, Br[2] = 0, κ(O(1)) = c₁ mod 2 with Bockstein in H³ = 0; H¹_G(pt, 𝔽₂) = 𝔽₂ = ℝˣ/ℝˣ² | sound; SchemeAndStackFoundations `brauer_kummer_sequence` is stated for n invertible, as used |
| §1.5 extension of algebraically closed fields | k = K; ℚ̄ ⊂ ℂ, (x, y); ℝ ⊂ ℂ; mα | empty; W_a of degree d = 2 with function field ℚ̄(x, y)(√x), ind ≤ 2 and ind(α_K) \| ind(α); 2 against 1; ind(mα) = ind(mα_K) = 1 gives mα = 0 | sound |
| §1.9 removing points, extending line bundles | S², torus, ℝ² ⊂ ℝℙ² minus a point; ℙ² ⊃ 𝔸²; quadric cone | H¹(Σ, Σ ∖ Z) = ⊕ H̃⁰(S¹) = 0 so injective, 0 → 0, 𝔽₂² unchanged, 0 → 𝔽₂; ℤ → ℤ → 0; Pic 0 against Cl ℤ/2, not onto | sound |
| §2.8 (repaired) | see the first table | | sound |
| §2.9, `index_eq_orderOf_of_isAlgClosed` | period l^r; K₀ ⊂ K countable; 0 and (x, y) over ℂ(x, y) | ind \| l^{r−1}·l; K₀ embeds in ℂ and §1.5 applies twice; 1 = 1, 2 = 2 | sound |
| §2.10, `index_dvd_two_mul_orderOf_of_isRealClosed` | √−1 ∈ K; n odd; Albert's class over ℝ(x, y) | ind = per; ind ∈ {n, 2n} with the same primes gives n; 4 = 2·2 | sound |
| §5.4 boundary component | B19's own formula | B19 line 858 gives (a, b, c) ↦ (0, b + a ∪ [e]₁, …), so [ζ]₁ = [α̃]₀ ∪ [e]₁ when [α̃]₁ = 0; B19 line 861 drops [α̃]₀; in B19 Proposition 6.7 with 4 \| n, Ψ = Θ(α) and [ξ]₀ = 0 on Ψ, so the dropped factor matters in the source's own use | sound, E3 confirmed |
| §5.5 vanishing criterion | chain of step 1; Enriques example | τ = 0 iff γ ∈ im H³_G iff δ ∈ p_*H³_G + H²_G ∪ ω iff [δ]₁ ∈ I + J; minors of B: entries 1, 1, 1, 1, 2, 4, 1, 3, 9; 2×2 minors 1, 3, 2, 2, 8, 6, 1, 5, 6; determinant (2−1)(3−1)(3−2) = 2; fixed points of ι: y = 0 forces x = 0, x = 0 forces By² = 0; X(ℝ): 8 spheres modulo ± = 4, ι antipodal; conj P = ιP needs x_j² = −(By′²)_j ≤ 0; B19 Proposition 8.1 with a₀ = 1 on N₁ ⊔ N₂, a₁ = 0: deg(w₁ ∪ a₀w₁) = 1 + 1 = 0, so the lift exists; c_Ψ = 1_{N₁⊔N₂}·(h₁ + h₃) = h₁, coefficient sum 1, not in w₁^⊥; with cl_R(L) = h₁ + h₂, c_Ψ = h₁ + h₂, sum 0; Assumption 4.1 with T(ℝ) = ∅ and Ψ = S(ℝ): (i) empty, (ii) kernel 0, (iii) H²(∅) = 0 | sound |
| §5.8 integral pushforward adjustment | (c) ⇒ (a); (b) ⇒ (c); t = 0, t = 1 | 2δ + cl(θ₁) − 2(δ − cl(μ) − cl(φ_Ψ) − cl(ν)) = cl(θ₁ + 2μ + 2φ_Ψ + 2ν); 2(δ − p_*γ) = cl(θ − θ₁) and torsion-freeness give θ₂, c_Ψ = cl_R(θ₂ − μ)\|_Ψ; θ = θ₁ + 2μ + 2ν and θ₁ + 2μ + 2M + 2ν, the source's | sound; against B19 lines 883–903 the proof is the README's own (E4, E5) |
| §6.6 Bröcker | ℝℙ²: two lines; the conic x² + y² = z²; x² + y² = 0 (one real point); a line; H − R | l₁l₂/(x² + y² + z²); q/(x² + y² + z²); (x² + y²)/(x² + y² + z²), no other real zero or pole; degree 1, cl_R ≠ 0, excluded; cl_R(H − R) = cl_R(H + R) | sound; the strong reading (no other component meeting S(ℝ)) holds: cl_R(D) = w₁(O(D)\|S(ℝ)) = 0 gives a section of O(D) ⊗ A^{2k} without real zero by Stone–Weierstrass |
| §6.7 (uses §6.6) | orders along R | t = −h₁h₂ru in A^l ⊗ N²(−R): −1 + 1 = 0 with the pole, +1 + 1 = 2 with the source's zero (B19 lines 1164–1170); R(ℝ) ⊂ Ξ, so rt vanishing on R does not touch the sign condition off Ξ | sound, E22 confirmed |
| §7.1 uniform evaluation | n = 2, 4, 6 | t = 1, 0, 1; Θ((n/2)α) = Θ(α), ∅, Θ(α) | sound |
| §7.2, §7.3 (consume §7.1) | cor; induction | cor(mα_T) = 2mα = 0 gives n/2 \| m; ind(α) \| 2·(n/2) = n | sound |
| §7.4, `index_eq_orderOf_of_not_isSemireal` | Albert's class over ℝ(x, y); K nonreal | 4 ≠ 2, excluded since ℝ(x, y) is real; Mathlib `IsSemireal` (Algebra/Ring/Semireal/Defs.lean:38) is "1 + s ≠ 0 for sums of squares s", so its negation over a field is "−1 is a sum of squares" | sound |
| §7.6, `index_eq_orderOf_of_forall_isRealClosed` | ℍ over ℝ(x, y); K nonreal; R not algebraic over K | survives at every ordering, excluded; hypothesis empty, the statement is Theorem 0.3; vanishing depends on the induced ordering only (§0.5), so quantifying over all real closed K-algebras in the universe of K is the same condition | sound |
| §7.8, `not_anisotropic_of_hasZeroTotalSignature` | odd dimension over a real K; degenerate q; nonreal K | 2·dim W odd impossible, predicate false; radical vector is a zero; predicate always true, the classical bound | sound |
| §7.10, `exists_anisotropic_hasZeroTotalSignature` | ⟨1, y₁, −y₂, −y₁y₂⟩; algebraic closure of ℝ(x, y) | y_j sums of two squares, signs (+, +, −, −), signature 0, a 2-dimensional totally isotropic subspace over each real closed R; no anisotropic form on K⁴, so finite generation is needed | sound |
| §7.11, §7.13 and their Lean statements | see the first table | | sound |
| §8.7, §8.8 | no branch component; m_i = 2; m_i = 4 | θ = ϕ; contributes; does not (B19 line 1609: the permutations are even iff 4 \| m_i); identity (7.11) of B19 lines 1625–1639 with ε̂ = ι*cl_R(ϕ) | sound |
| §9.1 image of the first two components | S(ℝ) = ∅; ℙ²_ℝ | 0; H¹_G(ℙ²(ℂ), 𝔽₂) = {0, ω} with [ω]₀ = 1, no condition, image all of 𝔽₂²: the four classes of §7.7 have components (0, 0), (1, 0), (0, h), (1, h), and the support factor is (a₀, a₀w₁) = (1, h) | sound |
| §9.8 square of w₁ | 4 ℝℙ² (the §5.5 surface); one ℝℙ²; two Klein bottles; independent check | 4 = 0; 1, excluded; 0; χ(S(ℝ)) ≡ χ(S(ℂ)) = 12 mod 2, so the number of components of odd Euler characteristic is even | sound, and E25 with it |
| §9.9 (consumes §9.8) | the correcting component Σ | deg(a ∪ w₁) = 1 + χ(Σ) = 0; Σ exists outside Θ: odd count inside, even total | sound |

For the text no repair touched and outside the sample (§§0.6, 0.13–0.15, 1.6–1.8, 2.1–2.7, Layers 3, 4, §§6.1–6.5, 6.8–6.13, 7.9, 7.12, §§8.1–8.6, 8.9, 8.10, 9.2–9.7, 9.10–9.15) this review relies on the round-11 table, whose rows carry computed values; §§0.1–0.15, 1.1–1.9, 2.1, 2.7–2.10, Layer 5, §§6.6, 6.7, 7.1–7.8, 7.11, 7.13, 8.7, 8.8, 9.1, 9.8–9.10 and the closing sections were read in full this round.

### Sources: the seeded sample

The author flagged no locator as unverified. B19 file page N is printed page 62 + N; EKM printed page is file page − 8; MVH98 pages are those of the arXiv version.

| Target | Locator read | Outcome |
|---|---|---|
| 0.3 | B19 lines 1308–1318 (§6.4, pp. 95–96: real closures, the closed sets Z_i) | supported; BCR not read |
| 0.11 | EKM lines 3874–3883 (Theorem 17.14, p. 74, with the attribution to Amer, Brumer and Leep); B19 lines 143–145 (§0.5, p. 66) | supported, any field and any pair of forms |
| 1.1 | B19 lines 506–513 (§2.4, p. 75) | supported |
| 1.2 | B19 lines 249–260 ((1.1), (1.2), p. 69), 516–531 ((2.16), (2.17), p. 76), 1767–1770 (p. 106) | supported |
| 1.5 | B19 §0.6 (p. 68) invokes it without proof, as the README says; the proof is the README's own | supported |
| 1.9 | B19 lines 1661–1663 and 1671–1672 (proof of Proposition 7.1, pp. 103–104), 896–897 (p. 85) | supported |
| 5.5 | B19 lines 748–879 (Proposition 4.4, pp. 81–84; (4.5) at 816, (4.8) at 848–861); MVH98 lines 500–540 (Proposition 4.2, Theorem 4.4, p. 12); B19 lines 1703–1708 (Proposition 8.1, p. 105) | supported as corrected (E3) |
| 5.8 | B19 lines 883–903 (Proposition 4.5, pp. 84–85) | supported as corrected (E3, E4, E5) |
| 6.6 | B19 lines 1162–1167 (proof of Lemma 6.4, p. 92) | the use is supported; BRO80 not read |
| 7.1 | B19 lines 1286–1300 (Proposition 6.7 and proof, p. 95) | the setting is the source's; the statement is the README's own |
| 7.13 | B19 lines 143–147 (§0.5 and Theorem 0.13, p. 66), 1305–1307 (p. 95); BW20II line 1018 (Proposition 8.3) | supported |
| 8.7 | B19 lines 1619–1625 (proof of Proposition 7.4, pp. 102–103) | supported |
| 8.8 | B19 line 1471 (Proposition 7.4, p. 99), lines 1625–1652 (pp. 102–103) | supported |
| 9.1 | B19 lines 1703–1742 (Proposition 8.1 and proof, pp. 105–106) | supported; BW20 not reopened |
| 9.8 | MVH98 lines 500–540 (p. 12); B19 lines 1782–1790 (p. 107) | supported |

All 23 cited works have a manifest key (ids listed in `sources.toml`), every key occurs in the body, and the manifest has no machine path.

### Lean

`lake env lean` on `packages/RealSurfacePeriodIndex/Suggested.lean`, run from the content checkout: exit 0, eight `declaration uses sorry` warnings (lines 82, 91, 103, 114, 125, 135, 145, 158), nothing else.

Padding probe on a scratch copy, all eight theorems: `fail_if_success (first | (simp; done) | rfl | infer_instance | decide | (aesop; done) | (simp_all; done) | omega | trivial | (exact?; done) | (intros; simp_all; done) | (intro h; exact h) | (constructor <;> simp_all; done))` before each `sorry`: exit 0 and no error, so none of these closes any goal. `#check @name` for the nine declarations in the same file: each elaborated type equals its README statement (binders listed in the first table for the two changed theorems; the other seven keep `[Invertible 2]`, `[FiniteDimensional K V]`, `[Algebra.EssFiniteType …]` and `Algebra.trdeg … = 2` where the README has them); nothing was lost and nothing changed.

Headlines of the Summary: de Jong's theorem and the norm bound, Theorems 0.3, 0.4 (birational form), 0.10, 0.12 (two statements) and the pair-of-quadrics form of 0.13 are stated; the scheme form of 0.4, Theorems 0.5 and 0.6, Proposition 0.7 and the del Pezzo form of 0.13 are named in the module docstring with the missing carriers. The README's backticked names of its own are exactly the nine declarations (each occurs in the README). No `set_option`, no sorry'd data, no `lemma`, no `example`. The three `TauCeti.*` imports are each used (`index`, `mk`, `baseChange`).

### Pinned declarations

78 name-and-line locators of the two contracts compared with the pinned files (41 by a script on the first locator of each bullet, 37 further "same file, line N" locators by hand): each cited line carries the cited name. Opened besides: Mathlib `Algebra/Order/Group/Cone.lean:60–63` (`LinearOrder.ofSubmonoid` with `to_additive`, the origin of `LinearOrder.ofAddSubmonoid`), `Algebra/Ring/Semireal/Defs.lean:36–38`; Tau Ceti `Algebra/CentralSimple/Index.lean:99` (`index`), `Algebra/BrauerGroup/BaseChange.lean:136, 148` (`baseChange` on `BrauerGroup.{u, u}`, `baseChange_mk`). Absent at the pins: an `IsRealClosed` statement for the Puiseux field (no occurrence under `RingTheory/LaurentSeries`), a space of orderings with the Harrison topology, a u-invariant, a C_i predicate, the Amer–Brumer theorem.

### Suppliers, direction and ownership

Dependency check, whole output:

    depcheck: 259 roadmaps, 2473 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. The citation resolver lists no cross-roadmap citation and no Lean name found nowhere. The overlap file lists no dropped id, no revision-only id, no conflicting head and no second copy.

Resolved at the current heads, by heading or name: MotivesAndAlgebraicCycles §§0.5b, 7.6a, 7.6b, 7.8, 7.10 (its lines 161, 1422, 1435, 1464, 1500); AlgebraicTopologyPartII Layer 6 and §§7.4, 9.2, 9.3, 10.3, 10.5, 12.1, 12.2, 14.1–14.3, 15.1–15.6, 16.1–16.4; ComplexComparisonPartII C5.2, C5.3, C6.2, C6.3; HeightsRationalPointsAndObstructions §§2.16b, 2.19a with `smoothBrauer_residueExact`, `pullbackMultiplicity`, `brauerResidue_henselianFormula`, `finiteFlatBrauerCorestriction`; SchemeAndStackFoundations §§0.6, 0.9, 2.16 (`tsen_theorem`, function fields of transcendence degree one), 2.22 (`brauer_field`, `brauer_kummer_sequence`, `brauer_henselian_local`, `brauer_regular_injectivity`: R01), 3.4 (`classGroup_picard_locallyFactorial`, `picard_excision_sequence`), 4.13 (`bertini_smoothness`); EnriquesSurfaces §§1.1, 1.3, 1.4; RealAlgebraicGeometry Layer 1 (a completed roadmap on main); QuadraticFormInvariants Layers 0, 1, 2, 4, 5; FormalLaurentPuiseux (no statement of real closedness there, so §9.11 has no other owner).

The three gaps have the same slugs in the README and in `design/plan.json`, each with a named supplier and section and one sentence with its hypotheses, and none is provided today. AlgebraicTopologyPartII has gained §16.1c at its head (existence of normalised control data compatible with a stratumwise submersion), but §16.2 still reads "Invariant control data are a hypothesis of this statement", and §16.1c does not give invariance under the involution, which is what `gap:at2-stratified-pair-transport` asks for. MotivesAndAlgebraicCycles §7.8 still uses the torsion-free cokernel without stating it by name. ComplexComparisonPartII has no comparison over ℝ.

Duplication by object, searched on main and at the open heads: Harrison topology and spaces of orderings (no match anywhere), a real closed Puiseux field (no match), the declaration names of `Suggested.lean` (no match), period and index of a Brauer class, the Elman–Lam invariant, Albert forms, Amer–Brumer: no other owner. The Tsen–Lang theory is stated here (§0.7) and in QuadraticFormInvariantsPartII §§5.1–5.6 (merge order line 391 against 229 here); the round-4 repair report marked this not actionable in this package, the reason holds (the later roadmap is the one to cite the earlier) and it is not re-raised.

Overlap check: read QuadraticFormInvariantsPartII, LogicAndDefinabilityInNumberTheoryPartII, AlgebraicTopologyPartII, MotivesAndAlgebraicCycles, QuadraticFormInvariants (open); QuadraticFormInvariants, RealAlgebraicGeometry, SchemeAndStackFoundations (main); the Tsen–Lang theory is shared with QuadraticFormInvariantsPartII and its owner is this roadmap (§0.7), the earlier one; nothing else shared.

### Shape, policy and source independence

Checked by script over the 108 numbered sections: every one has a *Needs:* line and Checks; every section with an API list has at least three Checks; each of the ten layers ends with Examples and Dependencies. No LaTeX delimiter, pull-request number, path, round label, HTML anchor or process word (a sweep for sixteen such patterns returns only the word "Lemma" in locators). No algorithm. The header of `Suggested.lean` is the `module` form with `public import`, as 94 `Suggested.lean` files on main have it (see the last section).

Arrangement against B19 (136 of 278 occurrences of a source key), by number: Layer 1 ↔ §2 in part, Layer 2 ↔ §1, Layer 3 ↔ §3, Layer 4 ↔ §5, Layer 5 ↔ §4, Layers 6–7 ↔ §6, Layer 8 ↔ §7, Layer 9 ↔ §8. Layer 0 has no counterpart, Layers 1 and 2 and Layers 4 and 5 reverse the source, §6 is split, and Layer 1 adds de Jong's reduction from CT05. Layer 3 before 4 and 5, Layer 6 after both, Layer 7 after 6 and Layer 9 after 7 and 8 are forced by the *Needs:* lines (§§4.1, 5.1 need §3.2; §6.13 needs Layers 4 and 5; §7.2 needs §6.13; §§9.6, 9.7 need §§7.7, 8.10). Not a one-to-one run.

Wording: a mechanical sweep of the README and of `Suggested.lean` against the cached texts of B19, MVH98, BW20, EKM, BEC05, BEN18, VOI06, VA13 and BW20II for shared runs of eight words or more. Outside the reference list its hits are the statement of Lemma 6.4 in §6.7 (formula letters, examined in round 10), stock names ("the real integral Hodge conjecture for 1-cycles on", "smooth complete intersection of two quadrics") and nothing in the Lean docstrings beyond a title. By hand, 14 passages beside their sources at the locators above: §§0.3, 0.10 (step 2 against EKM Lemma 19.5: the same forced argument, direct instead of by contradiction), 0.11, 1.1, 1.2, 2.8, 5.5, 5.8, 6.6, 7.1, 7.11, 7.13, 8.7, 9.1; none follows its source clause by clause. CT05 is in French and was not swept.

Source independence: 14 passages compared with 4 sources (B19, EKM, MVH98, BW20II), none shared; largest share B19, 136 of 278 locators; contents compared with B19: independent.

## Not verifiable

- BCR, ARA75, SPR55, EL73, BRO80, DK96, CTP90, SER06, SCH94, GG73, BRE97, DIM85, DIK00 are settled uncertified; their texts were not read. §§6.5, 6.6, 9.13 and the sign statement of §9.12 rest on them through B19. For §6.6 the statement was checked independently (table), not against BRO80.
- That τ ≠ 0 in the Enriques example of §5.5 rests on AlgebraicTopologyPartII §16.4 and on the equivalences of step 1 of the section; the inputs of the example and each equivalence were recomputed, the comparison of that supplier was not reproved.
- CT05, VOI06, VA13, BEN18, BEC05 and BW20 were not reopened this round beyond the wording sweep; the targets resting on them are outside this round's sample and rest on the round-11 table.

## Source issues

Only what was confirmed against the text in this round.

- **Error** in B19 at proof of Proposition 4.4, printed p. 84, after (4.8): the source says the degree-one boundary component on the avoided set equals the cover class; its own displayed formula gives that class times the degree-zero component of the lift; affects a stated result.
- **Error** in B19 at Theorem 0.6 (ii) and its proof, printed pp. 65 and 107: the source says one nonempty half with an odd number of components of odd Euler characteristic gives index 4; it should say this case never occurs, the Euler characteristic of the real locus being even; affects the proof.
- **Error** in B19 at proof of Lemma 6.4, printed p. 92: the source says the auxiliary function vanishes to order one along the ramification divisor; it should have a simple pole there, otherwise the section constructed vanishes on that divisor; affects the proof.
- **Gap** in B19 at proof of Proposition 4.5, printed pp. 84–85: the source says an integral class equals a mod-two class plus integral classes; it should use an integral lift of the mod-two class; affects the proof.
- **Gap** in B19 at proof of Theorem 0.12, printed p. 95: the source says K is the union of the finite extensions of a finitely generated subfield carrying the class; it should first add a transcendence basis to that subfield; affects the proof.
- **Misprint** in B19 at proof of Proposition 0.7, printed p. 107: the source says the quaternion class lies in the Brauer group of the function field over the reals; it should be over the Puiseux field; affects nothing.
- **Misprint** in B19 at proof of Theorem 0.6, printed p. 107: the source says the class with zero degree-zero component is unique; it should say the unique nonzero such class; affects nothing.

## For the human reviewers

- **Ownership.** QuadraticFormInvariantsPartII (open; its README lines 58, 83, 2029, §§5.1–5.6) and this package (§0.7, `README.md:24`) each state the Tsen–Lang theory and each names the other as consumer; this package is earlier in the merge order (line 229 against 391).
- **Scope.** `packages/RealSurfacePeriodIndex/README.md:24` and source corrections E3 and E25 replace Propositions 4.4 and 4.5 of the refereed source B19 by other criteria and call Theorem 0.6 (ii) vacuous; no refereed source states these corrections.
- **Licence.** EKM is read from an author page, BEC05 and VA13 from institutional hosts (`sources.toml`, classes `author-page` and `institutional`); thirteen works are cited by locator without their text.
- **Supplier outside the merge order.** EnriquesSurfaces §§1.1, 1.3, 1.4 is consumed from an open pull request that adds the roadmap; `merge-order/ORDER.txt` lists EnriquesSurfacesAndIntegralNonexistence (line 325) but not EnriquesSurfaces.
- **Import header.** `packages/RealSurfacePeriodIndex/Suggested.lean:1–6` uses `module` with `public import Mathlib` and `@[expose] public section`; the brief's form names the single line `import Mathlib`, and main has both forms.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "40ff3c23136f2965b807b26a4b3441529280bc6f", "job": "REV-PKG-RealSurfacePeriodIndex~12", "model": "fable", "worker": "chris-x82"} -->
