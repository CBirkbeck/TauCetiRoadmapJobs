# Review of HomotopySpheres (pull request #284 at a54da79)

**Verdict:** accepted

No finding. This is an incremental re-review of the 97 lines changed since `64bdd7e`.

## Previous findings

- R01 — repaired: §3A.4 (`README.md` lines 1032–1041) needs "RiemannianGeometry R3.4's normalized sphere suspension and comparison range"; the G2 item 5 sentences are gone from §3A.4 and from Scope; G2 items 4–5 remain only in §3B.6.
- R02 — repaired: lines 325–327 "Section 10.1 derives compactness and second countability from the homotopy equivalence and the smooth chart structure"; lines 579–584 and §10.1 agree; the list at lines 607–610 names the three Wall theorems.
- R03 — repaired: contracts added for IntegralLattices (lines 523–525), MorseTheory (lines 527–529), CharacteristicClasses C2.0 (line 521) and GeneralizedCohomology G4 item 2 (line 567).
- R04 — repaired: "uncertified" occurs nowhere in `README.md` or `Suggested.lean`.
- R05 — repaired: §3C.5 (lines 1473–1477) averages over the image of `CliffordAlgebra.monomialGroup`, finite by `CliffordAlgebra.finite_monomialGroup`; both are in "From Tau Ceti" (lines 414–416).
- R06 — repaired: §3B.3 cites Hatcher, Proposition 3C.8, p. 288; §3B.4 cites Theorem 4J.1, p. 471; the Ranicki reference reads "§2, pp. 5–7". The James locator was also changed (see Not verifiable).
- R07 — repaired: the description's fourth bullet reads "Use IntegralLattices 1I and 6A for signature divisibility by eight and the classification of even indefinite unimodular lattices."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §3A.4 Freudenthal range | n = 2, q = 1, 2, 3; n = 8, k = 6; n = 7, k = 6 | 0 → 0; ℤ → ℤ iso; π₃(S²) = ℤ → π₄(S³) = ℤ/2 onto; 14 ≤ 14 stable; 13 ≤ 12 false | sound; agrees with the R3 item 4 contract (lines 504–506) |
| §3A.4 supply direction | RiemannianGeometry and GeneralizedCohomology on main | RiemannianGeometry lines 1031–1033, 2220 own the sphere range and cite no HomotopySpheres section; GeneralizedCohomology line 37 consumes Stage 3A | no cycle |
| Unoriented corollary, §10.1, lines 579–584 | M noncompact connected; M = S⁶ | Hatcher 3.29 (`hatcher_at` line 10370): Hᵢ(M;R) = 0 for i ≥ n, any R, so ℤ/2 needs no orientation; H₆(S⁶;ℤ/2) = ℤ/2 | sound |
| `nonempty_diffeomorph_sphere_six` | Lean binders against the README | `[TopologicalSpace M] [T2Space M]` only; README "on a Hausdorff space" | generality equal |
| §3C.5 monomial group | q = 1, 3, 7 generators with square −1 | `hQ` holds with `Q (b i) = -1`; group orders 4, 16, 256; A orthogonal with A² = −I gives Aᵀ = −A | sound |
| §3B.3 tensor-algebra locator | X = S¹; M(ℤ/2,2) over ℤ | 3C.8 (`hatcher_at` line 12578) needs H∗(X;R) free; S¹ free; Tor(ℤ/2,ℤ/2) = ℤ/2 in degree 5 excluded by freeness | locator supports the statement |
| §3B.4 James equivalence locator | X = S¹ | 4J.1 (`hatcher_at` line 20284): weak equivalence, connected CW; π₁ = ℤ both sides | locator supports the statement as qualified |
| §7C.2 with the IntegralLattices contract | E₈, H, E₈ ⊕ H | t₊ − t₋ = 8, 0, 8; E₈ ⊕ H indefinite even of signature (9,1) | sound |
| `nonempty_sphere_homotopyGroup_sixthStem` (docstring changed) | n = 8 | 14 = 2·8 − 2; group ℤ/2 | true |
| `nonempty_sphere_homotopyGroup_seventhStem` (docstring changed) | n = 8, 9 | π₁₅(S⁸) = ℤ ⊕ ℤ/120; π₁₆(S⁹) = ℤ/240; 16 = 2·9 − 2 | true, bound sharp |

The rows for untouched statements stand as in the previous review, of `64bdd7e`.

- **Gate at a54da79:** every check 0, `OK` (the worker's run). Dependency check rerun: `depcheck: 254 roadmaps, 2595 edges, 0 problem(s)`. No file changed outside the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 20 `sorry` warnings and nothing else. The diff changes two docstrings and no statement, so the elaborated signatures and the padding probe of the previous review stand.
- **Source locators checked against the text (5):** `hatcher_at` Proposition 3.29 (line 10370), Proposition 3C.8 (line 12578), Theorem 4J.1 (line 20284), Corollary 4.24 (line 15686); `ranicki2002` pp. 5–7 (lines 263–292).
- **Library declarations opened at the pin (2):** `CliffordAlgebra.monomialGroup` (`TauCeti/LinearAlgebra/CliffordAlgebra/MonomialGroup/Basic.lean` line 165) and `CliffordAlgebra.finite_monomialGroup` (line 804; hypotheses `[Finite I] [Nontrivial R]`, orthogonality, `Q (b i) = 1 ∨ Q (b i) = -1`).
- **Cross-roadmap citations resolved on main (7):** RiemannianGeometry R3 item 4; IntegralLattices 1I, 6A; MorseTheory M3 (line 963), M5 (line 1382); CharacteristicClasses C2.0 (line 730); GeneralizedCohomology G4 item 2 (line 1214).
- **Pull request text:** the four bullets agree with the head; IntegralLattices is the only roadmap link the head has and main lacks, and the description names it. Headings removed: none; Lean declarations removed: none.
- Remarks, no change asked: the MorseTheory contract lists 1.2, 2.2, 6B.3 and 4B.4–4B.5 while §6B.4 and §4B.9 also name M3 and M5 in their `*Needs:*`; `Suggested.lean` line 317 is 147 characters long.
- Overlap check: read TangentialBordism, PositiveScalarCurvature, GeneralizedCohomology (main), FourManifolds, DGFloerPartII (open); shared: sphere Freudenthal range, owner RiemannianGeometry R3 item 4; stable framed Pontryagin–Thom, owner TangentialBordism B5.5 and StringOrientation S2.3; real Bott chain and James product, owner this roadmap (4B, 3B).
- Source independence: changed passages only; 6 passages compared with 2 sources (`hatcher_at`, `ranicki2002`), none shared; largest share `kervairemilnor1963`, about 35 of 115 locators; the diff adds, removes and reorders no layer, so the contents comparison of the previous review stands: independent.
- Research link: the headline targets are the h-cobordism theorem (Smale 1961; Milnor 1965), the groups of homotopy spheres with Θ₆ = 0 and Θ₇ ≅ ℤ/28 (Kervaire–Milnor 1963), the simply connected surgery groups (Wall 1999) and the low stable stems (Toda 1962); rests on the README's summary and references.

## Not verifiable

- James 1955, Theorems 1.11–1.12 and 5.6 (`README.md` line 1485, a locator this change introduces): the sources service finds only the paywalled publisher page; the theorem numbers are unchecked. The statement of §3B.4 also carries Hatcher, Theorem 4J.1, which was read.
- Toda 1962 (Lemma 5.4, Propositions 5.6, 5.8, 5.9, 5.11, Chapter XIV): no legal open copy; cited by locator.
- Gray 2001 (Propositions 2.1–2.4) and Fomenko–Fuchs (§§27.3–27.4): paywalled; cited by locator.
- Bott 1959, Browder 1969, Smale 1961, Adams–Atiyah 1966: paywalled.
- Wall 1999, Whitehead GTM 61, Milnor *Morse Theory* and *Topology from the Differentiable Viewpoint*: books with no legal open copy.
- Levine, Appendix, pp. 91–93: resolved only to a paywalled publisher page; the copy the README links was not read.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` line 3481 links Levine's lectures (Springer Lecture Notes in Mathematics 1126) to a copy on a university seminar page; the host's right to distribute it could not be classified.
- **Not tested.** `README.md` §§9.2–9.3 rest on Toda and Gray, which could not be read; wording there was compared with no source.
