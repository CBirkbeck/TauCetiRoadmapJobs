# Review of LorentzianGeometry (pull request #2232 at 36705e8)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 24 lines changed since `9fead05` finds that the one finding of the previous review (the regularity of the geodesic joining two points of a convex neighbourhood of a `C¹` connection, §3.4) is repaired, and so are its three small corrections and its format note; the repairs introduce no new problem. There is no finding and no small correction, and one format note. The question about an unrefereed source is still left to the human reviewers, and one deferred point about the RiemannianGeometry README stands outside this folder.

## N01 — Two prime characters for the same metric in §11.2

The definition of stable causality writes the wider metric `g'` (README lines 1586–1587) and the citation added two lines below writes `g′` (line 1590). One character for both would do.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: §3.4 now reads "depending `C¹` on the endpoints, `C^r` for a `C^r` connection by §3.3, and smoothly for a smooth one", and `exp_p` is "a `C¹` diffeomorphism"; this is the conclusion of the cited theorem.
- C01 — repaired: §11.2 cites "Minguzzi 2019b, Definition 2.13 and Theorem 2.29, p. 40, applied to the wider cones of `g′`", and §12.3 the same theorem; that source defines stable causality by a causal wider cone structure.
- C02 — repaired: "the finite-dimensional Peano lemma is a target of §3.2" and "§3.4 supplies the strict derivative and approximation estimates"; both sections contain the named targets.
- C03 — repaired: §2.6 now says "whose Lemma 35 (iii)–(v) gives the warping terms the signs of the opposite curvature convention", which is what the source's formulas show. The same phrase in RiemannianGeometry R1.3 is deferred (D01).
- N01 — repaired: "under the scope boundary below" and "(…`Geodesic/`), whose implementations are generalized".

## Verified sound

| Target | Instances | Roadmap value | Computed value | Result |
| --- | --- | --- | --- | --- |
| §3.4 convex neighbourhoods (changed) | `Γ = x\|x\| v²` on `ℝ` (`C¹`, not `C²`); `Γ = v²` (smooth) | joining geodesic `C¹` in the endpoints; smooth for a smooth connection | midpoint `F⁻¹((F(p)+F(1))/2)`, `F′ = exp(\|x\|³/3)`: `C³` not `C⁴`, so `C¹` holds; `log(e^p + t(e^q − e^p))` is smooth in `(p, q)` | agrees |
| §3.4 against §3.3 (cited by the change) | spray `z′ = (v, −Γ_x(v,v))` for `C^r` `Γ` | flow and `exp` are `C^r`, so endpoint dependence is `C^r` | spray is a `C^r` field; `(p,v) ↦ (p, exp_p v)` has invertible derivative at `v = 0`, inverse `C^r` for `r ≥ 1` | agrees |
| §3.4 locator | minguzzi2019 lines 1090–1096 (Theorem 2.4, pp. 26–27) | `C¹` connection, `C¹` diffeomorphism onto `C × C` | the theorem states exactly a `C¹` diffeomorphism from a star-shaped open subset of `TC` | agrees |
| §11.2 stably causal ⇒ strongly causal (changed) | Minkowski with `g′ = −2dt² + dx²`; timelike cylinder | implication for the cone-widening definition | `g′(v,v) = −2a² + b² < 0` for `b² ≤ a²`, `v ≠ 0`, `g′` causal, Minkowski strongly causal; cylinder: no wider metric is causal, not strongly causal | agrees |
| §11.2 locator | minguzzi2019cone lines 1615–1622 (Definition 2.13, Theorem 2.29, p. 40) | stable causality by a causal `C⁰` proper cone structure `C′ > C`; implies strong causality | definition and theorem are on p. 40 with these hypotheses (closed cone structure); the cones of a continuous `g′` are such a `C′` | agrees |
| §12.3 equivalence with the strongly causal form (changed locator) | minguzzi2019 lines 6158–6164 (proof of Definition 4.117) | causal with compact diamonds gives strong causality | proof gives causally simple, hence stably causal; Theorem 2.29 then gives strongly causal; §11.2 also has causally simple ⇒ strongly causal directly | agrees |
| §2.6 sign remark (changed) | flat `ℝ³ = (0,∞) ×_r S²`; `dt² + f² dx²` | Lemma 35 (iii)–(v) carry the opposite convention's warping signs | (iii) as printed gives `(2/r²)(g(W,U)V − g(V,U)W) ≠ 0` under the source's (53), `0` with the term negated; (iv) gives `+(f″/f)V` against `R(V,X)X = −(f″/f)V` | agrees |
| Supplier-contract pointers (changed) | §3.2 lines 665–668; §3.4 lines 743–747 | Peano lemma in §3.2; strict derivative of `exp` in §3.4 | both targets are in the named sections | agrees |

The rows for the untouched statements stand as in the previous review, of `9fead05`; `Suggested.lean` is unchanged since that head.

- Source locators checked against the text: 4 (minguzzi2019 Theorem 2.4 and the proof of Definition 4.117; minguzzi2019cone Definition 2.13 with Theorem 2.29 and Theorem 2.24 used in its proof; barzenleymann2026 Lemma 35 with its definition (53)). The seeded sample falls in the changed passages at §2.6, §3.3 and §3.4, all covered above.
- Library declarations opened at the pins: none new; the change names no library declaration that the previous review did not open.
- Cross-roadmap citations resolved: 1 (RiemannianGeometry R1.3 on main, lines 289–292, still as D01 describes it).
- Dependency check: `depcheck: 122 roadmaps, 1390 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- Elaboration: `Suggested.lean` gives 0 errors and 8 `sorry` warnings (lines 151, 304, 312, 323, 348, 358, 427, 473), nothing else; the file has no `set_option`.
- Automatic checks: every check passed on this head, with the targeted build.
- Overlap check: read CompressibleEulerEquationsPartII, CompressibleEulerEquations, RiemannianGeometry, HopfRinow, RiemannianManifoldsWithConvexBoundary and SymmetricHyperbolicSystems (as in the previous review; the change touches no owned object); the acoustical form, null hypersurfaces and generators and domains of dependence in a subset are owned here and cited by both Euler roadmaps; positive-definite warped-product, Jacobi and immersion objects are RiemannianGeometry's; linear symmetric hyperbolic systems are SymmetricHyperbolicSystems'. No object has two owners, no dropped id, no second copy, no other pull request changes this roadmap.
- Pull request text read against the head: the title, the summary block and the prose describe nothing that the 24 changed lines alter; no sentence is contradicted and no change is left unstated.
- Source independence: changed passages only; 4 passages compared with 3 sources (minguzzi2019, minguzzi2019cone, barzenleymann2026), none shared beyond what the mathematics forces; largest share minguzzi2019, 47 of 91 locators; the change adds, removes or reorders no layer, so the contents comparison stands as before: independent.
- Research link: §12.4 states the `C⁰`-inextendibility theorems of Sbierski (2018) and Galloway–Ling–Sbierski (2018); §12.3 and §13.3 the Bernal–Sánchez (2003–2007) splitting and the Hawking (1967) and Penrose (1965) theorems; §12.6–§12.7 and §7.3 serve Lange–Lytchak–Sämann (2021) and Luo–Yu (2023). Rests on the README's sources and the texts read.

## Not verifiable

- `oneill1983` (Ch. 7, Propositions 35 and 42, Corollary 43, cited in the changed sentence of §2.6) is settled as uncertified and was not read.
- Kobayashi–Nomizu, Vol. I, §III.8 (cited in the changed sentence of §3.4) and Bernal–Sánchez 2007 (§12.3) have no text in the sources cache and were not read; Minguzzi 2019, Theorem 2.4, supports the §3.4 statement.

## Source issues

- **Error** in barzenleymann2026 at Lemma 35 (iii)–(v), p. 62: the source says the fibre and mixed curvature terms of a warped product carry the signs of the convention opposite to its own Definition 43, (53); it should be those formulas with the warping terms negated; affects a stated result.

## For the human reviewers

- **Scope.** `barzenleymann2026` (arXiv:2606.02616) is an unrefereed expository preprint; README lines 295, 496 and 534 cite it for the coordinate curvature formula, constant curvature and warped products, beside O'Neill, which is uncertified. Its Lemma 35 has the sign error recorded above.
