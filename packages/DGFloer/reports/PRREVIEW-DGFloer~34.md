# Review of DGFloer (pull request #1798 at 62765e6)

**Verdict:** accepted

Incremental re-review of the 25 lines changed since b1d5c48 (all in `TauCetiRoadmap/DGFloer/README.md`, section 5.5: the definition of living over the fundamental class and its third Check), with the pull request's title and description read against this head. No finding.

## Previous findings

- R01 — repaired: `:1834–1835` "oriented or taken over `𝔽₂`"; `:1840–1842` "For nonorientable `B` over `ℤ` the notion is that of a class of `H_*(B, ∂B; 𝓕 ⊗ or_B)` … such a class lives over `[B]_or`"; the Check at `:1877–1883` computes `(1 + t)e₂ ↦ (1, 1)`.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 5.5 definition, oriented or `𝔽₂` base (`:1834–1840`) | `S¹`, `𝓕 = ℤ`; `B` a point; `ℝP²` over `𝔽₂`, `F` a point; `S² → ℝP²` over `𝔽₂` | `i_![S¹] = 1`; `n = 0`: `i_! = id`; `[ℝP²]₂ ↦ 1`; `(1 + t)e₂ ↦ (1, 1)`, twisted and untwisted agreeing mod 2 | holds |
| 5.5 definition, nonorientable over `ℤ`, twisted (`:1840–1842`) | `ℝP²`, `F` a point; Möbius band `M` rel `∂M` | `ℤ^w`: `∂e₂ = 1 + w(t) = 0`, `∂e₁ = −2`, `H₂ = ℤ`, `[ℝP²]_or ↦ 1`; `H₂(M, ∂M; ℤ) ≅ H⁰(M; or) = 0`, `H₂(M, ∂M; or) ≅ H⁰(M) = ℤ ↦ 1` | holds, boundary case included |
| 5.5 third Check (`:1877–1883`) | `S² → ℝP²`, `C₀(F) = ℤ[ℤ/2]` | untwisted `∂e₂ = (1 + t)e₁`, `ker = ℤ(1 − t)`, image `(1, −1)`; twisted `∂e₂ = (1 − t)e₁`, `(1 − t)(1 + t) = 0`, `ker = ℤ(1 + t)`, image `(1, 1)`; both `H₂ ≅ H₂(S²) = ℤ` | holds; agrees with the definition and the first bullet `:1853–1857` |
| Wrong model: untwisted non-vanishing on a nonorientable base over `ℤ` | the same double cover | untwisted image `±(1, −1)`, sign set by the local orientation chosen at `b`, while `H₂(ℝP²; ℤ) = 0` | excluded by the definition's twist |
| Consumer 10.2, cotangent form of Proposition 6.7 (`:4079–4081`, untwisted `α`, `j_!α ∈ H_{*−n}(𝓕 ⊗ or_Q)`) | `Q = ℝP²`, `𝓕 = ℤ^w` | `α = [ℝP²]_or ∈ H₂(Q; ℤ^w) ↦ 1 ∈ H₀(ℤ^w ⊗ ℤ^w) = ℤ`; equals 5.5's twisted notion for `𝓖 = 𝓕 ⊗ or_Q`, as `or ⊗ or ≅ ℤ` | consistent |
| Consumer DGFloerPartII 4.1 and Proposition 6.15 (#1799 `:1344–1347`, `:1390–1391`) | closed connected oriented `Q` | "lives over" used only on oriented `Q`, inside the definition's oriented case; Corollary 2.13 bullet keeps "closed orientable `Y`" | resolves |

Rows for the untouched statements stand as in the previous review, of `b1d5c48`.

- Gate, rerun at 62765e6: `gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also records `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/DGFloer/Suggested.lean` (unchanged since 594f234), rerun: seven `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244), nothing else. The diff changes no Lean statement, so the `#check` comparison and the padding probe were not rerun.
- Outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty; `git diff b1d5c48..HEAD` touches `README.md` only (17 insertions, 8 deletions).
- Source locators checked: 4 in `bdho-cotangent`: Definition 2.3 (lines 1092–1095, p. 26), the standing orientability hypothesis (line 1087, p. 25), Example 2.4 (lines 1105–1108), Proposition 6.7 (lines 4429–4432, for consumer 10.2). The README flags no locator as unverified; of the seeded targets only 5.5 lies in the changed passages.
- Cross-roadmap citations resolved: AlgebraicTopology at #1807 (89357f3): §4.8 `:1976`, §4.10 `:2082`, 5.0 `:2162`, 5.5 `:2367`, 8.8c `:4344`, 8.8d `:4439`; at #1808 (705e4f6): Stage 4.8, CW approximation, `:113`; DGFloerPartII at #1799 (a660fec) `:1347`, `:1391`, `:1869` cite Layer 5 item 5 and resolve.
- Description read against this head: no sentence concerns 5.5, and the change adds, drops or renumbers nothing it states; #1807, #1808 and #1799 are open, with the contents the text gives them.
- Remark, no change requested: the generated `depends-on` and `merge-order` blocks name #1807 as "AdicSpacesPartIII (and 12 other roadmaps)"; AlgebraicTopology is one of the 12.

Overlap check: read AlgebraicTopology (#1807, #1808) and DGFloerPartII (#1799) where the changed passage and its citers touch them; the diff adds no object, so nothing new is shared. The scopes of FukayaTheory, HeegaardFloer and HamiltonianFloerOperations were not read again.

Source independence: changed passages only; 4 passages (the orientation clause and the nonorientable sentence of the 5.5 definition, the two sentences of the third Check) compared with 1 source, `bdho-cotangent` lines 1087–1108, none shared (at most "the fundamental class of", 4 words the mathematics forces; the source has no `ℝP²` example in its §2.4); the arrangement was not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- Carried from the previous reports: Weibel 5.5.1(2) and 5.5.10 (1.3); Serre 1951 and 1953 (1.2, 1.4); the texts settled as uncertified (Palais 1960, Hofer–Zehnder, Struwe, Bröcker–tom Dieck, Massey, Whitehead, Hofer–Salamon).

## Source issues

- none

## For the human reviewers

- none
