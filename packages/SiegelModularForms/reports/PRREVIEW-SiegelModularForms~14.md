# Review of SiegelModularForms (pull request #1714 at bee9025)

**Verdict:** accepted

An incremental re-review of 2 changed lines since `8723e79` (one sentence of *Downstream consumers*, `TauCetiRoadmap/SiegelModularForms/README.md:3507`), and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads "It builds the Siegel side the half-integral weight roadmap leaves to it (…) on that roadmap’s classical Jacobi forms, and owns the higher-degree theta series the lattice-packings roadmap leaves to it."

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `README.md:3507` (changed): the half-integral weight sibling "names this roadmap for" 9.1, 4.2 and 9.2, 9.3–9.5, 9.6; the clause that it "reads the dimension values … of 9.2" is gone | `HalfIntegralWeightModularForms/README.md` at `d7e7ece5` | `:188–191` names Fourier–Jacobi, Maass lift, Saito–Kurokawa, Gritsenko, and `E_{k,1}` in 9.2; `:1717`, `:1934` take the dimensions "from the formula of 6.3", its own | Pass: the removed clause was the wrong direction; the kept sentence matches the sibling |
| 9.2 (cited by the changed line; seeded sample): `dim J_{k,1} = dim M_{2k−2}(SL₂(ℤ))`, even `k ≥ 4`, consumed from the sibling's 6.3 | `k = 4, 6, 8, 10, 12`; boundary `k = 2` | `dim M₆ = M₁₀ = M₁₄ = 1` (`14 ≡ 2 mod 12`: `⌊14/12⌋ = 1`); `dim M₁₈ = dim M₂₂ = 2`; `k = 2`: `dim M₂ = 0`, outside the stated range | Pass; `README.md:2748–2750` agrees and attributes the count to the sibling |
| 9.2 Checks against 4.2/9.3: `240·c(3)`, `240·c(4)` for `E_{4,1}` | `c(3) = 56`, `c(4) = 126` | `240·56 = 13440`, `240·126 = 30240`; the sibling's `:1931–1932` gives the same `c(N) = 1, 56, 126` at `N = 0, 3, 4` | Pass |
| Description: "12 layers and 66 milestones" | headings at the head | `## Layer` headings: 12; `### k.n` headings: 66 | Pass |
| Description, "Why Tau Ceti wants it" (R01's sentence) | supplier contracts `README.md:447–463`; `LatticePackingsAndPerfectForms/README.md:167` at `5efad728` | this roadmap consumes the sibling's 6.1–6.4 and 5.6; degree-`g` theta series "is `SiegelModularForms`'" there | Pass |

Rows for the roadmap's other statements stand as in the previous review, of `8723e79`: the diff changes no statement.

- **Source locators (2, for 9.2):** Eichler–Zagier Theorem 2.2 (`ez1983` line 718, the dependence of `c(n, r)` on `4nm − r²`) and Theorem 5.1 (`ez1983` line 1970, the theta decomposition) are where 9.2 cites them. The other 14 sampled targets do not fall in or cite the changed sentence and were not re-read.
- **Cross-roadmap citations resolved (2):** `HalfIntegralWeightModularForms` at `d7e7ece5` (`:188–191`, `:1639`, `:1947`) and `LatticePackingsAndPerfectForms` at `5efad728` (`:167`); section numbers 4.2, 9.1–9.6 and Layer 5 exist at this head (`README.md:1299`, `:2704–2906`).
- **Pull request text:** title and description read sentence by sentence against the head; none contradicted, and the 2-line change alters nothing they describe. They say the pull request adds a roadmap; the folder is not on main. `metadata.toml` has `topic = "math.NT"`.
- **Gate** (worker's, on this head): every check `0`, `build=0`, `OK`.
- **Dependency check** (candidate order, `--movable`, main, this pull request): `depcheck: 234 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits `0` with 72 `declaration uses sorry` warnings and nothing else; the file is unchanged since `8723e79`, so the signature and one-tactic probes of the earlier reviews stand.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SiegelModularForms'` prints nothing.
- **Overlaps** (`scratch/overlaps.md`): no other open pull request changes this roadmap; no cited id dropped; no id defined only by an open revision; no second copy on main.

Overlap check: read HalfIntegralWeightModularForms and LatticePackingsAndPerfectForms at their open heads where they name this roadmap (Jacobi carrier, `V_l` and the dimension formula: HalfIntegralWeightModularForms; degree-`g` theta series: this roadmap; degree-one harmonic theta series: LatticePackingsAndPerfectForms); the other listed roadmaps were not re-read, the changed sentence naming none of them.

Source independence: changed passages only: 1 passage compared with 1 source (`ez1983`, at the two locators of 9.2), none shared; the changed sentence cites no source; the arrangement was not compared again, no layer having been added, removed or reordered.

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" (description): a statement about other pull requests, not checked against this head.
- The uncertified and waived works, the Project Euclid stubs and the LMFDB knowls listed by the earlier reports for unchanged text: not opened this round.

## Source issues

- none

## For the human reviewers

- The worker's source listing gives three uncertified keys the titles of unrelated works (`mizumoto1991`, `arakawa1983`, `satoh1986`: an article on Teichmüller spaces, one on the integer 5906, one on an exotic 4-manifold); the README's own references are unaffected (D01).
