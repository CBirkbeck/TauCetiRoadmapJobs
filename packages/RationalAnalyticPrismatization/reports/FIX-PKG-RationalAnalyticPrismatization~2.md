# FIX-PKG-RationalAnalyticPrismatization~2

Repair of the two findings of `REV-PKG-RationalAnalyticPrismatization` (round 2 of the package). Only `packages/RationalAnalyticPrismatization/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied differently

**What changed.** 9.4 relative statement written out at the source's generality (†-cohesive; formally smooth for the torsor), no Berkovich hypothesis on X; route checks 5.2's hypotheses; *Needs:* adds §§4.4, 4.6, 4.7, 4.8, 5.2, 7.1, 8.1; Check X = D × BG_m added. New claims: †-cohesive ⇒ infinitesimally cohesive (4.6); ALRS Examples A.2.12–A.2.13 (4.7). Same route repair in 9.2.

**Agreed part.** The `*Needs:*` line of 9.4 left out §5.2 and §4.6, although the route uses them. It also left out §4.4 (†-cohesive), §4.7, §4.8 (`T_{X/D}` and its de Rham stack), §7.1 and §8.1. The route named 5.2 without showing that 5.2's hypotheses hold.

**Disputed part (the missing Berkovich hypothesis on X), with evidence.**

1. *The source's proof assumes that the curve 𝒳 is Berkovich, not the stack X.* At ALRS line 3645 (proof of Proposition 4.5.3(2), p. 70) the sentence reads "since 𝒳 is a Berkovich space, both D and 𝒳 admit a cotangent complex over ℚ_p". The text extraction drops the difference between calligraphic and italic letters, so I read the font names in the cached PDF (p. 70). Both occurrences of the letter in that clause are set in CMSY10, the calligraphic 𝒳 of the prism (S, 𝒳, D). The X of "the map X → D admits a cotangent complex, then X also admits a cotangent complex over ℚ_p" (ALRS lines 3646–3647) is set in CMMI10, the italic Gelfand stack. Only this reading makes the sentence coherent: it deduces X's cotangent complex over ℚ_p from those of D, 𝒳 and X → D. Read as "X is Berkovich", its last clause would repeat its first. The curve 𝒳 is a Berkovich space by the definition of a δ-space (ALRS Definition 3.3.1(1), line 2398; README 7.1).
2. *ALRS Proposition 2.8.15(2)–(3) applies at the stated generality.* It needs Y → D → W → S infinitesimally cohesive, each with a cotangent complex (ALRS line 1810). Here Y = X, W = 𝒳/φ^ℤ and S = GSpec(ℚ_p).
   - **X → D has a cotangent complex.** Formal smoothness includes it (ALRS Definition A.2.2(4), line 9586).
   - **X → D is infinitesimally cohesive because it is †-cohesive.** Take a square-zero extension Ã_d = A ×_{A⊕M[1]} A with M connective. The zero section and the section (id, d) of A ⊕ M[1] → A are isomorphisms on π_0, because M[1] is 1-connective, so both are surjective. The projection is a common retraction of both, and the †-reduction is a static quotient of π_0 (ABLB line 977), so both sections induce isomorphisms on †-reductions. Hence both are †-thickenings in the sense of ALRS Definition 2.7.7 (line 1538). With A ⊕ M[1] as the common target, the cartesian square of that definition is exactly the square of ALRS Definition A.2.2(2) (line 9560).
   - **D → 𝒳/φ^ℤ → GSpec(ℚ_p).** These are maps of Berkovich spaces: D by ALRS Remark 4.1.2(2), line 2983, and 𝒳/φ^ℤ because Frobenius acts totally discontinuously. Maps of Berkovich spaces are infinitesimally cohesive with cotangent complexes (ALRS Example A.2.12, p. 181, line 9767).
   - **ALRS Remark 4.4.5** (line 3552) applies Proposition 2.8.15 under exactly these hypotheses (†-cohesive, with a cotangent complex).
3. *The suggested repair would narrow the statement below what the source supports.* Take X = D × BG_m (new Check in 9.4). It is †-cohesive over D (base change of the Tannakian BG_m, ALRS Example 2.7.8(3)) and formally smooth (`L_{X/D}` = O[−1]), and it is not a Berkovich space. I computed the input from 5.2 for it:
   - cones commute with limits, and BG_m(R ⊕ I[1]) = BG_m(R) × B²I;
   - so the special fibre of the relative cone is X × B²G_a{1}, split by D(1) × BG_m;
   - `T_{X/D}{1}^dR` = BG_a^dR{1} is the loop group of B²G_a^dR{1}.
4. *The 10.11 comparison does not carry over.* In the proof of ALRS Proposition 5.8.9 (line 7618), "Z is a Berkovich space" is set in CMMI10, so it is the stack Z itself. The Berkovich restriction in 10.11 is genuine and stays.

**Pattern.** 9.2 applies 5.2 to the same chain X → D → 𝒳/φ^ℤ → GSpec(ℚ_p) (ALRS Proposition 4.4.4 and Remark 4.4.5). Its route now gives the same justification, and its *Needs:* gains §4.4, §4.6 and §4.7. No other section applies 5.2 to a relative cone. 9.5's relative case concerns smoothoid X, which are Berkovich spaces. 9.1 and 12.6 use only ALRS Lemma 2.8.6, which needs a cotangent complex and nothing else.

## F02 (P3) — applied

**What changed.** 2.3 third Check: "the three sheaves of categories are distinct" → "Perf differs from both D^+ and Nuc". New fourth Check: (∏_ℕ ℤ_p)[1/p] ≅ `ℚ_{p,■}[ℕ ∪ {∞}]` is static and compact but not dualizable, hence not nuclear; `⊕_{n≥0}` ℚ_p[−n] is nuclear and in no `D_{≥−n}`.

**Verification.** ALRS's D^+ is "eventually connective", meaning in `D_{≥−n}(B)` for some n, in homological indexing (ALRS line 817).
- ∏_ℕ ℤ_p ≅ ℤ_{p,■}[ℕ ∪ {∞}]: use the basis [k] − [∞] together with [∞] of lim_n ℤ_p[{0,…,n−1,∞}]. So its rationalisation is a compact generator of `D(ℚ_{p,■})`.
- A compact P that is nuclear has trace-class identity, because Hom(P, P) = (P^∨ ⊗ P)(*). So P is dualizable.
- Over ℚ_p the dualizable objects are the perfect complexes (1.7), so the infinite-dimensional (∏_ℕ ℤ_p)[1/p] is neither dualizable nor nuclear.
- Nuclear objects are closed under colimits, and π_{−n}(`⊕_{n≥0}` ℚ_p[−n]) = ℚ_p ≠ 0 for every n.

**Pattern search.** No other Check in the README draws a distinctness conclusion wider than its example. I searched for "are distinct", "pairwise", "the three", "all three" and "differ".

## Checks run

- **Elaboration.** `lake env lean packages/RationalAnalyticPrismatization/Suggested.lean`, run from the content checkout: exit 0, no output. The file is unchanged and declares nothing, because no headline theorem is statable at the pins, so it has no `TauCeti.*` import to build.
- **`#check @name` comparison.** Not applicable: `Suggested.lean` has 0 declarations, and no README target that names a Lean declaration changed.
- **Dependency direction.** Output of the gate's `--depcheck`:

      depcheck: 250 roadmaps, 2386 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver** (`roadmaps resolve` on the edited README). One lead, "MotivesAndAlgebraicCyclesPartII Layer 0", which was there before. That roadmap is a package on the board, earlier in the merge order, and its Layer 0 is the Banach arc-site, as the review confirmed. No Lean name is unresolved.
- **House style on the added lines.** No LaTeX delimiters, no process words, no machine paths. Each new claim carries its locator, its hypotheses and three Checks, and every changed section keeps its `*Needs:*` line.
- **Gate failure `tex=2`.** Two TeX fragments sat outside code spans in lines this round added. In the 2.3 Check (D^+ versus Nuc), "π_{−n} = ℚ_p" became the code span `π_{−n} = ℚ_p`. In the 4.7 Check (the analytic P¹), "d(1/T) = −T^{−2}dT" became the code span `d(1/T) = −T^{−2} dT`. The mathematics and the wording are otherwise unchanged. I reran the gate's own scanners (`tex`, `latex`, `prnum`, `residue`, `private-paths`) on the edited README, and each returns no hit. Nothing else changed.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 4.6: †-cohesive ⇒ infinitesimally cohesive | A = M = ℚ_p; M = 0; d = 0; M = ℚ_p[−1]; A = 0 | ℚ_p ×_{ℚ_p⊕ℚ_p[1]} ℚ_p: exact sequence 0 → ℚ_p → π_0 → ℚ_p² → ℚ_p (difference map, surjective), so π_0 is 2-dimensional = ℚ_p[ε]/ε² and π_{≠0} = 0. M = 0: both sections are the identity. d = 0: fibres τ≥0Hom(η*L, M) and Ω τ≥0Hom(η*L, M[1]) agree. M = ℚ_p[−1]: A ⊕ M[1] = ℚ_p[ε]/ε² with ε in degree 0, the section is not surjective, no conclusion (consistent with A.2.2 testing only connective M). A = 0: everything is 0 | holds; the hypothesis "M connective" is used | stated, with route and three Checks |
| 4.7: maps of Berkovich spaces are infinitesimally cohesive with cotangent complex | P¹; 0 ↪ closed disc; disc of radius 1/p ↪ unit disc; identity | P¹: d(1/T) = −T^{−2}dT, so L = Ω¹ of degree −2. Point: L = (T)/(T²)[1] = ℚ_p[1], not formally smooth, as in 4.6 for 0 → A¹. †-rational: L = 0. Identity: L = 0 | consistent with 4.5 and 4.6 | stated, with route and three Checks |
| 9.4 relative squares and torsor | X = D; X = ∅; X = D × BG_m | X = D: `T_{D/D}` = 0, trivial torsor, `D^{†-HT/D^†}` = D^†. ∅: empty. D × BG_m: `T_{X/D}` = BG_a, special fibre X × B²G_a{1}, `T_{X/D}{1}^dR` = BG_a^dR{1} = Ω(B²G_a^dR{1}) | holds at the source's generality; a Berkovich hypothesis would exclude the third | statement made explicit; Check added |
| 9.4 / 9.2 route: hypotheses of 5.2 | X → D †-cohesive and formally smooth; D, 𝒳, 𝒳/φ^ℤ | inf. cohesive (4.6, new); L_{X/D} from formal smoothness; Berkovich maps (4.7, new); transitivity gives L_{X/ℚ_p} (4.6) | every input is a target here | route and *Needs:* repaired |
| 2.3 Checks 3–4 | ℚ_p⟨T⟩; (∏ℤ_p)[1/p]; ⊕ℚ_p[−n]; ℚ_p | ℚ_p⟨T⟩ ∈ D^+ ∩ Nuc ∖ Perf. (∏ℤ_p)[1/p] ∈ D^+ ∖ Nuc (compact, non-dualizable). ⊕ℚ_p[−n] ∈ Nuc ∖ D^+ (π_{−n} ≠ 0 for all n). ℚ_p ∈ Perf ⊆ D^+ ∩ Nuc | the three subcategories are now separated pairwise, both directions for D^+ / Nuc | Check narrowed, Check added |

## Ownership

The two notions added in Layer 4 belong to this roadmap: infinitesimal cohesiveness of †-cohesive maps, and the deformation theory of maps of Berkovich spaces in the Gelfand sense. AnalyticStacks hands Gelfand rings and Gelfand stacks to this roadmap. `roadmaps grep -i 'infinitesimally cohesive|†-cohesive'` finds nothing on main or at any open head. Ownership against open pull requests was checked through that tool, at the heads it indexes.

## Sources

No source was fetched and none is missing. All new locators are in ALRS, which the manifest already records with Appendix A in scope and 2.3, 4.6, 4.7, 9.2 and 9.4 in `cited_for`, and in ABLB (line 977, the static †-reduction, already cited for 1.2). `needs-references.toml` was not created.

## For the maintainer

- **Source issues.** The review lists "Gap in ALRS at Proposition 4.5.3(2): the proof assumes X is a Berkovich space". This comes from the misreading in F01/1: the hypothesis is on 𝒳, which is Berkovich by definition. It should not go into the errata register. If anything, the source leaves implicit that †-cohesive implies infinitesimally cohesive, which its Remark 4.4.5 and Proposition 4.5.3 use. The 5.8.9 gap entry is correct.
- **Names.** No Lean name changed and no section or target id moved, so roadmaps that cite this one are unaffected.
- **No suspicious instruction** was found in the review text.
