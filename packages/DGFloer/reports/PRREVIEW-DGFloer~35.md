# Review of DGFloer (pull request #1798 at 62765e6)

**Verdict:** accepted

Incremental re-review of the 25 lines changed since b1d5c48 (all in `TauCetiRoadmap/DGFloer/README.md`, section 5.5: the opening definition at `:1834–1842` and the third Check at `:1877–1883`), with the pull request's title and description read against this head. No finding.

## Previous findings

- R01 — repaired: `:1834–1835` "oriented or taken over `𝔽₂`"; `:1840–1842` "For nonorientable `B` over `ℤ` the notion is that of a class of `H_*(B, ∂B; 𝓕 ⊗ or_B)` … lives over `[B]_or`"; the Check at `:1877–1883` is recomputed below.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 5.5, the definition at `:1834–1840` (oriented, or over `𝔽₂`) | `B = S¹`, `𝓕 = ℤ`; `Dⁿ`; trivial `B × F`; Hopf; the two orientations of a connected `B` | `i_![S¹] = 1`; `H_n(Dⁿ, ∂Dⁿ) → H₀` iso; `i_!([B] × α) = α`; `i_![S³] = [S¹]`, degree `3 − 2 = 1`; reversing the orientation multiplies `i_!` by `−1`, so nonvanishing is unchanged | holds |
| 5.5, the nonorientable clause at `:1840–1842` | `B = ℝP²`, `𝓕 = ℤ`; target of the shriek | `H₂(ℝP²; ℤ) = 0`, `H₂(ℝP²; or_B) = ℤ`, generator `↦ 1`; target `H_{*−n}(𝓕_b) ⊗ (or_B)_b ⊗ (or_B)_b = H_{*−n}(𝓕_b)`, as in the first bullet (`:1856–1857`) | holds |
| 5.5, third Check `:1877–1883` | double cover `S² → ℝP²`, `𝓕 = ℤ[ℤ/2]`, cells `e₀, e₁, e₂` | untwisted: `∂e₂ = (1 + t)e₁`, `ker = ℤ(1 − t)`, top-cell coefficient `(1, −1)`; twisted (`t ↦ −t`): `∂e₂ = (1 − t)e₁`, `ker = ℤ(1 + t)`, image `(1, 1)`; a local orientation flip gives `(−1, 1)` | holds; agrees with the definition (untwisted notion not defined there) and with the 5.3 Check at `:1800–1802` |
| 5.5, fibration sentence and Corollary 2.13 bullet against the narrowed definition | `:1842–1845`; `:1864–1868` ("closed orientable `Y`") | the fibration sentence inherits the standing "oriented or `𝔽₂`"; an orientable `Y` admits an orientation and the notion does not depend on which | holds |
| DGFloerPartII 4.1 (#1799, a660fec), which cites Layer 5 item 5 | `:1345–1347`, `:1390–1391` | "closed connected oriented `n`-manifold `Q`": inside the defined case; no citer uses the notion on a nonorientable base over `ℤ` | resolves |

Rows for the untouched statements stand as in the previous review, of `b1d5c48`.

- Gate, rerun at 62765e6: `gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also records `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/DGFloer/Suggested.lean` (unchanged), rerun: seven `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244), nothing else. The diff changes no Lean statement, so the `#check` comparison and the padding probe were not rerun.
- Outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty; the change since b1d5c48 touches `README.md` only (17 insertions, 8 deletions).
- Source locators checked: 4 in `bdho-cotangent`, for the seeded target 5.5, the only one the diff touches: the standing orientability hypothesis (line 1087, p. 25), Definition 2.3 (lines 1092–1095, p. 26), Example 2.4 (lines 1105–1108), Proposition 2.5 (line 1111). The README flags no locator as unverified.
- Cross-roadmap citations resolved: the 5.5 passage cites AlgebraicTopology Stage 6 (untouched); §4.10 still resolves at #1807 (89357f3, heading at `:2082`, compact generation at `:1976` as §4.8), Stage 4.8 at #1808 (`:113`); DGFloerPartII (#1799) `:1347`, `:1391`, `:1869` cite Layer 5 item 5 and keep resolving. Overlaps: §4.10 is defined only by #1807, which the description's **Merge order** names as the dependency.
- Description read against this head: every sentence of the summary block, **Why**, **What moves …**, **Suggested.lean** and **Merge order** holds; #1807, #1808 and #1799 are open with the contents the text gives them. The change to 5.5 alters nothing the description states.
- Remark, no change requested: the generated `depends-on` and `merge-order` blocks name #1807 as "AdicSpacesPartIII (and 12 other roadmaps)"; AlgebraicTopology is one of the 12.

Overlap check: read AlgebraicTopology (#1807, #1808) and DGFloerPartII (#1799) where the changed passage and its citers touch them; the diff adds no object, so nothing new is shared. The scopes of FukayaTheory, HeegaardFloer and HamiltonianFloerOperations were not read again.

Source independence: changed passages only; 2 passages (the definition opening 5.5, the third Check) compared with 1 source, `bdho-cotangent`, none shared (the definition shares at most 5 consecutive words with lines 1092–1095, which the mathematics forces; the Check has no counterpart in the source); the arrangement was not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- Carried from the previous reports: Weibel 5.5.1(2) and 5.5.10 (1.3); Serre 1951 and 1953 (1.2, 1.4); the texts settled as uncertified (Palais 1960, Hofer–Zehnder, Struwe, Bröcker–tom Dieck, Massey, Whitehead, Hofer–Salamon).

## Source issues

- none

## For the human reviewers

- none
