# Review of IgusaVarietiesAndTorsionConcentration (pull request #1090 at d692c6f)

**Verdict:** accepted

Incremental re-review of the 92 lines changed in `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/` since `5447ef6`, and of the pull request's title and description against this head. No finding. Line numbers of other roadmaps refer to their README on main or at the open head printed by `roadmaps show`.

## Previous findings

- R01 — repaired: "BunGAndNewtonStrata (the flag Newton stratification of 3.4–3.5, the unitary similitude datum of 0.3, the Newton stratification of 0.12, and the central-leaf and Igusa dimensions of 0.25 and 1.4a)".
- R02 — repaired: "The Lean file declares nothing: no headline theorem is statable …"; "the targeted Lake build succeeds and reports no `sorry`"; the summary block no longer names the Mazur converse.
- R03 — repaired: 3.0g "*Needs:* 3.0a–3.0c, 3.0e; …"; 3.6 "*Needs:* Layer 0; 3.0a–3.0b, 3.1–3.5; …"; new 3.6a "*Needs:* 0.27, 3.0b, 3.0g, 3.6; …"; 3.26 cites 3.6a.
- R04 — repaired: "### 0.8a Quotients by sub-`p`-divisible groups" in Layer 0, cited by 0.13, 2.6 and 2.11; the supplier-contract paragraph is the pointer "Owned here as 0.8a, which consumes …".
- R05 — repaired: 2.10 "Assume `p` unramified in `F`", with the similitude computation on `J`; 2.16 "affine for every `X` in the class, at every `p` unramified in `F`".
- R06 — repaired: 7.9 "For `D = F`, statement `(1)` is the exact supercuspidal support … that SmoothRepresentationsOfLocalGroups SR.5.2 (*integral-blocks*) classifies; it is not proved again"; SR.5.2 is in the Needs line.
- R07 — repaired: "local-term calculations in §§5.3–5.4, pp.49–52".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 2.10, similitude `J(ℚ_p) → ℚ_p^×` onto (changed) | split place; inert, slopes `λ ≠ 1 − λ`; inert slope `1/2`, `⟨a, b⟩` with `v(b/a)` odd and even; `n = 1` basic at inert `p`; ordinary `b` | Dual pair `(1, c)`: factor `c`. Odd: `b = pa·N(z)`. Even: `⟨a, a⟩ ≅ a⟨1, −1⟩` represents `pa`; determinant gives second entry `b/p ≡ pb`. Slope-`1/2` rank `2n − 2·Σ` even; `n = 1`: rank 2. Ordinary: biconnected part zero | holds at every unramified `p`, `p = 2` included |
| 2.10, outer parts (changed) | `O_F ⊗ ℤ_p` product of unramified DVRs; `f` on étale part, `(f^∨)⁻¹` on multiplicative part | lattices in isomorphic modules are free of equal ranks factor by factor; pairing of `(f^∨)⁻¹x` with `fy` equals that of `x` with `y`: factor `1` | agrees |
| 2.16 (changed) | fundamental `X_w`; arbitrary `X`, `p` inert in `F₀` | 2.14 + 2.13 for `X_w`; 2.10 now supplies the multiplier-`1` map at inert `p`, 2.11 and 2.15 unchanged; matches csnc Theorem 3.3.2 (every `X`, `p` unramified) | agrees |
| 3.0g ↔ 3.6 ↔ 3.6a build order (changed) | Needs lines 1430, 1570, 1582 with line 104's convention | 3.0g ∌ 3.6; 3.6 ∋ 3.0a–3.0b, 3.1–3.5 only; 3.0a–3.0b need 0.11, 0.27, suppliers; 3.6a after both | no cycle |
| 3.6a (new section) | sw-berkeley Theorem 24.2.5, Proposition 24.3.4, Corollary 24.3.5; hypotheses at lines 8775, 7841–7847 | printed pages 227, 230, 231 (lines 8658, 8791, 8802); source needs `G` connected with parahoric model, `b ∈ B(G, μ⁻¹)`, admits `p = 2` for unramified data; types (A), (C) connected | agrees |
| 3.0g source range (changed) | sw-berkeley §23.4, §23.5, Lecture 24 | §23.4 at line 8438 (p. 220), §23.5 at line 8530 (p. 223), Lecture 24 opens p. 225 | "pp.220–224" agrees |
| 0.8a (moved) | `H = 0`; `H = G`; `μ_{p^∞} ⊂ μ_{p^∞} ⊕ ℚ_p/ℤ_p`; `μ_p ⊂ μ_{p^∞}` | heights `h = 0 + h`, `h = h + 0`, `2 = 1 + 1`; rank `Q_r = p^{r(2−1)} = p^r = #ℤ/p^r`; `μ_p` not `p`-divisible, quotient height 1 | agrees; text identical to the former paragraph |
| 7.9 with SR.5.2 (changed) | `D = F`, `m = 1`; SmoothRepresentationsOfLocalGroups README on main, lines 4239–4257 | characters of `F^×` are their own support; *integral-blocks* classifies exact supercuspidal supports of simple `k[GL_n(F)]`-modules, normalized induction, `ℓ ≠ p`; no lifting statement there | citation resolves; `(2)` has no second owner |
| 7.9b locator (changed) | hkw21 §§5.3–5.5 | pages 49, 51, 52 as computed in the review of `5447ef6` | agrees |
| Downstream consumers (changed) | BunGAndNewtonStrata contract at #1241, line 84 | consumes §§3.4, 3.5, 0.3, 0.12, 0.25, 1.4a; headings 0.3, 0.12, 0.25, 1.4a, 3.4, 3.5 exist at lines 180, 456, 694, 870, 1522, 1548 | agrees |
| Pins (changed) | `lake-manifest.json` | Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`; README line 48 and the Lean docstring say `1b1ccf4`, `2fd255d` | agrees |

Rows for untouched statements stand as in the previous review, of `5447ef6`.

- Gate at `d692c6f`: every check 0, OK (rerun; the worker's run includes build=0). `lake env lean` on `Suggested.lean`: exit 0, no output; the file declares nothing, so there is no signature to compare and no padding probe to run. No file changed outside the folder.
- Dependency check: `depcheck: 246 roadmaps, 2269 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Source locators checked against the text: 6 in sw-berkeley (Theorem 23.1.4 … Proposition 23.3.3 on pp. 217–220, §§23.4–23.5, Theorem 24.2.5, Proposition 24.3.4, Corollary 24.3.5). Cross-roadmap citations resolved: SmoothRepresentationsOfLocalGroups SR.5.2 on main (`1a19c9f`); BunGAndNewtonStrata at #1241. `roadmaps grep` finds no other roadmap citing 3.0g, 3.6a, 0.8a, 2.10, 2.16 or the former quotient paragraph.
- Seeded sample: none of its fifteen targets lies in a changed passage; 2.14 is cited by the changed 2.16 and is used there as stated.
- Title and description against the head: new roadmap of three files (2702 added lines, nothing removed); the Lean declares nothing; two routes with `F⁺ ≠ ℚ` and length at most two on the trace-formula route (README lines 2310, 2381); non-quasi-split `J_b` at a completely split prime (line 2538); types (A) and (C) with `p = 2`; consumers as in Downstream consumers. No sentence is contradicted and no change is left unstated.
- The worker's citation lead (README line 2109, "IntegralHeckeAndGaloisDeterminants Layer 3") is a false positive: the line reads "Layer 3a", which exists at #1689.
- Overlap check: read HeckeStacksAndLocalShtukas, BunGAndNewtonStrata, SmoothRepresentationsOfLocalGroups; shared: exact supercuspidal support for `GL_n(F)`, owner SmoothRepresentationsOfLocalGroups SR.5.2, now cited by 7.9; the local PEL data 0.11 and Rapoport–Zink spaces 0.27, owner this roadmap, cited by HeckeStacksAndLocalShtukas.
- Source independence: changed passages only; 5 passages compared with 2 sources (sw-berkeley, csnc), none shared (longest common run 3 words, in 3.6a against sw-berkeley line 8804); the proof sketch of 2.10 is the roadmap's own argument; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

- The items of the earlier reviews (ls18a published and erratum, oz02 Documenta pagination, lil22 published pagination, rsz20 display numbers) are untouched by this change and were not reopened.
- The description's generated `depends-on` and `merge-order` blocks are outside the check of the text.

## Source issues

- none

## For the human reviewers

- none
