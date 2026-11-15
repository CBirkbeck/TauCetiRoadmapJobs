# FIX-PKG-RealSurfacePeriodIndex~9: repair report

One review: `REV-PKG-RealSurfacePeriodIndex~8`, three findings, all P3. I checked each against the sources and applied all three. Two of the repairs are wider than the passage the review names: F02 also fixes eleven more author-name citations of the same kind, and F01's new Check uses an automorphism argument that the review's text left implicit. `Suggested.lean` is unchanged.

## F01 (P3) — applied

Verified. In §9.12 the statement says the four components of S(K) are distinguished by the signs of u/w and v/w. The Check said that no rational function separates them. These contradict each other: u/w is positive on two components and negative on the other two. B19 lines 1802–1804 claim only the weaker fact, one component against the other three.

Old → new (§9.12, Checks): "not separated by the sign of any rational function on S … unlike real loci of surfaces over ℝ" → no f ∈ K(S)ˣ is, outside its zeros and poles, positive on exactly one component and negative on the other three (BCR, Example 15.2.2). For Ξ this is the case f = g of the sign argument of §9.14. The sign changes of u and v permute the components. The new Check lists the sign vectors of u/w, v/w and uv/w², and states the contrast over ℝ (§6.6 (a)).

How this differs from the review's text: the review cites §9.14 only for Ξ. I added that (u:v:w:z) ↦ (−u:v:w:z) and (u:−v:w:z) are automorphisms of 𝒳_K (the equation involves only u² and v²). They lift to the unique minimal resolution S and act simply transitively on the four components, so §9.14 covers every component, not only Ξ.

Pattern search: "separated", "sign of any", "negative on the other" and every citation of BCR Example 15.2.2 (§§9.11, 9.12 statement and step 2). No other occurrence makes the false claim.

## F02 (P3) — applied

Verified against B19's own citations, with its bibliography numbers checked: [14] Bredon, Chapter II, Theorem 7.1 (c) at line 1009; [30] Golubitsky–Guillemin, Chapter III, Theorem 3.11 at line 1128; [28] Dimca, Lemma 4 at line 1258; [26] Degtyarev–Itenberg–Kharlamov, Appendix C at lines 81–82 (bibliography lines 1863, 1889, 1887, 1884).

Old → new:
- §4.6 step 4: "(connecting maps commute with cup products)" → "…: BRE97, Chapter II, Theorem 7.1 (c))".
- §6.3 step 2: "(Golubitsky–Guillemin III.3.11)" → "(GG73, Chapter III, Theorem 3.11)".
- §6.12: "citing Dimca 1985, Lemma 4" → "citing DIM85, Lemma 4".
- §9.7 Check and §9.10 Check: "(Degtyarev–Itenberg–Kharlamov …)" → "(DIK00, Appendix C …)".

The same pattern elsewhere: a work cited by author name where the manifest has a key. Repaired at each occurrence, with each locator re-read:
- §0.5: "citing Arason 1975, Hilfssatz 2; ARA75, Hilfssatz 2" → "citing ARA75, Hilfssatz 2".
- §2.7: "citing Voisin 2006" → "citing VOI06, Propositions 8 and 9" (B19 lines 300–308).
- §4.7 step 1: "Sernesi Proposition 3.2.9 (i)" → "SER06, Proposition 3.2.9 (i)".
- §5.6 step 4: "Benoist–Wittenberg Proposition 2.9" → "BW20, Proposition 2.9" (BW20 line 1361).
- §6.5 step 1: "Bochnak–Coste–Roy" → "BCR".
- §6.6 step 1: "Bröcker 1980" → "BRO80".
- §7.13 Check: "Benoist–Wittenberg II, Proposition 8.3" → "BW20II, Proposition 8.3" (BW20II lines 1018–1024).
- E11: "Benoist–Wittenberg (1.22)" → "BW20, (1.22)" (BW20 line 505; there M(−k) with k = dim X − dim Y, which is the correction's M(d′ − d)).
- E12: "Benoist 2018, Proposition 2.1" → "BEN18, Proposition 2.1" (BEN18 line 245).
- §9.4 Check: "Classes of period 4 exist on some real Enriques surfaces (Mangolte–van Hamel)" had no locator. It now reads: period-4 classes exist exactly when S(ℝ) is nonempty, orientable and both halves are nonempty, where Br(S) ≅ `(ℤ/2)^(2s−2) ⊕ ℤ/4`, and Br(S) is killed by 2 otherwise (MVH98, Theorem 1.3, p. 3 (arXiv v1); MVH98 lines 135–144).

Manifest (`sources.toml`): the MVH98 locator gains "Theorem 1.3" and the BW20 locator gains "display (1.22)"; nothing else changes. Every one of the 23 keys now occurs in the body. The cited_for of BRE97 (Layer 4), GG73 and DIM85 (Layer 6) and DIK00 (Layer 9) is now true.

Left unchanged as prose, not citations: "Voisin's Proposition 9" (§2.5, E17; VOI06 is cited at §2.5's statement), "Becher's argument" (§0.14; BEC05 §3 is cited at the statement), and "Kahn's"/"Mangolte–van Hamel's" in the reason of E25 (§9.8 cites MVH98, Theorem 4.4).

## F03 (P3) — applied

Verified. §6.13 step 5 named the lattice H²(T(ℂ), ℤ(1))^G "Λ". Step 6 then used "x ∈ Λ(ℝ)", meaning the real parameter neighbourhood of §§6.9 and 6.12, which the proof never introduced.

Old → new (§6.13 step 5): "in Λ = H²(T(ℂ), ℤ(1))^G … for y ∈ Λ" → "in Γ_T = H²(T(ℂ), ℤ(1))^G … for y ∈ Γ_T". "Apply §6.9 to H = H²_van with the class" → "Apply §6.9 to H = H²_van, on a G-stable neighbourhood Λ of s as in §§6.9 and 6.12, with the class". Step 6 is unchanged.

Pattern search: every other Λ in the README (§§2.5, 2.7, 6.9, 6.11, 6.12) is a parameter neighbourhood. Γ elsewhere is the subgroup of §2.6 and the generic points `O_{X,Γ}` of §1.1; the subscript avoids any clash. No statement changed.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §9.12 Check: sign vectors | u/w, v/w, uv/w² on the components (+,+), (+,−), (−,+), (−,−) | (+,+,−,−); (+,−,+,−); (+,−,−,+): each two against two, none one against three | agrees with the §9.12 statement | new Check |
| §9.12 Check: one against three is impossible | f = g in §9.14; σ_u : u ↦ −u, σ_v : v ↦ −v | (f, f) = (f, −1) vanishes at x iff f(x) > 0, so §9.14 steps 2–4 rule out "x ∈ Ξ iff f(x) > 0". σ_u swaps (+,±) ↔ (−,±) and σ_v swaps (±,+) ↔ (±,−); both preserve z² = (w² − u² − v²)u²v² − tw⁶ and lift to the unique minimal resolution, so ⟨σ_u, σ_v⟩ ≅ (ℤ/2)² is transitive on the components | holds for every component | the automorphism clause |
| §9.12 Check: contrast over ℝ | §6.6 (a) | any locally constant sign function on a union of components of S(ℝ) is realised by h invertible along S(ℝ), in particular one against the rest | agrees with §6.6 | none |
| §9.12 Check: candidate f = u/w + v/w | sign on each component | (+,+) +; (−,−) −; on (+,−) and (−,+) both signs occur | not a counterexample | none |
| §9.4 Check (MVH98 Theorem 1.3) | S(ℝ) = ∅; nonorientable, s components; orientable with one half empty; orientable with both halves nonempty | ℤ/2; `(ℤ/2)^(2s−1)`; `(ℤ/2)^(2s)`; `(ℤ/2)^(2s−2) ⊕ ℤ/4` | period 4 only in the last case. Consistent with §9.3 (killed by 4), §9.4 (ind = 4 = per there), §9.6 (orientable gives ind = per) and §9.10 (ind ≠ per only for period 2, nonorientable, both halves nonempty) | new Check text |
| §9.7, §9.10 Checks (DIK00) | B19 lines 81–82 | the classification has many real loci satisfying B19's condition (ii) and many failing it; by §9.8, (ii) is "nonorientable, both halves nonempty" | supports both Checks | locator only |
| §4.6 step 4 (BRE97) | B19 line 1009 | the composite (5.6) is the cup product with ∂(rg) = r ∪ ∂g, which is the README's step | supported | locator only |
| §6.3 step 2 (GG73) | B19 line 1128 | stability of normal-crossings immersions; B19 also cites Definition 1.1 | supported | locator only |
| §6.12 (DIM85) | B19 line 1258 | equivariant Ehresmann, shrinking Λ(ℝ) | supported | locator only |
| E11 (BW20 (1.22)) | dim Y = d′, dim X = d | k = d − d′, coefficient M(−k) = M(d′ − d) | the correction agrees | locator only |
| §6.13 step 5 renaming | ℙ¹ × ℙ¹ → ℙ² branched along a conic (the instance of §6.10) | Γ_T = ℤ², vanishing lattice ℤ(1, −1); m·Γ_T ∩ ker p_* is a full lattice of the line ker p_* ⊗ ℝ; Λ is a neighbourhood of s in B(ℂ) and x ∈ Λ(ℝ) ⊂ B(ℝ) | no symbol collision; the hypotheses of §6.9 (G-stable, Λ(ℝ) connected and contractible, H²_van trivialised) and of §6.12 (transport over Λ(ℝ)) are both named | none beyond the notation |

## Checks run

- **Elaboration.** `lake env lean packages/RealSurfacePeriodIndex/Suggested.lean`, run from the content checkout: exit 0. The output is eight `declaration uses sorry` warnings (lines 80, 89, 101, 112, 123, 133, 141, 154) and nothing else. The three Tau Ceti object files the imports need were already built.
- **Signatures.** I put `#check @name` for all nine declarations into one scratch file and elaborated it once: exit 0. The elaborated types match the worker's list of elaborated signatures and the README statements binder for binder (for example `[Algebra.EssFiniteType ℝ K]` and `Algebra.trdeg ℝ K = 2` are present where the README states them). No binder was lost. The Lean file was not edited this round, so nothing changed.
- **Dependency check.** Whole output:

      depcheck: 239 roadmaps, 2264 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line.
- **`roadmaps resolve`** on the README: no cross-roadmap citation or Lean name found nowhere.
- **Gate failures.** One was listed: `tex=1`, the §9.4 Check (MVH98 Theorem 1.3), where the exponent of `(ℤ/2)^(2s−2)` was written with TeX braces outside a code span. It now reads "Br(S) is then `(ℤ/2)^(2s−2) ⊕ ℤ/4`", a code span with no braces, as the house style asks. The mathematics, the locator and every other line are unchanged. The same notation in this report (F02 and the adversarial-pass table) is now in code spans too.

## Ownership and suppliers

No new object, target, supplier edge or gap was added. `design/plan.json` is unchanged. All repairs are citations, notation, or Checks inside this package's own sections.

## For the maintainer

- No name that other roadmaps cite changed. No section was renumbered and no Lean declaration was added, renamed or removed.
- Two manifest locators gained items: MVH98 "Theorem 1.3" and BW20 "display (1.22)". Both papers were read from their arXiv copies (MVH98 arXiv v1, page 3; BW20 arXiv v3, line 505).
- Nothing suspicious was found in the review text.
