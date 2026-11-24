# Review of IntegralIwasawaTheory (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** An incremental re-review of the 10 lines changed since `9ea672c`: the downstream sentence on ArithmeticKTheory now carries "for `i≥2`", which repairs the previous small correction, and four `*Needs:*` lines (§§3.5, 5.5, 5.6, 7.1) arrive with the merge of `main`. Every section, layer and library name those four lines cite exists where cited and supplies what the line says; no statement changed. No findings; two format notes (one carried over, neither blocking) and one question for the author carried over. The Kolster 2009 notes behind §12.3a remain unread from a legal source, which is left to the human reviewers.

## N01 — Mathlib at the pin has a carrier for the `Ш¹` of §10.5a

Carried over; the passage is unchanged. `ContinuousCohomology.tateShafarevich` (Mathlib, `RepresentationTheory/Homological/ContCohomology/Sha.lean`) is the common kernel of the restrictions to a family of extensions; for p odd and `1−i≠0`, with the family of all completions, it is §10.5a's `Ш¹(K,ℚ_p/ℤ_p(1−i))`. A clause in §10.5a could name it, if you wish.

## N02 — In the `*Needs:*` line of §3.5 the gloss "Leopoldt finiteness" stands opposite §2.6, which is weak Leopoldt

The finiteness that §3.5 uses (for totally real F satisfying Leopoldt, `𝔛_S(F∞)_Γ` is finite) comes from the defect of §2.2 and the rank count in the sequence of §2.7, both of which the line already lists, together with the torsion statement of §2.6. Nothing is missing; "weak Leopoldt" would match the cited section's own title (line 501).

## Questions for the author

- Carried over, the passage is unchanged: does Kolster 2009, Theorem 3.3, state the formula of §12.3a for every `S⊇S_p∪S_∞` and for E not containing `μ_p`, or only for S containing the places ramified in `E(μ_p)`? The statement as written is true for every such S, but if the source needs the larger S, a sentence saying how the smaller S follows would make the locator support the statement. I could not check: the notes are linked on a conference host, not an author's page or an open repository.

## Previous findings

The previous report had no finding (no R01); its small correction and format note are accounted for here.

- C01 — repaired: "The kernel of localization on `H²(O_K[1/p],ℤ_p(i))` of §10.5a, for `i≥2`, is its `cohomologicalWildKernel` (ArithmeticKTheory §6.9) at `ℓ=p` and in its degree `i−1`" (line 1921). No new problem introduced.
- N01 — not taken up (a format note, optional): §10.5a is unchanged; written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| §3.5 Chevalley formula (carries the changed `*Needs:*` line) | `ℚ(i)/ℚ`; `ℚ(√−5)/ℚ` | `ℚ(i)`: `e₂e_∞=4`, `[E:F]=2`, unit index 2 (−1 not a norm): `4/4=1=#Cl^G`. `ℚ(√−5)`: `e₂e₅e_∞=8`, `8/(2·2)=2=#(ℤ/2)^G` | holds; Sharifi Theorem 1.3.16, p. 19, read |
| §3.5 `*Needs:*` | each cited section opened | §0.4 arithmetic completed action; §2.1 class limits; §2.2 units, defect; §2.3 `𝔛_S`, X, `X'_S`; §2.4a degree-one sequence `0→X_Γ→H₁(G)→ℤ_p→0`; §2.6; §2.7 | all exist and supply the displayed ray sequence and dictionaries |
| §5.5 bounds `r₂(B_n)≤e_n⁻+1`, `r₂(A_n)≤2e_n⁻+1` (gains a `*Needs:*` line) | `k=ℚ(i)`, `k=ℚ(√−5)`, n=0 | `ℚ(i)`: `A=B=0`, `e⁻=0`: `0≤1`, `0≤1`. `ℚ(√−5)`: `A=ℤ/2`, `B=0`, `e⁻=1`: `0≤2`, `1≤3` | consistent |
| §5.5 `*Needs:*` | §5.4, §2.8, §3.4, §3.5; PadicMeasuresIwasawaAlgebras §4.2 | relative μ=0 (§5.4); norm-kernel `A_n⁻` at 2 (§2.8); `r_p(A_n)≥cpⁿ−O(1)` (§3.4); ambiguous classes (§3.5); "no finite submodules" statement in §4.2 (README line 2218) | all present |
| §5.6 `*Needs:*` | §§5.4–5.5, 3.3–3.4, 0.1–0.2; Mathlib | shift rule `(μ,λ,ν)↦(p^rμ,λ,ν+rλ)` in §3.3; `classNorm_cokernel` rank bound in §3.4; `layer_rat_exponent` in §0.2; `CyclotomicField` at `NumberTheory/Cyclotomic/Basic.lean:652` | all present; Check `ℚ(ζ₉)⊃ℚ(ζ₃)` uses exactly these |
| §7.1 `*Needs:*` | PadicMeasuresIwasawaAlgebras §§2.2, 2.4, 4.3; LocalFieldsRamification Layers 0–3; LocalGaloisGroups Layer 0; Mathlib | §2.2 "Translation, dilation, φ and ψ"; §2.4 "Root-of-unity averaging"; §4.3 Weierstrass; `Algebra.norm` (`RingTheory/Norm/Defs.lean:61`), `Algebra.trace` (`RingTheory/Trace/Defs.lean:70`) | present; "Layers 0–3" resolves through LocalFieldsRamification's table of former layer numbers (its README lines 274–284) |
| Downstream sentence, "for `i≥2`" | ArithmeticKTheory §6.9, §6.1 at this head | coefficients `ℤ_ℓ(i'+1)`, so `i'=i−1`; layer has `i'≥1`, i.e. `i≥2` | exact |

The rows for untouched statements stand as in the previous review, of `9ea672c`.

- Seeded sample: of the fifteen targets only §3.5 lies in a changed passage; its locator Sharifi, Theorem 1.3.16, p. 19, was read (Sharifi lines 509–515: the nine-term sequence for cyclic `E/F`, from which the formula is the alternating product of orders). The README flags no locator as unverified.
- Source locators checked against the text: 1 (above). The four `*Needs:*` lines and the inserted clause add no locator.
- Library declarations opened at the pin: Mathlib `Algebra.norm`, `Algebra.trace`, `CyclotomicField`, `PowerSeries` (files and lines in the table).
- Cross-roadmap citations resolved at this head: PadicMeasuresIwasawaAlgebras §§2.2, 2.4, 4.2, 4.3 (on main); LocalFieldsRamification and LocalGaloisGroups (completed, on main); ArithmeticKTheory §§6.1, 6.9. Consumers: BernoulliBoundsForClassGroupEigenspaces still cites §12.3a, UniformWildKernelBounds §10.5a.
- Record: against the merge base the folder differs by 49 insertions and 1 deletion, all in the README; 13 layers kept, no heading removed, two added (10.5a, 12.3a); no Lean declaration changed.
- Pull request text: its sentences on this roadmap (§12.3a as a section added here and cited by BernoulliBoundsForClassGroupEigenspaces 10.1 and 12.1) agree with this head; the part of the description I was given is truncated, so the remainder was not read.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1469 edges, 0 problem(s)`. Elaboration of `Suggested.lean`: exit 0, `declaration uses sorry` (six) the only warning. No file of the pull request lies outside the roadmap folders it owns.

Overlap check: read EulerSystemsCyclotomicMainConjecture, CyclotomicClassGroupsAndStickelberger, NoncommutativeAndEquivariantIwasawa (main), IntegralIwasawaTheoryPartII, AutomorphicCongruences (open) as in the previous review; nothing shared with the changed passages, which state no new object. No other open pull request changes this roadmap, and none drops an id it cites.

Source independence: changed passages only; 1 passage (the §3.5 paragraph bearing the changed line) compared with 1 source (Sharifi), none shared; the changed lines add no locator, so no largest share; arrangement not compared (no layer added, removed or reordered).

Research link: §10.5a is Schneider's (1979) description of the kernels of localization by twisted coinvariants of the split Iwasawa module, used by Kolster–Movahhedi (2000) for co-descent and capitulation of étale wild kernels; §12.3a is the character form of the special-value consequence of the main conjecture (Kolster 2009). Rests on the README and both texts read.

## Not verifiable

- Kolster 2009, Corollary 2.2, Propositions 3.1–3.2 and Theorem 3.3, cited in §12.3a (unchanged): the README's link is on a conference host that is neither an author's page nor an open repository; not read.
- The remainder of the pull request's description beyond the truncated copy available to this review.

## Source issues

- none

## For the human reviewers

- Licence, and not tested: Kolster 2009 (README References), cited for §12.3a, is linked on the Maine–Québec conference site, not the author's page; §12.3a was not compared with its text.
