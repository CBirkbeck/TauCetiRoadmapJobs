# Review of QuadraticFormInvariants (pull request #1411 at dfca92f)

**Verdict:** needs changes

## R01 (P3) — The description of ProfiniteCohomology's declarations no longer matches main

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/README.md` 363–373 and 1916–1920: "Its `ProfiniteCohomology.cup`, `ProfiniteCohomology.f2Pairing`, … and `ProfiniteCohomology.galoisF2Iso` are that roadmap's prototypes"; "are not Tau Ceti's declarations".

**Claim.** ProfiniteCohomology declares `res`, `infl`, `kummerMap`, `kummerIso`, `kummerShortExact`, `hilbert90`, `B2`, `explicitCup11` as aliases, and its `cup`, `f2Pairing`, `homClass`, `inhomogeneousCochain2`, `cochainClass`, `galoisF2Iso` are prototypes.

**Witness.** Main `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` 393–395: `abbrev f2Pairing … := TauCeti.trivialF2TopPairing G`; 522–524: `galoisF2Iso … := TauCeti.galoisF2Iso K L σ n`; 353–359: `cup` has value `TauCeti.TopPairing.cup`. It declares none of the eight names.

**Repair.** Replace README 363–373 from "Its `AbsoluteGaloisGroup`" by: "Its `AbsoluteGaloisGroup`, `trivialF2`, `coeffMap`, `KummerCoeff`, `kummerMapCanonical`, `UnitsCoeff`, `h2KummerToUnits`, `galoisSubgroup`, `Z2`, `H2`, `explicitH2IsoContinuousCohomology`, `f2Pairing`, `homClass`, `inhomogeneousCochain2`, `cochainClass` and `galoisF2Iso` are reducible aliases of Tau Ceti's declarations, its `cup` is a definition whose value is `TauCeti.TopPairing.cup`, and its `TopRep` is Mathlib's `TopRep` (`Mathlib/RepresentationTheory/Continuous/TopRep.lean`). Restriction, inflation, the Kummer map and isomorphism, the Kummer sequence, Hilbert 90 and the explicit cups are named there by their Tau Ceti names only. Layers 7 to 9 are stated on Tau Ceti's native operations listed above." Replace README 1916–1920 from "That roadmap's prototypes" by: "That roadmap's `cup`, `f2Pairing`, `homClass`, `inhomogeneousCochain2` and `galoisF2Iso` are aliases of these Tau Ceti declarations, and the statements of these layers use the Tau Ceti names."

## R02 (P3) — The Dependencies of Layers 3 and 5 omit Layer 1

**Location.** README 964: "Layers 0 and 2."; README 1307: "Layers 0, 2, 3 and 4 of this roadmap".

**Claim.** Each layer's `### Dependencies` lists every layer its targets need.

**Witness.** README 887, in Layer 3: "*Needs:* the discriminants above; Layer 1's hyperbolic class." README 1207, in Layer 5: "Layer 1's Witt cancellation". README 385: "Layer 3 needs Layers 0 to 2".

**Repair.** README 964: "Layers 0 to 2." README 1307: "Layers 0 to 4 of this roadmap".

## R03 (P3) — The description names two Checks blocks the head does not add and omits one it adds

**Location.** Pull request description, paragraph **QuadraticFormInvariants**: "Checks are added for the Witt ring and its fundamental ideal (Layer 4), the quadratic defect (6B), the Hilbert symbol and the local Hasse invariant (6C) and the Stiefel–Whitney classes (Layer 8)."

**Claim.** The change adds Checks for the fundamental ideal and for the local Hasse invariant.

**Witness.** `git diff origin/main...HEAD` on the folder adds five blocks, at README 1002, 1435, 1542, 1697 and 2349. The fourth is "**Checks** for the dictionary `TauCeti.hilbertSign`"; none is under the fundamental ideal (1019) or item 7 (1625, already on main).

**Repair.** "Checks are added for the Witt ring (Layer 4), the quadratic defect (6B), the Hilbert symbol and the sign dictionary `TauCeti.hilbertSign` (6C) and the Stiefel–Whitney classes (Layer 8)."

## Previous findings

- R01 of the previous review (no order against two other pull requests) — repaired: no other open pull request changes this folder at the heads read, and the description's shared-folder list names only `IntegralLattices`.
- R02 of the previous review (`Completed/LocalGaloisGroups` changed outside the listed folders) — repaired: the three-dot diff outside `QuadraticFormInvariants` and `IntegralLattices` is empty, and the description says "It no longer changes ClassFieldTheory or `Completed/LocalGaloisGroups`".

## Verified sound

Notation: `(·,·)_p` is the Hilbert symbol over `ℚ_p`, `ε(u) = (u−1)/2`, `ω(u) = (u²−1)/8` mod 2, `ℍ` Hamilton's quaternions.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| S1 | Quaternion algebras are central simple (1137) | `ℍ[ℚ,−1,−1]`; `a = 4` | Norm `x²+y²+z²+w²` anisotropic: division. `a = 4`: norm form vanishes at `(2,1,0,0)`: `M₂`. `ekm2008` line 20422–20426, printed 389–390 | holds | none |
| S2 | Quaternion symbol in `Br(K)` (1152) | `⟨2,−1⟩` vs `⟨1,−2⟩` over `ℚ` | Both represent `1`, discriminant `−2`: isometric, so `[(2,−1)] = [(1,−2)] = 1`. `ekm2008` lines 20478–20534: (1) p. 390, (2)–(4) p. 391 | holds | none |
| S3 | Hasse invariant, scaling formula (1188) | `n = 2`; general `n` | `(λa,λb) = (λ,λ)(λ,ab)(a,b) = (λ,−1)¹(λ,d)¹ s`. General: `(λ,−1)^{C(n,2)} (λ,d)^{n−1} s`; pinned type has `rank.choose 2`, `rank − 1` | holds | none |
| S4 | Classification in dimension ≤ 3 (1199) | `ℝ`, ranks 3 and 4 | Rank 3 `(d,s)`: `(1,1)`, `(−1,1)`, `(1,−1)`, `(−1,−1)`, distinct. Rank 4: `⟨1⁴⟩`, `⟨−1⁴⟩` both `(1, (−1)⁶ = +1)` | holds; bound sharp | none |
| S5 | Clifford invariant formula (1224) | `n⟨1⟩` over `ℝ`, `n = 1..8`; `⟨−1,−1,−1⟩` | `C(n+1,4) = 0,0,1,5,15,35,70,126`: `1,1,ℍ,ℍ,ℍ,ℍ,1,1`. Second: `ℍ·ℍ·ℍ = ℍ = [C₀]`. Pinned exponents `(n−1).choose 2`, `(n+1).choose 4` | holds | none |
| S6 | `I²` homomorphism, step 1 (1236) | `⟨1⁴⟩ ⊥ ⟨1³⟩`; `⟨1,1⟩ ⊥ ⟨1⟩` over `ℝ` | `c(⟨1⁷⟩) = 1 = ℍ·ℍ`; `c(⟨1³⟩) = ℍ ≠ 1·1`. `ekm2008` line 3434: both even, `disc ϕ` trivial, p. 63 | holds; hypothesis needed | none |
| S7 | Base change (1272) | `ℝ → ℂ` | `ℍ ⊗ ℂ = M₂(ℂ)`: `[ℍ] ↦ 1`. `ekm2008` line 20372, printed 388 | holds | none |
| S8 | The symbol (1534) | `ℚ_2`: `(2,5)`, `(5,5)`, `(−1,−1)` | `ω(5) = 1`: `−1`. `25 − 5·4 = 5`: `+1`. `ε(−1)² = 1`: `−1`; the model `b = x² + ay²` gives `+1` | discriminates | none |
| S9 | Classical construction, the index (1577) | `ℚ_2(i)/ℚ_2`; `a = 4` | Sums of two squares: classes `1, 2, 5, 10`; index `8/4 = 2`. `a = 4`: `x² − 4y²` universal, symbol `+1` | holds | none |
| S10 | Milestone 1 and `hasseInvariant_eq_localHasse` (1781) | `ℚ_2`: `![−1,−1]`, `![2,5,5]`, `n = 0` | `ε[ℍ] = −1 = (−1,−1)_2`; `(2,5)(2,5)(5,5) = +1` both sides; empty product `1`. A constant `ε` is not injective on two elements | holds | none |
| S11 | Milestone 2 (1799) | `ℚ_2`, `ℚ_3` at `(−1,−1)` | Invariant `1/2 ↔ −1`; `0 ↔ +1`. Pinned `hilbertSymbol_eq_cohomological` takes `ζ` and `tr` as arguments, as README 63–65 says | holds | none |
| S12 | Compatibility with the cup product (1829) | `ℚ_2`: `(2,5)`, `(5,5)` | `(2) ∪ (5) ≠ 0 ↔ −1`; `(5) ∪ (5) = 0 ↔ +1`. `ekm2008` line 20871, printed 395 | holds | none |
| S13 | Evens norm on a Kummer class (2551) | `a = 1+2i` over `ℚ_2(i)`; `a = c ∈ K`; `a = √d` | `(2)∪(5) + (2)∪(−1) = (2)∪(5) ≠ 0`. `a = c`: `(c)∪(c) + (c)∪(d)`, equal to `N(res y)`. `√d`: `(2)∪(d)`. `kahn1984` lines 763–765 | holds | none |
| H1 | Four-fold splitting criterion (757) | `ℚ_2`: `(2,5)`, `(5,5)`; `a` a square | All five fail; all hold at `(x,y) = (5,2)`; square `a`: `x² − ay²` universal. Pinned statement is a TFAE of five | holds | none |
| H2 | Local classification by `(dim, d, s)` (1725) | `ℚ_3`: `⟨1,1⟩` vs `⟨3,3⟩`; `ℝ` | `d = 1` both; `s = +1` vs `(3,3)_3 = (3,−1)_3 = −1`. `ℝ`: `⟨1⁴⟩`, `⟨−1⁴⟩` collide, outside the hypothesis | holds | none |
| H3 | Cup-norm theorem (2234) | `ℝ`; `𝔽_3` | `−1 ≠ x² + y²` and `(−1)∪(−1) ≠ 0`; `H² = 0` and every norm equation solvable | holds | none |
| H4 | Evens value | as S13 | as S13; `serre1984cmh` line 560–562 gives `(2)(d_E)` with `d_E` the discriminant of the algebra | holds | none |
| H5 | Relative `w₂` formula (2702) | `Tr a ≠ 0`; `Tr a = 0`; `a = 1` | `(Tr a)∪(−d·N a)` both sides; `0 = (2)∪(d) + (2)∪(d)`; `a = 1`: `N^Ev = (2)∪(−d) + (2)∪(d) = 0`, both sides `(2)∪(d)` | holds | none |
| C1 | New Checks, Witt ring (1002) | `ℂ`, `ℝ`, `⟨a,−a⟩` | `W(ℂ)`: 2 elements; `⟨1,1⟩` over `ℝ` signature `2 ≠ 0`; `⟨a,−a⟩` represents `1`, discriminant `−1`: hyperbolic | holds | none |
| C2 | New Checks, defect (1435) | `ℚ_2`: `1, 5, −1, 2, 5/4, 20, −5`; `ℚ_3`: `−1` | `δ = ⊤, 2, 1, 1, 0, 4, 1`; integral `ξ` gives `−2` at `5/4`; `ℚ_3`: `δ(−1) = 0` | holds | none |
| C3 | New Checks, symbol over `ℚ` (1551) | `(−1,3)`, `(−1,7)`, `(−1,21)` | `3`, `7`, `21 = 3·7` have primes `≡ 3 mod 4` to odd power: all `−1`; multiplicativity would give `+1` | holds | none |
| C4 | New Checks, `hilbertSign` (1697) | `a = b = 1`; `a = b = −1` over `ℚ` | All invariants `0`: product `+1`; reversed dictionary gives `−1`. Invariants `1` at `2`, `∞`: `(−1)(−1) = +1` | holds | none |
| C5 | New Checks, `w₁`, `w₂` (2349) | `⟨1,−1⟩`; `⟨−1,2⟩`, `⟨−1,−1⟩` | `w₁ = (−1)`, signed discriminant `[1]`. `(−1,2)_2 = +1`; `i ≤ j` adds `(−1,−1)_2 = −1`. `⟨−1,−1⟩`: `−1, −1, +1` at `ℝ, ℚ_2, ℚ_3` | holds | none |
| F1 | ProfiniteCohomology's declarations (363–373) | main's `Suggested.lean`, 591 lines | 19 names listed as aliases: 11 declared, 8 absent; 6 listed as prototypes: 5 reducible aliases, 1 definition with a library value | fails | R01 |
| F2 | Layer Dependencies | Layers 1–9 against every `*Needs:*` line | Layers 3 and 5 name Layer 1 in a `*Needs:*` line and not in Dependencies; the other seven agree | fails | R02 |
| F3 | Description against the diff | 66 added lines, 5 blocks | Blocks at 1002, 1435, 1542, 1697, 2349; 0 statements changed; `Suggested.lean` unchanged | sentence wrong | R03 |

- Source locators checked against the text: 19 passages in 4 sources (`ekm2008` §10, §13, 14.1–14.3, 98.C, 98.E, 98.10, 98.13, 99.1, 99.5, 99.7; `kahn1984` Théorème 2, II.2.1, II.3.5; `serre1984cmh` §1.2, Théorème 1, Théorème 1′; `kozlowski1984` Theorem 1.1); printed pages are the file's page minus 8 in `ekm2008`.
- Library declarations: of the README's roughly 700 dotted Lean names, all but 15 match a declaration of that full name at the pins (indexed with namespaces); the 15 were resolved by hand (4 Mathlib names, 10 names of the two supplier roadmaps on main, `TauCeti.hyperbolicClass` at `Hyperbolic.lean` 214); all 184 cited file paths exist; 21 types elaborated with `#check @`, among them the five headline declarations, and each agrees with the README's hypotheses.
- Cross-roadmap citations resolved on main: LocalFieldsRamification Layers 0–2 and its four named theorems (708, 720, 857, 870), ClassFieldTheory Layers 5 and 14 and its name table (README 253–290), ProfiniteCohomology Layers 0–4, 8–10, 12, 13, SemisimpleAlgebras Layers 4–6; `Completed/OrthogonalSpinGroups/Suggested.lean` 84–86 pins the three names this file declares.
- Gate at this head: the worker's run passes every check; my run with `--base origin/main` reports only `outside-folder=2`, the two `IntegralLattices` files, which are this pull request's own.
- Dependency check, verbatim: `depcheck: 261 roadmaps, 2605 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; no `sorry`, no `set_option`; the four signatures in `scratch/signatures.md` match the README and none lost a binder. One-tactic probe on `hasseInvariant_eq_localHasse`: `simp`, `rfl`, `infer_instance` and one `exact` each fail.
- Headline theorems: five (Layers 2, 6D, 7C, 9, 9), all proved at the pin under the names the module docstring gives, so none is restated and none is unstatable.
- GeometryOfNumbersAndQuadraticArithmeticPartII's open head declares `gap:quadratic-extension-witt-exactness` against this roadmap (its README 71); this README states no such target, which is that roadmap's contract and not a defect here.

Overlap check: read QuadraticFormInvariantsPartII, GeometryOfNumbersAndQuadraticArithmeticPartII, OrthogonalSpinGroups (main's `Completed` copy), QuaternionArithmetic, RealSurfacePeriodIndex, GlobalQuadraticForms, ProfiniteCohomology, ClassFieldTheory; nothing shared. Each cites this roadmap by layer, and no other `Suggested.lean` uses the namespace `TauCetiRoadmap.QuadraticFormInvariants`.

Source independence: 19 passages compared with 4 sources, none shared; largest share lam2005, 33 of 99 locators; contents compared with lam2005 by chapter number only (Layers 0–1 ↔ Ch. I, 2 ↔ III, 4 ↔ II and X, 5 ↔ V, 6 ↔ VI, 9 ↔ VII, 7–8 ↔ none): independent; lam2005's text and contents page could not be read.

Research link: Layer 9 is the degree-two case of Kahn's relative Stiefel–Whitney formula (Kahn 1984, Théorème 2), proved through Serre's trace-form theorem (Serre 1984, Théorème 1′); Layers 5 and 7 give the invariant `e₂` of Elman–Karpenko–Merkurjev (2008, Theorem 14.3). Rests on the README's References and on `kahn1984`, `serre1984cmh`, `ekm2008`.

## Not verifiable

- Locators into `lam2005`, `serre1973cia`, `serre1979lf`, `omeara1963`, `scharlau1985`, `gilleszamuely2017`, `milnor1970` and `delzant1962`: settled as uncertified, no text to read.
- Of the sample, "The Hasse invariant", "Classification in dimension at most three", "The Clifford invariant", "The classical construction" and "Milestone 2" cite only those texts; their mathematics is computed in rows S3–S5, S9 and S11.
- OrthogonalSpinGroups at its open head: the checkout listed for it holds no README at the listed path; main's `Completed` copy was read instead.

## Source issues

- none

## For the human reviewers

- **Not tested.** `lam2005` carries 33 of the README's 99 locators and is uncertified: its wording was not compared with the roadmap, and its contents were compared only through the chapter numbers the README's References give (the publisher's page refused the request).
