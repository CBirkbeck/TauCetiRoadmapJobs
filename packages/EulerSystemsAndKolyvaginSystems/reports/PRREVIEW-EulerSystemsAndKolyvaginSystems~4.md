# Review of EulerSystemsAndKolyvaginSystems (pull request #1272 at ccd7e7a)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since ccd7e7a. The folder is unchanged and the gate passes; both findings are in the pull request's description, which describes an earlier head. Neither asks for a change to the roadmap files.

## R01 (P3) — Description says `Suggested.lean` has no declarations and builds without warnings

**Location:** pull-request description, folder and Validation paragraphs: "`Suggested.lean` imports Mathlib … it contains no declarations, and every target is in the README" and "the targeted Lake build succeeds with no warnings (the file has no declarations to admit)"; also "author-side red-team passes to follow".

**Claim:** The head contradicts all three. `Suggested.lean` states two admitted theorems, imports two Tau Ceti modules besides Mathlib, and elaborates with two `sorry` warnings; the branch already carries the red-team and review repairs.

**Witness:** `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/Suggested.lean:2-3` (two `TauCeti.*` imports), `:102` `compactIrreducible_h1_vanish`, `:120` `integralComparison_finiteCokernel_maximalDivisible`; elaboration warns `declaration uses sorry` at 102:8 and 120:8; `README.md:245` names both theorems.

**Repair:** Replace the two passages with:

> Roadmap folder `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems` (README, `Suggested.lean`, `metadata.toml`). `Suggested.lean` imports Mathlib and the two Tau Ceti modules for explicit continuous-cohomology functoriality and topological finite generation. It states the two §4.2a headline theorems that are statable at the pins, `compactIrreducible_h1_vanish` and `integralComparison_finiteCokernel_maximalDivisible`, each with `sorry`; its docstring records the headline theorems whose arithmetic carriers (Selmer structures, Euler, Kolyvagin and Stark systems, the joint arithmetic extension of §4.2b) are absent at the pins.

> Validation: the targeted Lake build succeeds, its only warnings being the two `sorry`s of the stated theorems; README identifiers absent from Lean, Check labels, round labels and empty Lean sections are all zero; no `set_option` overrides; the dependency gate shows no upward edge for this roadmap. AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, followed by red-team and review repair passes.

## R02 (P3) — Description names one supplier and calls every other roadmap a consumer

**Location:** pull-request description, Dependencies paragraph: "By section, the README uses: IntegralIwasawaTheory, whose §12.6 owns the common bidual and finite-CM Rubin lattice. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** The README's supplier contracts consume three further roadmaps that are not on main, so the last clause is false and three suppliers are unstated in the prose (the generated depends-on block does list them).

**Witness:** `README.md:99` "From ArithmeticGaloisRepresentations §5.8"; `:143` "From SelmerIwasawaCohomology §§2.1–2.19" (also `:149`, `:189`, `:195`, `:201`, `:213`, `:235`); `:219`, `:225` "From ArithmeticGaloisDuality §R02.1.2", "§D7.3". None of the three folders is on main.

**Repair:** Replace the two sentences with:

> By section, the README uses four roadmaps that are not yet on main: IntegralIwasawaTheory §12.6 (the common exterior bidual and finite-CM Rubin lattice); ArithmeticGaloisRepresentations §5.8; SelmerIwasawaCohomology §§2.1–2.19, 3.0, 3.11, 4.18, 4.25 and Layers 2–3 (Selmer structures, propagation, control and Iwasawa cohomology); ArithmeticGaloisDuality §R02.1.2 and §D7.3 (inverse-limit cohomology, compact Shapiro and projection formulas). Roadmaps on main (Chebotarev, ProfiniteCohomology, ClassFieldTheory, ImaginaryQuadraticClassNumber, PadicMeasuresIwasawaAlgebras, ClassicalArithmeticCompletion, DerivedModuleAlgebra) are cited by name and section. The roadmaps named under "Downstream consumers" are consumers, not prerequisites.

## Previous findings

- none: the previous report, of this same head `ccd7e7a`, was an acceptance with no finding; its own `## Previous findings` bullets (R01–R03 of the review before it, all repaired) are unchanged at this head.

## Verified sound

The diff changes no statement; the rows are the two Lean statements the description's changed-against-head text cites.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `compactIrreducible_h1_vanish` (`Suggested.lean:102`, §4.2a) | G=1, V=Φ; G=C₂ by −1 on ℚ₂ (p=2); G=ℤ_p by injective χ on Φ; control: ℤ_p trivial on Φ | H¹=0; ker(1+σ)/im(1−σ)=V/2V=0; V/(χ(γ)−1)V=0; control H¹=Hom_cont(ℤ_p,Φ)=Φ≠0, not faithful | holds; `FaithfulSMul` excludes the control | none |
| `integralComparison_finiteCokernel_maximalDivisible` (`Suggested.lean:120`, §4.2a) | G=1; G=ℤ_p trivial on ℚ_p, L=ℤ_p; G=C_p trivial on ℚ_p; control G=(C_p)^ℕ | target 0, I=0; target ℚ_p/ℤ_p, I=all, cokernel 0; target ℤ/p, I=0, cokernel ℤ/p, maximal divisible 0=I; control cokernel ⊕ℤ/p infinite | holds; `hG` excludes the control | none |

The rows for all other statements stand as in the previous review, of `ccd7e7a`.

- Gate re-run at `ccd7e7a`: every counter 0, `OK`; the worker's run also has `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2214 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: exit clean, two warnings, both `declaration uses sorry` (102:8, 120:8); the two elaborated signatures were compared with `README.md:245` and the §4.2a statement, no binder lost.
- Changes outside the folder: none (`git diff --stat` against the base is empty outside it).
- Description against the head, sentences confirmed: coefficient ring (`README.md:255`), `p = 2` transverse condition (`:69`), `ℤ_p^d` towers (`:191`, §8.1), `ind_Λ` (§8.7), weak Leopoldt (§§8.25, 8.27), augmentation and coefficient primes (§§8.35–8.36), consumers (`:5945`), `TauCeti.fittingIdeal` (`:95`); title matches the README heading.
- Remark: the summary block's `TauCeti.StarkSystems.exteriorBidual` is not a pinned Tau Ceti declaration; `README.md:77` consumes it from IntegralIwasawaTheory §12.6.
- Seeded sample (§§0.4, 1.5, 1.13, 1.17, 1.19, 3.1, 3.2, 3.20, 5.8, 6.6, 7.6, 8.5, 8.7, 8.16, 8.23): none falls in a changed passage; source locators checked this round: 0.
- Overlap check: read HeegnerPointEulerSystems, SelmerIwasawaCohomology, EulerSystemsCyclotomicMainConjecture, ModularIwasawaMainConjectures, PadicMeasuresIwasawaAlgebras, ClassicalArithmeticCompletion; nothing shared (the first and third cite this roadmap's sections as consumers; `overlaps.md` lists no dropped id and no second copy).

Source independence: changed passages only; 0 passages compared with 0 sources, since the folder did not change; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- The sampled locators were not re-certified against their sources this round: the passages are unchanged since the review of `ccd7e7a`.
- Rubin's published pagination remains uncertified, as in the previous report; the README cites the readable 1999 draft.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` References: the Mazur–Rubin "Kolyvagin systems" link is a copy on a third party's institutional page (`webusers.imj-prg.fr/~christophe.cornut`), not an author's page or the publisher.
- **Licence.** `README.md` References: Rubin's published "Euler Systems" is linked from `wstein.org/people/rubin/book`, described there as the author's file hosted by W. Stein.
