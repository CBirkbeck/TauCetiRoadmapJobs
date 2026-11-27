# Review of CantorSetAndCompactMetricSpaces (pull request #3208 at c36d391)

**Verdict:** accepted

**Summary.** Accepted: no finding. The nine theorems were each tested on degenerate and separating instances and none failed; every source locator agrees with the text it cites; every cited library declaration exists at the pins with the hypotheses the README gives; nothing in the pinned libraries or in another roadmap already states these results. There are no small corrections and three format notes, none blocking. One question of scope is left for the human reviewers: both cited sources are unrefereed expositions.

## N01 — The scope section names an instance "for compact T2 totally disconnected spaces" that is not public at the pin

In "Scope and ownership" (line 432) the zero-dimensional instance is described for compact spaces. At the pinned Mathlib that instance is `private local` (`Mathlib/Topology/Separation/Regular.lean`, line 887); the public one is for weakly locally compact spaces (line 906), which is what 1.1, 2.1 and the supplier contracts correctly cite. Writing "weakly locally compact" here too would make the three places agree.

## N02 — The Check of 3.1 on `ℚ` re-derives a pinned lemma

The parenthesis showing that a compact subset of `ℚ` has empty interior (line 288) is `Rat.interior_compact_eq_empty` (`Mathlib/Topology/Instances/RatLemmas.lean`, line 47). Naming it would shorten the Check.

## N03 — The title promises compact metric spaces; only Layer 2 is about them

Of the nine theorems, 2.1 and 2.2 concern compact metrizable spaces; the others concern zero-dimensional Polish spaces, Baire space and `ℚ`, and the general statement about compact metric spaces (Hausdorff–Alexandroff) is left to Mathlib. A subtitle such as "topological characterisations of Cantor space, Baire space and the rationals" would describe the content; this is offered, not required.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 embedding in `ℕ → Bool` ⇔ T0, second countable, zero-dimensional | empty; two-point indiscrete; `ℝ`; `Bool^ℝ`; `ℚ` | empty: both true. Indiscrete: clopen basis `{∅, X}`, not T0, inducing maps not injective: both false. `ℝ`: clopens `∅, ℝ`: both false. `Bool^ℝ`: not first countable: both false. `ℚ`: both true | holds | none |
| 1.2 closed embedding in `ℕ → ℕ` ⇔ Polish and zero-dimensional | empty; `ℚ`; `ℝ`; `ℕ`; Cantor space | empty: range `∅` closed, both true. `ℚ`: meagre in itself, not Polish; closed subspace of Polish is Polish: both false. `ℝ`: both false. `ℕ`, Cantor: both true | holds | none |
| 1.3 Polish ⇒ continuous bijection from a closed `C ⊆ ℕ → ℕ` | empty; `ℝ`; non-Polish `ℚ`; `Bool^ℝ` | empty: `C = ∅`. Splitting pieces `Pₘ ∩ Kₖ \ Kₖ₋₁`: disjoint, diameter ≤ 2ε/3, closure in `Kₖ`. `ℚ`: conclusion holds (discrete closed copy of `ℕ`). `Bool^ℝ`: cardinality `2^𝔠 > 𝔠` | holds; not an iff, as stated | none |
| 2.1 Brouwer | empty; point; `Bool`; `ℚ`; `[0,1]`; `Bool^ℝ`; `ℕ ∪ {∞}` | each fails exactly one right-hand property (nonempty; perfect; perfect; compact; totally disconnected; metrizable; perfect) and is not homeomorphic to Cantor space | holds | none |
| 2.1 binary coding Check | m = 1, 2, 3, 8 | m = 1: `{ε}`. m = 3: `{1, 01, 00}`, Kraft sum 1/2 + 1/4 + 1/4 = 1. General: a word of length m − 1 is `0ᵐ⁻¹` or has first `1` at i < m − 1 | true | none |
| 2.2 Cantor sets in `ℝ` | `∅`; `{0}`; `[0,1]`; `⋃ₙ (n + C)`; middle-thirds `C` | `∅`: `Perfect ∅` holds at the pin, excluded by nonempty. `{0}`: not perfect. `[0,1]`: interior `(0,1)`. Union: closed, perfect, not compact. `C`: both true | holds | none |
| 3.1 Alexandrov–Urysohn | empty; `ℕ`; `ℚ`; `ℕ → ℝ`; `ℕ → Bool`; `ℕ → ℕ` | `ℕ`: compact `{0}` has interior `{0}`: false both sides. `ℚ`: not Polish. `ℕ → ℝ`: connected. Cantor: compact with interior. Baire: cylinder `[s]` projects onto `ℕ`, not compact | holds | none |
| 3.2 irrationals | hypotheses of 3.1 | Gδ in `ℝ` so Polish (elaborated at the pin); basis of sets `(a,b) \ ℚ`, rational `a < b`, clopen; compact `K ⊇ (a,b) \ ℚ` gives `K ⊇ [a,b] ∋` a rational | holds | none |
| 3.3 infinitely many `true` | `m = (0,0,…)`, `(1,0,2,…)`; eventually-`true` variant | `(0,0,…) ↦ 111…`; `(1,0,2) ↦ 0 1 1 0 0 1`; k-th `true` at position `m₀+…+mₖ₋₁+k−1 ≥ k−1`; tuples of length ≤ 3, entries ≤ 3: 1+4+16+64 = 85. Variant set countable | holds | none |
| 4.1 Sierpiński | empty; `ℕ`; Cantor space; cofinite `ℕ`; finite spaces; `ℚ[x]` pointwise | finite nonempty T1: every point isolated, so `Countable` = countably infinite here. Cofinite: perfect, not T2. `ℚ[x]`: basic neighbourhood on finitely many points never inside `{p : abs(p(y)) < 1}`, `y` a new point: not first countable | holds | none |
| 4.1 route, steps 3–5 | `1/2`, `1/3`; words of length n ≤ 6 | bad translates `{g x xor e}` countable; `1/2 = 1000… = 0111…`; `1/3 = 0101…` unique; word values `j/2ⁿ`; `Y ⊆ (0,1)` dense, so no endpoints and densely ordered; `induced_orderTopology` hypothesis met in `(0,1)` | holds | none |
| Conventions: `ZeroDimensionalSpace`, `PerfectSpace`, `Perfect` | empty space; indiscrete | pin: `HasSmallInductiveDimensionLT X 1` ⇔ clopen basis (`zeroDimensionalSpace_iff_isTopologicalBasis_isClopen`); empty space perfect (elaborated); no T0 included | as README says | none |
| Layer 4 examples | `ℚ ∩ [0,1]`; Cantor endpoints; `Z × ℚ` | `ℚ ∩ [0,1]` has a least element; endpoints have adjacent pairs (not densely ordered); `Z × ℚ` countable, metrizable, perfect, nonempty | true | none |

- Source locators checked against the text: 15 of 15 (Tserunyan: Proposition 1.12 p. 7, Theorem 5.3 p. 18, Theorems 5.4, 5.6, 5.7 and Corollary 5.5 p. 19; Francis: Theorems 1, 2 and Example 1(b) p. 2, Theorem 5 p. 6, Proposition 3 p. 8, §4 p. 9, Example 4 p. 10, "countable" p. 2).
- Library declarations opened at the pin: 38 in Mathlib, 2 in Tau Ceti (`TauCeti/Topology/Perfect.lean`, lines 57 and 67), all present with the stated hypotheses; `ZeroDimensionalSpace (ℕ → ℕ)` is not an instance at the pin, as the route of 1.2 assumes.
- Cross-roadmap citations resolved: 1 (BorelEquivalenceRelations on main, named as a neighbour, not a supplier); no supplier roadmap.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates, `sorry` the only warning (9). `#check`-level comparison of the 9 elaborated types with the README: equal generality, no section variables in the file.
- One-tactic probe (`rfl`, `simp`, `exact?`, `infer_instance`, `aesop`) on all 9 theorems: none closes.
- Headline theorems (Brouwer 2.1, 2.2; Alexandrov–Urysohn 3.1–3.3; Sierpiński 4.1; universality 1.1–1.3): all stated; none needs a definition.
- Automatic checks: all passed.

Overlap check: read BorelEquivalenceRelations, CountableStructureSpaces, FractalGeometry (main), InfiniteGamesAndDeterminacy, RealFunctionsDerivativesAndVariation, SorgenfreyLineAndClassicalCounterexamples (open); nothing shared. PlanarTopology (open) names Brouwer's characterisation only as material for a future roadmap outside its scope.

Source independence: 12 passages compared with 2 sources, none shared beyond statements of about ten words that the mathematics forces; largest share Francis (arXiv:1210.1008), 8 of 15 locators; contents compared with Francis (§§1–5) and with Tserunyan §5.A–5.D: independent (the roadmap puts Tserunyan's 5.C–5.D before 5.B because 4.1 needs 1.1, and 3.1–3.3 and the route of 4.1 are its own).

Research link: 1.2 and 1.3 are the representations of Polish spaces by closed subsets of Baire space that Tserunyan's notes use for analytic sets (text lines 1935, 2679, 2755, 2801); the characterisations are due to Brouwer 1910, Sierpiński 1920, Alexandroff–Urysohn 1928 (Francis, references). Rests on the sources read.

## Not verifiable

- none

## Source issues

- **Misprint** in Francis, arXiv:1210.1008v1, at §4, proof of Sierpiński's theorem, p. 9: the source says the image of the embedding is homeomorphic to the Cantor set; it should be the closure of the image, as in the preceding sentence; affects nothing.
- **Misprint** in Francis, arXiv:1210.1008v1, at §4, proof of Sierpiński's theorem, p. 9: the source says the first embedding's image is translated off the endpoints and the dense embedding misses them; it should be the dense embedding translated and the final embedding dense and missing them; affects nothing.
- **Misprint** in Francis, arXiv:1210.1008v1, at Theorem 4, proof, p. 5: the source says Theorem 1 gives the agreement of order and subspace topologies; it should be Proposition 1; affects nothing.
- **Misprint** in Tserunyan, *Introduction to descriptive set theory* (PDF of 25 October 2026), at Theorem 5.7, proof, p. 20: the source says to intersect with differences of closed sets indexed i+i and i; it should be i+1 and i; affects nothing.

## For the human reviewers

- **Scope.** Both cited sources are unrefereed: lecture notes on the author's page (Tserunyan) and an expository arXiv preprint (Francis). The theorems are classical (Brouwer 1910, Sierpiński 1920, Alexandroff–Urysohn 1928, per Francis's references); the primary papers were not read.
- **Reuse.** `Suggested.lean` was compared with the pinned Mathlib and Tau Ceti only (no match); no other public formalisation was searched.
