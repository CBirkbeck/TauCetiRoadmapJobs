<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1082#issuecomment-6401644392 -->
Review (claude) of a7c1e22

Verdict: accepted
Conditional on the announced gaps: `relative-numerical-component-reduction`, `proper-bigness-birational-comparison`, `proper-picard-nonflat-descent`, `proper-hilbert-space-tangent`, `relative-exceptional-degree-witnesses`, `projective-nef-big-criterion`

1. **F01** (P3) Module docstring names the wrong missing carrier for §3.7

   **Location.** Suggested.lean:13–15: "The semiample contraction dictionary, numerical uniqueness and projective contraction descent lack relative global generation, the section algebra and relative Proj."

   **Claim.** Descent of geometric projective contractions (README §3.7, an end theorem of the Summary) is unstatable because the section algebra and relative Proj are missing.

   **Witness.** The statement of §3.7 (README:698) uses only `HasTrivialNumericalGaloisAction`, `IsContraction`, the base-change square of §3.6 and "Ȳ projective over k̄". The section algebra and Proj enter only its proof. What the pins lack for the statement is a projectivity predicate: `Mathlib/AlgebraicGeometry/Morphisms/` at `6b7abb3` contains no `IsProjective` (its files are Affine … WeaklyEtale; no Projective), and the pinned Tau Ceti has none either. The verdict "not statable" is therefore correct; the reason given is not the one that applies.

   **Exact repair.** In the docstring, separate §3.7 from §3.4: "Projective contraction descent lacks a projectivity predicate for proper schemes over a field; the semiample dictionary and numerical uniqueness lack relative global generation, the section algebra and relative Proj." Tested against the instance: with a projectivity predicate added to the pins, §3.7 would be statable with the §3.6 shape (`IsContraction f'`, `IsPullback v y' y b`, projectivity of `y'` and `y`) and nothing else; without it, it is not.

2. **F02** (P3) §1.3 cites KLE05 Theorem 6.16 for a statement it does not make

   **Location.** README:264: "(BMP23, Remark 2.22, p. 19; BMP23 line 825; KLE05, Theorem 6.16 and proof, pp. 58–59; KLE05 line 2793)", at the claim that Num(X/S) is free of finite rank for proper f over Noetherian S.

   **Claim.** KLE05 Theorem 6.16 supports relative finite rank of the numerical group.

   **Witness.** KLE05 line 2782–2785: Theorem 6.16 assumes f projective Zariski-locally and flat with integral geometric fibres, and concludes that Pic^τ_{X/S} is an open and closed group subscheme of finite type. It says nothing about Num(X/S) for a proper f over a Noetherian base; the only support for that is BMP23 lines 829–832 (finite-dimensionality, with the field case from Kleiman 1966 and "the same arguments go through"), which the package replaces by its gap contract.

   **Exact repair.** Keep BMP23 as the locator of the claim, and cite KLE05 Theorem 6.16 only in §2.5 (where its τ-component statement is used) or drop it from §1.3. The repaired locator list for §1.3 is "(BMP23, Remark 2.22, p. 19; BMP23 line 825)".

3. **F03** (P3) References list: double periods and a broken bullet list

   **Location.** README:1080 "…whose extracted PDF has 52 pages.."; README:1092 "…conductor and rational group.."; README:1093 is a blank line separating the PS12 bullet (README:1094) from the list.

   **Claim.** The references are one well-formed list.

   **Witness.** Two sentences end in "..", and the blank line makes PS12 a second list after a paragraph break in rendered Markdown.

   **Exact repair.** Replace ".." by "." at README:1080 and README:1092; delete the blank line README:1093.

Three findings, all P3; no P1 or P2. The three round-3 findings are repaired, and the repairs introduced no new defect. Acceptance is conditional on the six declared supplier gaps listed at the end. Below, README and Suggested.lean mean `packages/AlgebraicModuliForArithmeticGeometryPartII/README.md` and `packages/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean`; library files are relative to the pinned Mathlib and Tau Ceti checkouts; source passages are cited as `<id> line N` into the manifest's line-numbered extractions.

## Verified sound

### Previous findings, checked one by one

| Round-3 finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P2), exceptional self-intersection omitted the residue degree | README:824: "E² = χ_k(O_E(−1)) − χ_k(O_E) = 0 − [κ(x):k] = −[κ(x):k]; at a k-rational point this is −1." README:825: the real degree-two centre gives −2, and (E₁+E₂)² = −1 + 0 − 1 = −2 after extension. README:826: the Aₙ matrix is stated over an algebraically closed field. README:325 (§1.5): "On Bl_p P² at a k-rational point p, the exceptional curve E has O(E)·E = −1". | Repaired. Recomputed: E = P¹ over κ(x), O(E)|_E = O(−1), χ_κ(x)(O(−1)) = 0, χ_κ(x)(O) = 1, restriction of scalars multiplies by [κ(x):k], so E² = −[κ(x):k]; for x = V(u²+1, v) on P²_ℝ, κ(x) = ℂ and E² = −2; over ℂ the two disjoint (−1)-curves give −2, consistent with §4.3's full-pullback law (README:788). The §5.7 value "(−E)·E = 1" (README:1014) is a degree over κ(x) of the fibre curve and is correctly left at 1. No other unqualified "−1" remains: README:192, 205, 612, 797, 853, 856, 870 all specify a rational centre or an individual geometric component. |
| F02 (P2), the étale–Galois dictionary needed commutativity | README:450: "Under the supplied equivalence between commutative étale group schemes over k and discrete abelian groups with continuous Gal(k^sep/k)-action, `Num_{X/k}` corresponds to `Num(X_{k̄}/k̄)` … (SchemeAndStackFoundations §2.15 `etale_galois_comparison`)"; README:45 (supplier contract) and README:458 (*Needs:*) cite the same target; README:467 adds the C₃/S₃ Check. | Repaired. `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3872` on main: `etale_galois_comparison` identifies abelian sheaves on (Spec K)_ét with discrete G_K-modules. The Check computes: constant C₃ is étale in every characteristic (a disjoint union of three copies of Spec k; μ₃ is not used), 1+2 = 2+1 = 0 mod 3, trivial action; in S₃, (12)(23) = (123) and (23)(12) = (132) differ, so S₃ is outside the abelian equivalence. The acting Galois group is not required to be abelian (README:45). |
| F03 (P3), abstract or combined Checks | README:395–399: five concrete §2.2 Checks (k, ℂ, finite B, k×k, k[ε]/ε²); the substitution bullet is gone. README:438–441: §2.5 split into P¹ (τ = 0), elliptic (τ = E), classical Enriques (ℤ/2, SCH23 line 526) and ordinary characteristic-two Enriques (μ₂, SCH23 line 547). README:462–467: the general rational-point assertion is gone; six concrete §2.6 Checks remain. | Repaired. SCH23 line 526–533: Proposition 4.2 gives ω_Y of order two in Pic, automatic for p ≠ 2; SCH23 line 547: the table lists Pic^τ = μ₂ for the ordinary type. The manifest records the added locators under the existing SCH23 key; no key was renamed. |

No finding was marked "not actionable in this package"; nothing is re-raised.

### Principles, shape and policy

Continuation of AlgebraicModuliForArithmeticGeometry with the parent's stopping point named (README:7). Arbitrary proper schemes over arbitrary fields are kept throughout (empty, nonreduced, disconnected, mixed-dimensional; README:19); positivity, smoothness, flatness and completeness enter only where the theorem needs them. No good-prime restriction, no algorithm, no copied passage, no process narrative, no sorry'd data, no `set_option` (grep over README and Suggested.lean: the only "lemma" hits are "Zariski's lemma", "Chow's lemma" and "The lemma is proved here" in prose; the regex over LaTeX delimiters, review words, job ids and machine paths found nothing). The README has the required headings (Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–5 each with Examples and Dependencies, Downstream consumers, Worked examples, References). Every subsection has a locator and a *Needs:* line (51 of 51); every definition has at least three Checks (§0.2: 3; §1.6: 3; §2.3: 3; §4.6: 2 Checks on a theorem, not a definition). Suggested.lean: one module docstring, the namespace, `import Mathlib` plus two existing Tau Ceti modules, seven real-body definitions, seven sorried theorems, no `lemma`, no `#print`/`#eval`/`#synth`, no admitted example. All fourteen Lean names occur in the README (README:91 and the sections); the citation tool's single lead, `Num.free_finiteRank` at README:249, is a supplier target present at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7206` and is cited as such. `metadata.toml` is `topic = "math.AG"`; `sources.toml` has 14 unique keys, all certified from open repositories or the LMFDB; no fetch was needed.

### Seeded source audit

Every sampled target was opened at its locator in the cached extraction.

| Target | Locator read | What the text supports |
| --- | --- | --- |
| 0.1 | KLE05 line 2480 (Def. 6.1); BMP23 line 819; STACKS Varieties line 4474 (0AYW) and 4676 (0BEL) | Numerical equivalence by intersection numbers with complete curves; curves over Z as proper 1-dimensional schemes over closed points; the degree of a locally free sheaf on a proper scheme of dimension ≤ 1 is the multiplicity-weighted sum over the 1-dimensional components, which is README:104; §45 is the Euler-characteristic intersection theory. |
| 1.3 | BMP23 line 825–832; KLE05 line 2782 (Thm 6.16), 2793 | Remark 2.22: Pic^τ(X/S) for proper f of Noetherian schemes tested on every point's fibre curves, closed points suffice, N¹(X/S) finite-dimensional with the field case from Kleiman 1966. Theorem 6.16 is about Pic^τ_{X/S} for projective flat f with integral geometric fibres: R02. |
| 2.1 | KLE05 line 1578 (Prop. 4.17), 1630 (Cor. 4.18.3); SCH23 line 167–184 | Pic_{X/k} exists for complete X over a field, represents the fppf functor, is a disjoint union of open quasi-projective subschemes, locally of finite type; Schröer: exists even for nonreduced, reducible, non-equidimensional X. |
| 2.2 | SCH23 line 313–319 (Lemma 1.4 and proof) | Γ(X⊗A, O) = Γ(X^aff⊗A, O) for every k-algebra A by quasi-compact separated X and flat k → A; reduction to finite X = Spec R. |
| 2.4 | SCH23 line 221–226; KLE05 line 1019–1026 (sequence 2.11.4) | Leray for h gives H¹(X,G_m) → H⁰(k,R¹h_*G_m) → H²(k,h_*G_m), the left arrow the canonical Pic(X) → Pic_{X/k}(k), the right term torsion by Lemma 1.4; Kleiman's five-term sequence with Pic(X/S)(fppf)(T) = H⁰(T,R¹f_{T*}G_m). |
| 2.5 | KLE05 line 2701–2712 (Def. 6.8, Lemma 6.9); SCH23 line 169–173, 526, 547 | G^τ = ⋃_n φ_n^{-1}(G⁰) is an open group subscheme commuting with field extension, closed and of finite type when quasi-compact; Schröer: Pic^τ algebraic (finite type, separated) for proper X citing SGA6 XIII 4.7. Enriques values as in F03. |
| 2.7 | SCH23 line 175–188 | Num_{X/k}(k^alg) = Num_{X/k}(k^sep) = ℤ^ρ; constant means trivial Gal(k^sep/k) → GL_ρ(ℤ), equivalently Num ≅ (ℤ^ρ)_k. |
| 2.10 | SCH23 line 191–231 (Lemma 1.1 and proof) | The equivalence with a uniform exponent (the source writes d ≥ 0: source issue below), the torsor/norm step giving n·l, the Leray/Brauer step giving n′, and the product over a generating set. |
| 3.1 | SCH23 line 260–261 | A contraction is a proper scheme Z with f : X → Z and O_Z = f_*O_X; README:594 adds properness of f, which holds for proper X and Z over k. |
| 3.3 | SCH23 line 265–273; WIT22 line 317–323 | Section ring R(X,L), P(X,L) = Proj, semiample L gives a projective contraction and every projective contraction arises so; Witaszek's relatively nef, base point free, semiample and big. |
| 4.4 | SCH23 line 343–345 | Birational onto a geometrically normal surface or fibre type onto a smooth curve; the point-target case (README:804 (a)) is the source omission recorded below. |
| 4.7 | STACKS Quot line 1177 (0D01), 969 (0CZV) | Hilb_{X/B} is an algebraic space locally of finite presentation for f of finite presentation and separated; Remark 7.10 gives lifts of quotients as a torsor under Hom(kernel, quotient) when the obstruction vanishes. |
| 4.9 | SCH23 line 349–355 (Thm 2.1(iii)) | The source proves κ(a)/k purely inseparable; README:874 strengthens to κ(a) = k by its own route (checked below). |
| 5.2 | HW23 line 1526–1529; LMFDB11 line 88–104, 164 | Surjectivity of N¹(X/S) → N¹(X) used to choose an ample A with A|_X ≡ A; conductor 11, rank 0, torsion ℤ/5, minimal equation y²+y = x³−x²−10x−20. |
| 5.7 | CT20 line 630–640; BMP23 line 1228–1230; WIT22 line 1813–1816 | Lemma 2.17 with the four hypotheses exactly as README:1003 (integral normal excellent, f_*O_X = O_S, S ℚ-factorial, f-nef, generic ℚ-triviality, prime divisors dominate or map to prime divisors); the two later applications cite it. |

Not flagged unverified by the author: none. Locators were also opened for §2.11 (SCH23 line 703–708, the sequence 0 → (ℤ/2)_R → Pic_{Y/R} → (ℤ^10)_R → 0), §1.2 (KLE05 line 2840, Remark 6.19: Pic^τ open of finite type for proper X when Pic exists) and §1.6 (AlgebraicModuliForArithmeticGeometry `bigLineBundle`, open head line 874: projective geometrically integral V, h⁰(L^m) ≥ c·m^d along sufficiently divisible m, which is what README:339 says).

### Computed adversarial table

Degrees are χ(L) − χ(O); numerical lattices are written additively; "retain" means the instance confirms the statement, not that finitely many instances prove it.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions degree sign and scalars | P¹, O(−1), O, O(1); P¹_ℂ over ℝ; double line | χ = 0, 1, 2 giving −1, 0, 1; χ_ℝ(O(1)) − χ_ℝ(O) = 4 − 2 = 2 = 2·1; double O(1): 4 − 2 = 2 | Sign, restriction of scalars and multiplicity fixed | none |
| §0.1 component law and finite pullback | V(y²) ⊂ P², O(1); degree-2 map P¹ → P¹ | 2·1 = 2; deg f*O(1) = 2·1 | Nilpotents count; field-degree factor positive | none |
| §0.2 d_C | P¹_ℂ/ℝ; P¹_{k(t^{1/p})}/k; pointless real conic | m·r = 1·2, p·1, 1·1; generator degrees 2, p, 2 | d_C is the geometric factor; conic index 2 ≠ d_C = 1 | none |
| §0.3 both directions | P¹_ℝ O(m); inseparable constants degree p | m = 0 iff geometric m = 0; p·m = 0 iff m = 0 | Inseparability does not hide a nonzero degree | none |
| §0.4 `NumericallyTrivial`/`RelNumericallyTrivial` | P¹ O(m); id_S; elliptic O(p−q); pr₁ on P¹×P¹, O(a,b) | kernel m = 0; all of Pic(S); degree 1 − 1 = 0 with class ≠ 0; relative kernel b = 0 versus absolute a = b = 0 | Relative/absolute and numerical/trivial differ as stated | none |
| §0.5 closed points suffice | P¹_R O(m); Bl_x P¹_R, x rational special | generic = special = m; O(E) generic 0, E·E = −1 | Generic-only fails, closed-fibre test works | none |
| §0.6 surjective pullback | Bl_p P² → P², O(1) | degree 0 on E, 1 on a strict line | One contracted curve is not a test | none |
| §1.1 quotient, torsion-freeness, scaling | P¹; pr₁; id; Enriques ω; D with 2D, 4D of degrees 2, 4 | ℤ; ℤ²/(ℤ×0) = ℤ; 0; ω ↦ 0 in Num although order 2 in Pic; 2/2 = 4/4 | Quotient and ℚ-class well defined | none |
| §1.2 headline `numericalClassGroup_free_finite` | ∅, point, P¹, P¹×P¹, E×E with End rank 1, 2, 4 | ranks 0, 0, 1, 2, 3, 4, 6; Kummer bound 1 ≤ dim H²(P¹, μ_ℓ) = 1, 0 ≤ 0 | No nonemptiness or positive-rank premise | none |
| §1.3 headline `relNumericalClassGroup_free_finite` and Noetherian boundary | P¹×P¹/k, /P¹, S/S; Spec ∏_ℕ k | ranks 2, 1, 0; Num(P¹_S/S) = H⁰(S, ℤ) = bounded integer sequences, not finitely generated | Noetherian hypothesis retained in Lean (`[IsNoetherian S]`) | R02 (locator only) |
| §1.3 Euler-polynomial negative control | P¹ ⊔ P¹, O(1) ⊔ O(−1) | χ(O(n+1)) + χ(O(n−1)) = 2n + 2 = 2χ(O(n)); degrees (1, −1) ≠ (0, 0) | Finite-point contract is necessary | none |
| §1.4 cones and PS12 boundary | P¹×P¹; id; pr₁; A = [[1,√2],[√2,2]] | pairing matrix [[0,1],[1,0]], det −1; N₁(S/S) = 0; ray of a fibre; det A = 0, det(A+I) = 4, det(A+I/2) = 7/4 | Closure strictly larger than NE | none |
| §1.5 nefness, repaired Check | P¹ O(m); pr₁ O(a,b); Bl_p P², p rational | m ≥ 0; b ≥ 0, a free; E² = −1 at a rational p (−[κ(p):k] in general) | Repair consistent with §4.5 | none |
| §1.6 bigness and `bigLineBundle` | P⁰, P¹, P² with O; O(1) on P²; O(1,0) | growth orders 0, 0, 0 versus dim 0, 1, 2; binom(m+2, 2); square 0, h⁰ = m + 1 | Trivial sheaf big only in dimension 0; nef nonbig boundary | none |
| §2.1 representability Checks | P¹; P¹_ℂ/ℝ; Spec k[ε]/ε²; nodal cubic | ∐_ℤ Spec k; Res_{ℂ/ℝ}ℤ with ℝ-points ℤ, ℂ-points ℤ²; Pic(T[ε]/ε²) = Pic(T) so the sheaf is 0; Pic⁰ = G_m, tangent dimension 1 | Nilpotent and singular cases retained | none |
| §2.2 constants and units | P¹ ⊔ P¹; P¹ over k[ε]/ε² | k × k, units Aˣ × Aˣ; (1+εa)(1+εb) = 1 + ε(a+b) | Reduction loses the unipotent part | none |
| §2.3 Brauer of finite algebras | ℂ/ℝ; ℝ×ℝ; ℝ[ε]/ε²; 0 | 0; (ℤ/2)²; ℤ/2; 0; Pic = 0 in all | Torsion; product and nilpotent boundaries | none |
| §2.4 obstruction target | pointless real conic; P¹_ℂ/ℝ | image 2ℤ ⊂ ℤ, cokernel ℤ/2 = Br(ℝ), n = 2; Br(ℂ) = 0, Pic = ℤ | Br(X^aff), not Br(k) | none |
| §2.5 τ-component split Checks | P¹; E; classical Enriques; ordinary char-2 Enriques | 0; E; ℤ/2 (ω); μ₂ of length 2 with one geometric point | Each bullet one object | none |
| §2.6 dictionary and Checks | P¹; P¹_ℂ/ℝ; Spec K; P¹_ℝ ⊔ Spec ℂ; conic; C₃ and S₃ | ℤ id; ℤ² swap; 0; ℤ id; ℤ with image 2ℤ; ℤ/3 trivial, S₃ excluded by (12)(23) ≠ (23)(12) | Abelian domain now stated; Galois group may be nonabelian | none |
| §2.7 `HasTrivialNumericalGaloisAction` | σ = id; conjugation on P¹_ℂ/ℝ; K/k^sep purely inseparable | g = id forced by the two projection equations; g*e₁ = e₂ ≠ e₁; Aut(K/k) → Aut(k^sep/k) bijective | Quantifies over actual semilinear maps, not a free predicate | none |
| §2.8 norm | P¹_E → P¹_k, [E:k] = n; tower 2, 3 | Nm O(d) = O(nd), Nm∘pr* = [n]; O(d) ↦ O(3d) ↦ O(6d) | Not inverse to pullback | none |
| §2.9 torsor annihilation | conic, l generator; P¹ | split by ℂ, 2l lifts (l itself lifts); τ = 0 so every class 0 | Injection H¹(k, q_*P_E) → H¹(E, P_E) is the first map of the five-term sequence | none |
| §2.10 headline, both directions | P¹; conic; P¹_ℂ/ℝ; ∅ and Spec k[ε]/ε² | d = 1; image 2ℤ, d = 2 works, d = 1 fails; (d, 0) off the diagonal for every d ≥ 1, both sides fail; lattice 0, d = 1 | d(σv − v) = 0 forces σv = v in a torsion-free lattice; converse is the product of per-basis exponents | none |
| §2.11 doubled lift | ℤ/4 → ℤ/2; ℤ/8 → ℤ/2; P = 0 | d(1) = 2, π(2) = 0 = 2·1; kernel ℤ/4 not killed by 2, 2·2 = 4 ≠ 0; d = [2] | Kernel hypothesis discriminates | none |
| §2.12 headline | y²+y = x³ over 𝔽₂; y² = x³−x over 𝔽₃; finite X | affine 2, total 3; affine 3, total 4; group 0 | Characteristics 2 and 3 included | none |
| §3.1 `IsContraction` | id; pr₁; cusp normalization; P¹_ℂ → Spec ℝ | sections maps identities; k[t²,t³] ⊊ k[t]; ℝ → ℂ not onto | Canonical map, properness part of the predicate | none |
| §3.2 rigidity | Bl_p P², g = id | g maps E onto E, a curve, so no factorization | Contracted-curve hypothesis necessary | none |
| §3.3–3.4 semiample dictionary | O(1) on P¹; O_X; nontorsion degree-0 L on E; O(1,0) | k[x₀,x₁] → P¹; B[T] → Spec B; h⁰(L^m) = 0 for m > 0; pr₁ | Numerical zero is not semiampleness | none |
| §3.6 headline `contraction_descends_purelyInseparable` | K = k; k′ = k(a^{1/p}), X = Spec k′ over k; conjugate pair over ℝ | identity squares; X_{k′} = Spec(k′⊗k′) local, f′ = affinization descends to id; collapsing one of two conjugate components does not descend (separable control) | Local verification: Γ(U′,O) = Γ(U,O) ⊗_k k′ by flat base change on the qcqs open U, and A_a → Γ(U_a,O) is an isomorphism after the faithfully flat ⊗_k k′ | none |
| §3.7 projective descent | split quadric; nonsplit quadric | (1,0) fixed, projection descends; swap sends (1,0) to (0,1), different contraction | Constant Num substantive; statement needs only projectivity of Ȳ | R01 (docstring) |
| §3.8 openness | P¹_Y with O(1), O | ample locus Y, ∅ | One nonample fibre cannot be repaired | none |
| §4.1 `componentGraph` | P¹ ⊔ P¹; irreducible; ∅; V(xy); V(x²+y²)/ℝ; normalization of two meeting lines | (2,0), (1,0), (0,0), (2,1); edge to vertex; (2,0) → (2,1) with bijective vertices | Vertex bijection alone does not reflect adjacency | none |
| §4.2 headline `constantNumericalClasses_iff_componentGraphDescent` | P¹_ℂ/ℝ; P¹_ℝ ⊔ Spec ℂ; two k-lines; ∅; P¹ ⊔ P¹ with swap; double P¹; P¹_{k(a^{1/p})} | 2 → 1 vertices, not constant; excluded by purity (3 → 2 with constant ℤ); (2,1) → (2,1), ℤ² trivial; 0 → 0, Num 0; swap fails closure(π(C₁)) = C₁; one vertex, reduced degree 1 versus full degree 2; one vertex, multiplicity p | (⇐) via effective Cartier divisors at closed points avoiding other components and associated points (prime avoidance in the 1-dimensional local ring), diagonal positive degree matrix, then §2.10; (⇒) via §2.10's descended sheaf positive exactly on one component; generic points of X_K lie over generic points of X by going-down | none |
| §4.3 intersection matrices | two lines; E; fibre; P²_κ over k with [κ:k] = 2; V(x^p−a), V(y^p−a) | [[1,1],[1,1]]; [−1]; [0]; 1 over κ, 2 over k; p² local length, pC₁·pC₂ = p² | Full divisors, not reduced supports | none |
| §4.4 trichotomy | P² → pt; Bl → P²; P¹×P¹ → P¹ | dims 0, 2, 1 | Point target included (source omits it) | none |
| §4.5 headline Checks (repaired) | rational centre; degree-d centre; x = V(u²+1,v) on P²_ℝ; A₁, A₂ | −1; 0 − d = −d; −2 and (E₁+E₂)² = −1 + 0 − 1 = −2; [−2], [[−2,1],[1,−2]] with det 3, value −2 on (1,1) | Negativity unchanged; ground field specified | none |
| §4.6 Zariski | I₂ matrix; irreducible fibre | q(a,b) = −2(a−b)², radical (a,a), singleton [−2]; [0] | Semidefinite with the fibre as radical | none |
| §4.7 negative-curve descent | E with O(−1); conjugate E₁, E₂; rulings of a real nonsplit quadric | h⁰(O(−1)) = 0, étale Hilbert point; (E₁−E₂)·E₁ = −1 so distinct classes; squares 0, hypothesis cannot be dropped | Transcendental Ω handled: a zero tangent space forces the image point of Hilb to have residue field finite separable over k | none |
| §4.8–4.10 fibre graphs, image points, labels | Bl of a k-point of a smooth fibre; real conic bundle fibre x²+y² = 0; smooth fibre over a degree-2 point | [[−1,1],[1,−1]], (2,1) → (2,1), label 1; 2 → 1 vertices with swapped classes, Num not constant; irreducible, outside the reducibility hypothesis | §4.9's κ(a) = k: the scheme-theoretic image of the descended geometrically integral D is reduced and its base change to Ω is the reduced point Spec Ω, so κ(a) ⊗_k Ω = Ω; over a smooth S the generic geometric fibre is irreducible, so reducible geometric fibres lie over closed points | none (note: §4.10's geometric-reducedness hypothesis is implied by the route) |
| §5.1 restriction | P¹_R; Spec R; x²+y² = zw over ℤ_(5) | id on ℝ; 0 → 0; rank 1 → rank 2 since −1 = 2² mod 5 | Injective, not surjective over a non-henselian DVR | none |
| §5.2 worked example | y²+y = x³−x²−10x−20 over 𝔽₇ | RHS ≡ x³−x²+4x+1; discriminants 1+4r: 5, 0, 4, 6, 2, 2, 2 against squares {0,1,2,4}; counts (0,1,2,0,2,2,2), sum 9, total 10; rational torsion ℤ/5 injects | Numerical lift of a nonlifting class with trivial numerical class; tenth power lifts | none |
| §5.3 headline `lineBundle_lifts_completeDVR_of_h2_zero` | P¹_R, O(d), d = −1, 0, 1; K3/abelian fibres | H²(O) = 0, actual lifts of degrees −1, 0, 1; h²(O) = 1, hypothesis fails | Obstruction in H²(X_s,O) ⊗ m^n/m^{n+1}, then formal existence | none |
| §5.4 cones | P^n_R, n ≥ 1; Spec R | one ray each; {0} = {0} | Rank-zero boundary | none |
| §5.5 specialization and converse | P^n_R O(1); Bl of [1:0:0],[0:1:0],[1:1:t] over k[[t]] | 1 = 1; H² = 4−3 = 1 on both fibres, special H·ℓ = 2−3 = −1, generic H base point free (Cremona) | Correct direction only | none |
| §5.6 semiample numerical descent | pr₁ with O(a,0), O(0,1); E with nontorsion degree-0 L | m = 1, M = O(a); fibre degree 1 fails; h⁰(L^m) = 0 | Semiampleness used | none |
| §5.7 vertical descent | id; projective bundle O(b); Bl_p S with L = O(−E) | M = L; b = 0; (−E)·E = 1 over κ(p), E maps to a point | Codimension-one image hypothesis essential | none |
| §5.8 normalized degree | line in P^n; P¹_ℂ over ℝ; H′ = 3H, D = −2H | 1/1; 2/2 = 1; minimum unchanged, D-values −2, −4 | Positive integers, minimum attained | none |
| §5.9 AHK rank | P², Bl_p P²; point; quadric surface cone (F₂); quadric threefold cone | 1, 2−1; 0; 2−1 = 1; P²-bundle over P¹ with ρ = 2, exceptional P¹ of codimension 2, ρ_AHK = 2 versus Cartier rank 1; cuts n−e−2 = 2 for (4,1) | Small versus divisorial resolution distinguished | none |
| Six gap contracts | blow-up pullback; three independent exceptional divisors; n = 0 integral projective V | h⁰ difference 0 ≤ C·m, top square 1 = 1; each pairs −1 with its own curve; (L⁰·V) = [κ′:k] > 0 and h⁰ = [κ′:k] ≥ c | Precise, minimal, stated in curve degrees and section dimensions only | none |

### Pinned declarations opened (Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, equal to `lake-manifest.json`)

| File and line | Checked | Consequence |
| --- | --- | --- |
| `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41`, `:82` | `IsProper` extends separated, universally closed, locally of finite type; `IsProper (pullback.snd f g)` for proper f | No flatness or nonemptiness in properness; `RelNumericallyTrivial`'s fibre instance is this one |
| `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean:42`; `Fiber.lean:37–46`; `Noetherian.lean:277` | affine-local `Flat`; `fiber`, `fiberι = pullback.fst`, `fiberToSpecResidueField = pullback.snd`; `IsNoetherian` = locally Noetherian and compact | Fibres are κ(s)-schemes; §1.3 keeps the global Noetherian binder |
| `Mathlib/RingTheory/PicardGroup.lean:545`; `Morphisms/FlatRank.lean:88` | `Subsingleton (Pic R)` for finite `MaximalSpectrum`; `Scheme.Hom.finrank` | Semilocal Pic vanishing imported (§2.3); norm rank cited with its hypotheses |
| `Mathlib/AlgebraicGeometry/Morphisms/` (directory) | no projective-morphism or ampleness class | §§3.4, 3.7, 3.8, 5.3-ampleness, 5.5 unstatable; R01 corrects the reason for §3.7 |
| `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:62–70`, `:120–126` | `eulerDegree` needs `[X.Over (Spec (.of k))]`; defined from the truncated Euler characteristic | `NumericallyTrivial` supplies the `Over` instance from `i ≫ x` |
| `TauCeti/AlgebraicGeometry/LineBundle/Pullback.lean:72`; `Class.lean:50, 58, 142` | `InvertibleSheaf.pullback f : InvertibleSheaf Y ⥤ InvertibleSheaf X`; `LineBundleClass`, `mk`, `CommGroup` | Quotients are of actual line-bundle classes |
| `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`; `LineBundle/Basic.lean:131` | `abbrev Cohomology (M : X.Modules) (i : ℕ)`; `InvertibleSheaf.trivial` | §5.3's hypothesis is `Subsingleton (H²(X_s, O))` of the actual module |
| `TauCeti/AlgebraicGeometry/Curves/StableReduction/Picard/Basic.lean:204, 294`; `NumericalType/Topology.lean:46` | `Pic`, `degree` of a combinatorial numerical type; `intersectionGraph` on `T.Component` | Combinatorial objects on numerical types, not Num(X/S) of a scheme or the component graph of a scheme; no duplication |

Searches by object (numerical triviality, numerical equivalence, contraction, component graph, intersection number, projectivity, ampleness, semiampleness) over `Mathlib/AlgebraicGeometry` and `TauCeti/AlgebraicGeometry` found none of the package's seven definitions or seven headline statements at the pins.

### Cross-roadmap citations resolved and ownership

| Supplier (where read) | Resolved | Conclusion |
| --- | --- | --- |
| SchemeAndStackFoundations, main `TauCetiRoadmap/SchemeAndStackFoundations/README.md` | §0.9 (:848), 0.11 (:938), 0.23 (:1475), 1.1–1.11 (:2071–2390), 2.1 (:3265), 2.2 (:3309), 2.6 (:3437), 2.10 (:3631), 2.11 (:3656; `finite_pushforward_exact` :3674 on small étale sites, abelian sheaves), 2.15 (:3867; `etale_galois_comparison` :3872), 2.22 (:4428), 3.4 (:4789), 3.5 (:4876; `lineBundleNorm` :4878), 4.9 (:5448; `stein_factorization` :5472), 4.10 (:5487), 4.11 (:5528), 4.12 (:5613), 5.2 (:6653), 5.3 (:6701; `proper_pushforward` :6709, `c1_degree_curve` :6711), 5.9 (:7129), 5.10 (:7175; `Num.free_finiteRank` :7206) | All present; the two gaps extend §5.9 and §5.3 |
| AlgebraicModuliForArithmeticGeometry, open head (#853) | §1.4 (:658), 1.5 (:686), 1.6 (:819; `boundedSupportParameters` :823, `bigLineBundle` :874), 2.1 (:994), Layer 3 (:1057), 7.3 (:9173; `picard_infinitesimal_lifting` :9266), 7.6.1 (:9490), 7.6.1a (:9542), 7.9 (:9621) | All present; the four gaps extend §§1.6, 7.3, 2.1 |
| ComplexComparisonPartII, open head (#848) | C3.2d.2 (:1973; `relative_picard_algebraicSpace`), C3.2d.4 (:2009; `picard_brauer_obstruction` :2011), C3.2e (:2045; `picardTorsionComponent` :2047), C3.2f.1 (:2057), C3.2f.2 (:2075) | Present; the proper-field variants here are genuine extensions |
| AbundanceStatement, open PR #545 (new roadmap, other author) | Layers 4A (:232), 4B (:256), 4C (:278), 4D (:301), 5 (:331) | Admissible supplier (new-roadmap pull request); characteristic-zero projective case only |
| ResolutionOfSingularitiesCharacteristicZero, open head (#1199) | §7.8 (:1017; `resolution_field` :1019) | Characteristic-zero projective regular resolution with smooth source |
| JacobianChallenge, main | Layers A (:111), B (:135), C (:143), D (:218) | Present |
| StableReduction, main | J-A2 (:238), Layer 1 (:321), Layer 2 (:354), Layer 4 (:468) | Present; the Layer 2 contraction descent and ampleness openness are the scheme cases cited |
| AlgebraicVectorBundles, main | L0A (:215), L0B (:228), L0C (:254), L1A (:269), L1B (:290) | Present |
| EtaleCohomologyFoundations, main | §F.3 (:676) | Present |

Ownership by object over the roadmap service's index (367 open pull requests, index of 2026-10-25T18:26:43Z) and the board's packages: the numerical quotient, torsion component, numerical local system and contraction descent of proper schemes over a field are built nowhere else. EnriquesSurfacesAndIntegralNonexistence (#1488) and WeilConjectures (#1208) use "constant numerical local system" as a consumer hypothesis; StableReduction on main owns the universal-sheaf-isomorphism contraction descent that README:13 distinguishes. No `Suggested.lean` on main, in an open pull request or on the board declares any of the fourteen names.

Merge order: this roadmap is line 47 of `merge-order/ORDER.txt`; its suppliers SchemeAndStackFoundations (2), ResolutionOfSingularitiesCharacteristicZero (6), EtaleCohomologyFoundations (20), AlgebraicModuliForArithmeticGeometry (38) and ComplexComparisonPartII (45) precede it; the rest are on main. The prescribed gate, run with `--movable`, exited 0 with the complete output

```text
depcheck: 56 roadmaps, 636 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. All 51 *Needs:* lines cite only the layer's own earlier sections, main roadmaps or the suppliers above; §0.4's definition precedes the §0.3/§0.5 characterizations it is later compared with, and §2.7 defines the predicate without §2.10.

### Declared supplier gaps

All six slugs occur in `packages/AlgebraicModuliForArithmeticGeometryPartII/design/plan.json` under `gaps` with the same supplier and section as the README's "What X must provide" sentences (README:49, 51, 57, 59, 61, 63). None has supplier `none`; each `needs` is one statement with its hypotheses; each asks for a curve-degree, section-dimension, representability or tangent-space fact that neither the pins (no intersection theory, Picard scheme, or Hilbert space), the suppliers' present sections (AlgebraicModuliForArithmeticGeometry §1.6 is projective geometrically integral; SchemeAndStackFoundations §5.9 is the surface pairing, §5.3 the first Chern class) nor this roadmap provides. Acceptance is conditional on them.

### Suggested.lean: elaboration, binders, headline coverage and padding

`lake env lean` on Suggested.lean from the content checkout (head `5fabda7`) exited 0; the only diagnostics were seven "declaration uses `sorry`" warnings at lines 83, 94, 130, 153, 175, 213, 232. Both Tau Ceti object files were present; no module build was needed.

A scratch copy with `#check @name` for all fourteen declarations elaborated (exit 0, the same seven warnings). Each printed type was compared with its README statement: `NumericallyTrivial` and `numericallyTrivialClasses` keep `(k) [Field k] (X) (x : X ⟶ Spec k) [IsProper x]`; `RelNumericallyTrivial` and `relNumericallyTrivialClasses` keep `[IsProper f]` with no Noetherian binder (README:19 wants none in the definition); `relNumericalClassGroup_free_finite` keeps `[IsNoetherian S]`; `HasTrivialNumericalGaloisAction` and the two `constantNumericalClasses_iff_*` theorems keep `[IsAlgClosure k K]` and `[IsProper x]`, the exponent order is ∃ d, 0 < d ∧ ∀ L, ∃ M; `numericallyTrivial_torsion_of_algebraic_finiteField` keeps `[Fact p.Prime]`, `[Algebra (ZMod p) k]`, `[Algebra.IsAlgebraic (ZMod p) k]`; `contraction_descends_purelyInseparable` keeps `[IsPurelyInseparable k K]`, `[IsProper x]`, `[IsProper y']` and concludes `IsProper y ∧ IsContraction f ∧ f ≫ y = x ∧ IsPullback v y' y b ∧ f' ≫ v = fst ≫ f`; `constantNumericalClasses_iff_componentGraphDescent` keeps the componentwise `topologicalKrullDim = 1` premise and the closure-of-projection marking; `lineBundle_lifts_completeDVR_of_h2_zero` keeps `[IsDomain R] [IsDiscreteValuationRing R] [IsAdicComplete (maximalIdeal R) R] [IsProper x] [Flat x]` and the `Subsingleton (H²)` hypothesis. No binder was lost and nothing in the package was changed.

Headlines (README:3, 91): §1.2, §1.3, §2.10, §2.12(b), §3.6, §4.2, §5.3 are stated; §§2.1, 2.4, 2.5, 2.12(a) (Picard scheme), 3.4, 3.7, 3.8, 4.5–4.10, the ampleness clause of 5.3, 5.4–5.7 and 5.9 are named in the docstring with a missing carrier, and each is indeed unstatable at the pins (no Picard scheme, units sheaf on the fppf site, section algebra or Proj, projectivity or ampleness predicate, algebraic spaces, surface intersection pairing, Hilbert space, cones of curves, ℚ-Cartier divisor theory or exceptional-divisor data); R01 corrects the carrier named for §3.7. No weakened substitute or stand-in is present.

Padding probe: a scratch copy replaced each `sorry` by `first | rfl | infer_instance | (simp; done) | (intros; rfl) | (intros; infer_instance) | (intros; simp; done)` and was elaborated once; it exited 1 with "simp made no progress" at the four Layer 1–2 theorems and "unsolved goals" at the three Layer 3–5 theorems, and no `sorry` warning, so no theorem closes by one tactic. None restates a definition, mirrors a Check, computes a value or treats a boundary case; the seven definitions have real bodies and each is used by a headline. No deletion is requested. All Lean processes finished; none is left running.

## Not verifiable

- Ownership against the open pull requests was checked through the roadmap service's index and `roadmaps grep`/`roadmaps show` at the heads it carries, not through sibling checkouts (the brief names the sibling roadmaps without paths). Exact-head reads succeeded for every supplier cited.
- The mathematical content of the seven sorried headlines and of the six gap contracts is prospective: the elaboration certifies well-formed signatures, and the adversarial rows above are instance checks, not proofs.
- Published page numbers of SCH23 (Annals 197) and HW23 (Forum Math. Pi 11) were not compared with the arXiv versions read; the manifest's `version_note` entries record which numbering is used.

## Source issues

- **Misprint** in SCH23 at Lemma 1.1, p. 5 (line 191–192): the source says the exponent may be any nonnegative integer; it should be a positive integer, since exponent zero makes every class trivially descend; affects a stated result.
- **Error** in SCH23 at §2, paragraph before Theorem 2.1, p. 8 (line 343–345): the source says a contraction of a smooth proper surface is birational onto a surface or of fibre type onto a curve; it should also allow the structure map to Spec k; affects nothing.
- **Gap** in SCH23 at Theorem 2.1(ii), p. 8 (line 356): the source says label preservation is immediate from (i) and left to the reader; it should be justified by descending each geometric component to a geometrically integral divisor and using intersection base change; affects the proof.
- **Misprint** in CT20 at Lemma 2.17, p. 17 (line 640): the source says the descended divisor lives on an undefined scheme Y; it should be the target S; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a7c1e22", "job": "REV-PKG-AlgebraicModuliForArithmeticGeometryPartII~4", "model": "fable", "worker": "fable-rev121"} -->
