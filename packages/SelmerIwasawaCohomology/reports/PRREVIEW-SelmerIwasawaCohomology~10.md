# Review of SelmerIwasawaCohomology (pull request #3187 at 8989684)

**Verdict:** accepted

**Summary.** An incremental re-review of the 4 lines changed since `494ecd3`, and of the title and description against this head. The previous review had no finding; its two small corrections are repaired: the *Needs:* line of §2.23a now names ArithmeticGaloisDuality §§D7.7.3–D7.7.4, the supplier contract states that the duality step uses the cup product truncated in degrees `≥ 2` (recomputed, and read in Nekovář at 6.2.1.2), and the three sentences of the description now match the head. No finding, so the folder is accepted; there is one small correction (one sentence of the description about sources) and two format notes carried over, none blocking. One point of merge order is left for the human reviewers.

## C01 — The description says §§2A.6–2A.8 are not taken from a source, but §2A.6 cites one for the failure of the unramified condition

"§2A.6–§2A.8 are not taken from a source; each statement carries a proof sketch." A reader of the description would expect no locator in these sections, yet §2A.6 closes with "Kings–Loeffler–Zerbes (arXiv v6), Remark 11.2.5, p. 55 (arXiv v6), for the failure in (d)" (line 1370), and §2A.8 cites the same remark and the paragraph after (11.2.2a)–(11.2.2b) to say what that paper does and does not state (line 1556). The sentence would be right as: "§§2A.6–2A.8 are not taken from a source, apart from the failure of the unramified condition in §2A.6 (d), which is Kings–Loeffler–Zerbes, Remark 11.2.5; each statement carries a proof sketch."

## N01 — §2A.7 carries no locator and does not say that it is not taken from a source

Carried from the previous review; the README text of §2A.7 is unchanged. §2A.6 cites Remark 11.2.5 and §2A.8 says what Kings–Loeffler–Zerbes do not state; §2A.7 has neither, so only the description tells a reader that its statements are not from the literature. One clause in the section would settle it.

## N02 — "Dual Selmer module" names two different objects

Carried from the previous review; unchanged. In §2.13 and §2.23a a dual Selmer group is the Selmer group of the dual structure; the title of §2A.7 (and the title of the pull request) uses "the dual Selmer module" for the co-representing module `Q`. "The module co-representing Selmer groups", the phrase the overview already uses, would avoid the clash; the heading can keep its anchor.

## Previous findings

The previous report had no finding (no R01); its other remarks are accounted for here.

- C01 (previous) — repaired: the *Needs:* line of §2.23a (line 896) now lists "ArithmeticGaloisDuality §D7.7.3 (Local conditions and derived orthogonal complements); ArithmeticGaloisDuality §D7.7.4 (Duality for a global mapping fibre with local conditions)", and the contract (line 2970) states the truncation `τ_{≥2}`.
- C02 (previous) — repaired: the description now reads "It gives two conditions under which the termwise tensor product is the derived one", "which §§2A.6–2A.8 cite", and "Left out on purpose: for lattice coefficients or `p = 2`, …".
- N01 (previous) — not repaired: §2A.7 (lines 1396–1485) has no locator and no sentence on its sources; written again as N01.
- N02 (previous) — not repaired: the heading of §2A.7 is still "The dual Selmer module in the lowest degree"; written again as N02.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Contract sentence: truncated product `U(L_v) ⊗ U(L_v^⊥) → τ_{≥2}C_v(μ_{p^∞})` is zero | degrees `≤ 1`, `2`, `≥ 3` | target zero below 2; source zero above 2; degree 2: `inv(a ∪ b) = 0` for `a ∈ L`, `b ∈ L^⊥`, so a coboundary, zero in `C²/B²` | holds; zero homotopy valid | none |
| Contract sentence: untruncated product not nullhomotopic | `M = 𝔽₃` trivial, `F_v = ℚ₇` (`μ₃ ⊂ ℚ₇`); general `p` | `1 ⊗ ζ ↦ ζ ≠ 1` in `C⁰`; `d(1 ⊗ ζ) = 0`, `C^{−1} = 0`, so `(dh + hd)(1 ⊗ ζ) = 0 ≠ ζ` | holds | none |
| §2.23a duality (cites §§D7.7.3–D7.7.4) | `ℚ`, `{p, ∞}`, `𝔽_p`, `L = 0`; degree shift | `H²(RΓ_f(L)) ≅ 𝔽_p`; `Sel_{L^⊥}(μ_p) = ⟨p⟩ ≅ 𝔽_p`; §D7.7.4 pairs `H^i` with `H^{3−i}`: `2 ↔ 1` | consistent with supplier | none |
| §D7.7.3 as cited: adjoint `U_X^+ → RHom(U_Y^−, J)[−2]` | `U_X = U(L_v)`, `U_Y = U(L_v^⊥)` | `H⁰`: `H⁰(M) ↔ H²(M^∨(1))^∨`; `H¹`: `L ↔ (H¹/L^⊥)^∨`; other degrees zero both sides; `Err_v` acyclic | the section's hypotheses are met by the truncated product | none |

The rows for the untouched statements stand as in the previous review, of `494ecd3`.

- Source locator read: 1, `Nekovar2006` §6.2.1.2 (line 5322, printed p. 138 = PDF page 147), which defines the product with the truncation `τ_{≥2}`; 6.2.1.5 (line 5332) is the zero-product case and 6.2.2 (line 5341) calls it the truncated cup product.
- Cross-roadmap citations resolved: ArithmeticGaloisDuality §D7.7.3 and §D7.7.4 on `main` (README lines 5962 and 6008, titles as cited) and at the heads of #3184, #3177 and #3027 (same ids and titles); §D7.3 *Cochain tensor comparison for profinite groups* is still only at the head of #3184.
- Record comparison: no layer or item removed, retitled or renumbered; the change since `494ecd3` extends two existing lines.
- Dependency check: `depcheck: 94 roadmaps, 1063 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing is changed outside the folder.
- Automatic checks: all pass at this head. `lake env lean` on `Suggested.lean` gives six `sorry` warnings and nothing else; the file is unchanged by the pull request.
- Description read against the head sentence by sentence: the five section summaries, the dependency line, the sources list and the "left out" line agree with the README, apart from C01.
- Seeded sample: no seeded target lies in the changed passages or cites them; none was reopened.

Overlap check: read ArithmeticGaloisDuality (main and the heads of #3184, #3177, #3027), EulerSystemsAndKolyvaginSystems (main and #3188), NoncommutativeAndEquivariantIwasawa (main); nothing shared. Derived orthogonality and global mapping-fibre duality are owned by ArithmeticGaloisDuality §§D7.7.3–D7.7.4 and are now cited by id.

Source independence: changed passages only; 1 passage (the contract sentence on the truncated product) compared with 1 source (`Nekovar2006` lines 5322–5342), none shared; largest share in the changed passages `Nekovar2006`, 1 of 1 locators; contents not compared, since no layer is added, removed or reordered.

Research link: the new sections place the classical Selmer structures of Mazur and Rubin (2013) inside Nekovář's Selmer complexes (2006), as Kings, Loeffler and Zerbes (2017, §11.2) do for their Euler-system bounds; the roadmap's own headlines include the Selmer-complex half of Nekovář's parity theorem. Rests on the README overview and `KingsLoefflerZerbes2017` §11.2.

## Not verifiable

- The published version of Kings–Loeffler–Zerbes (Cambridge J. Math. 5, 2017) was not opened; the README says its locators use the arXiv v6 pagination.
- The description's account of how the text was drafted and read (the number of readings and corrections) cannot be checked against the head.

## Source issues

- **Error** in KingsLoefflerZerbes2017 at Definition 11.2.3, p. 54, and the paragraph after it, p. 55 (arXiv v6): the source says a condition is simple when its map is bijective in degree 0, injective in degree 1 and zero in degree 2, and is then determined by its degree-one image; it should be bijective in every degree at most 0 with no cohomology of the condition in degrees at least 2, since adding a module in degree 2 with zero map changes the Selmer complex; affects a stated result.

## For the human reviewers

- Five passages of §§2A.6–2A.8 cite ArithmeticGaloisDuality §D7.3 *Cochain tensor comparison for profinite groups*, which exists only at the head of #3184 (`TauCetiRoadmap/ArithmeticGaloisDuality/README.md` line 5002 there), not on `main`; the description names that order.
