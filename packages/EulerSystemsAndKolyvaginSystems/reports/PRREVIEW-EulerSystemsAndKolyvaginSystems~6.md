# Review of EulerSystemsAndKolyvaginSystems (pull request #1272 at a0e5702)

**Verdict:** accepted

Incremental re-review of 0 changed lines since a0e5702. The folder is unchanged; this round read the pull request's title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "The roadmaps on main that it cites by name and section are Chebotarev, GlobalNumberFields, ProfiniteCohomology, ClassFieldTheory, ImaginaryQuadraticClassNumber, EllipticCurves, PadicMeasuresIwasawaAlgebras, ClassicalArithmeticCompletion and DerivedModuleAlgebra."

## Verified sound

The diff changes no statement; the row is the Lean statement the description cites with its hypotheses.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `integralComparison_finiteCokernel_maximalDivisible` (`Suggested.lean:120`, described in the pull request's second paragraph) | `G = 1`; `G = ℤ_p` trivial on `V = Φ`, `L = O`; `G = ℤ/p` trivial on `ℚ_p ⊃ ℤ_p`; control `G = ∏_ℕ ℤ/p` | both `H¹` zero, `I = 0`; `Φ → Φ/O` onto, cokernel 0, `I` divisible; `H¹(V) = 0`, `H¹(V/L) = ℤ/p`, `I = 0` = maximal divisible, cokernel order `p`; control: `Hom_cont(G, ℚ_p/ℤ_p)` infinite, `I = 0` | holds; `IsTopologicallyFinitelyGenerated` excludes the control; the description's wording (finite cokernel, image the maximal divisible subgroup) equals the Lean conclusion | none |

The rows for all other statements stand as in the previous review, of `a0e5702`.

- Description against the head, sentence by sentence: the nine roadmaps on main cited by name and section are exactly those the README names (every folder name of main searched in `README.md`: Chebotarev, ClassFieldTheory, ClassicalArithmeticCompletion, DerivedModuleAlgebra, EllipticCurves, GlobalNumberFields, ImaginaryQuadraticClassNumber, PadicMeasuresIwasawaAlgebras, ProfiniteCohomology; the tenth hit, `RepresentationTheory`, is a Tau Ceti file path at `README.md:85`, `:91`, not a roadmap citation).
- The four suppliers not on main are exactly IntegralIwasawaTheory (§12.6; §§0.1–0.3, 1.1 at `README.md:2354`; §§10.0–10.1 at `:4502`), ArithmeticGaloisRepresentations (§5.8 at `:99`, `:2840`), SelmerIwasawaCohomology (Layers 2–4; §§2.1–2.19, 3.0, 3.11, 4.18, 4.25 each cited) and ArithmeticGaloisDuality (R02.1.2, R02.1.3, R02.2.1, R02.2.3, R02.4, R02.5.1, D7.1–D7.7 each cited); all four are earlier in the merge order (positions 30, 58, 87, 62; this roadmap 106).
- Summary block against the headings and text: coefficient ring (`README.md:255`), transverse self-duality at `p = 2` (`:69`), `Z_p^d`-extensions with no finite prime splitting completely (§8.1), weak Leopoldt (§§8.25, 8.27), `char(X∞) | ind_Λ(c)` (§8.37), augmentation and coefficient primes (§§8.35–8.36), Fitting-ideal and class-group bounds (§§7.4, 7.6), no Gorenstein assumption on character quotients (`:11`, `:141`), the four downstream applications (`:5945`); the title equals the README heading.
- Folder and Lean claims: the folder holds `README.md`, `Suggested.lean`, `metadata.toml`; imports are `Mathlib` and two `TauCeti` modules (`Suggested.lean:1-3`); two theorems with `sorry` (`:102`, `:120`); the docstring names the absent carriers (`:14-24`). The change against the base adds the roadmap (6118 insertions, no heading or declaration removed), as the description says; nothing changed outside the folder.
- Gate re-run at `a0e5702`: every counter 0, `OK`; the worker's run also has `build=0`.
- Dependency check: `depcheck: 247 roadmaps, 2239 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: two warnings, both `declaration uses sorry` (102:8, 120:8); the elaborated signatures are those of the previous review, no binder lost.
- Seeded sample (§§1.4, 1.10, 2.8, 3.13, 4.2b, 4.6, 4.16, 4.20, 5.6, 5.9, 6.9, 8.11, 8.26, 8.32, 8.33): none falls in a changed passage (there is none); source locators checked this round: 0.

Overlap check: read HeegnerPointEulerSystems, SelmerIwasawaCohomology, EulerSystemsCyclotomicMainConjecture, ModularIwasawaMainConjectures, ModularIwasawaMainConjecturesPartII, PadicMeasuresIwasawaAlgebras, ClassicalArithmeticCompletion; nothing shared. Each open one names this roadmap as owner of generic Euler/Kolyvagin-system descent and keeps its own classes (Heegner, cyclotomic, Kato, elliptic units); SelmerIwasawaCohomology's scope excludes Euler and Kolyvagin systems and transverse conditions; the two on main are cited as suppliers (Layer 6; §§7.4, 7.21, 7.56). The overlap list has no dropped id, no second copy and no other pull request changing this roadmap.

Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change), none shared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- The sampled locators were not re-certified against their sources this round: the passages are unchanged since the review of `a0e5702`.
- Rubin's published pagination remains uncertified, as in the previous reports; the README cites the readable 1999 draft.
- The description's statement of which AI tools assisted, and of Lake's notice in the build log, cannot be checked from the head.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` References: the Mazur–Rubin "Kolyvagin systems" link is a copy on a third party's institutional page (`webusers.imj-prg.fr/~christophe.cornut`), not an author's page or the publisher.
- **Licence.** `README.md` References: Rubin's published "Euler Systems" is linked from `wstein.org/people/rubin/book`, described there as the author's file hosted by W. Stein.
