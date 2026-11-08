# GATE-VonNeumannAlgebras~6 — answers to human review at f153571

One unanswered comment (CBirkbeck, 2026-11-05T19:50:18Z, the AI review of f153571 with verdict REJECT). It makes two points: F01 (H01) and F02 (H02). Its "Previous findings" entry R01 is F01 again and is answered under H01. One commit: `32452f4f VonNeumannAlgebras: review repairs (V1.3 amplification locator: Lemma 2.5.5 and the proof of Theorem 2.5.6)`. Not pushed.

## H01 (CBirkbeck) — answered

The finding is correct, and no edit inside `TauCetiRoadmap/VonNeumannAlgebras/` can repair it, so the folder is unchanged on this point. Checked at the new head: `git log -1 origin/main -- TauCetiRoadmap/VonNeumannAlgebras` is `f8dfe0ad` ("Von Neumann algebras, factors and modular theory (#889)", merged 2026-11-05 13:11 UTC); `git merge-tree --write-tree origin/main HEAD` still reports `CONFLICT (add/add)` on both `README.md` and `Suggested.lean`. The repair needs one of two operations on the pull request and its branch: close it, or rebase it onto main and rewrite the folder as a diff against main's README. This job is not allowed to do either, and choosing between them is for the author or maintainers.

Evidence, each item checked against `origin/main` at `3b51055b` (line numbers of this folder are at the new head `32452f4f`):

- Main's `TauCetiRoadmap/VonNeumannAlgebras/README.md` has 4337 lines, with `## Layer 0` to `## Layer 13` at `:275`, `:392`, `:523`, `:905`, `:970`, `:1339`, `:1495`, `:1644`, `:1917`, `:2172`, `:2247`, `:2785`, `:3388`, `:3688`. Main's `Suggested.lean` has 215 lines and 19 top-level `theorem`/`def` declarations in `namespace TauCetiRoadmap.VonNeumannAlgebras` (`:60`). They run from `exists_injective_nondegenerate_representation_lp` (`:71`) to `tomiyama` (`:206`) and include `IsCyclic` (`:110`), `ProjectionEquivalent` (`:127`), `equivalent_of_subequivalent` (`:139`) and `IsFactor` (`:145`). This folder declares the same objects under other names: `IsCyclicVector`, `MurrayVonNeumannEquiv`, `murrayVonNeumannEquiv_of_subequiv`.
- Roadmaps on main cite main's later layers.
  - `git grep -E 'VonNeumannAlgebras[^|]{0,40}V(5|6|7|8|9|10|11|12|13)'` over `TauCetiRoadmap/` (excluding the folder itself) matches 76 lines: FactorRigidity 39, Subfactors 33, TypeAHeckeAlgebras 2, BanachAlgebras 1, NoncommutativeGeometry 1.
  - FreeProbability `README.md:58–61` and OperatorAlgebraDynamics `README.md:46–50` cite V6, V8, V10–V11 and V13a in the bullet that opens with their `VonNeumannAlgebras V0–V4` link.
  - SelfAdjointSpectralTheory `README.md:747` and `:1406` cite `V4.0.Decomposition`.
  - The review counted 41; the difference is only in the regular expression used, and in both counts main's consumers cite sections this folder does not have.
- The gate and the dependency check pass here because they diff against the merge base `350e970c`, which predates `f8dfe0ad`. They cannot see this conflict.
- The review lists four passages of this folder that are absent from main's README. A grep of main's README confirms each is absent:
  - The V1.2 negative control for a unit-ball criterion (`README.md:333–340`). Main has only the phrase "its linear-subspace unit-ball criterion" at `:991`.
  - The V2.5 weight discussion `3⁻ⁿ` against `2⁻ⁿ` (`README.md:633–642`) and its Check (`:706–708`). Main has only "a convergent ternary-weight projection series" at `:753–754`, so this passage elaborates main rather than correcting it.
  - The V3.2 zero-corner clause (`README.md:806–813`) and the identity-inclusion Check (`:834–837`). Main's inclusion paragraph (`:932–937`) defines no entry for a zero corner.
  - The Jones Theorem 4.4.2 attribution (`README.md:810–813`). Main cites no Jones locator for inclusion matrices.

  The V1.3 locator repaired under H02 is a fifth such passage: main's README contains no "Lemma 2.5.5". These are the passages a revision of main's folder would carry over.

## H02 (CBirkbeck) — applied

`README.md:357` "(Peterson, Lemma 2.5.5, pp. 28–29)" → `README.md:357–358` "(Peterson, Lemma 2.5.5 and the proof of Theorem 2.5.6, pp. 28–29)". The paragraph was rewrapped, with no other wording change.

Evidence:

- Lemma 2.5.5 is the one-vector statement: `peterson-notes` line 1035, p. 28; its projection proof is at lines 1039–1044, p. 29.
- The `n`-vector amplification is in the proof of Theorem 2.5.6: lines 1052–1057, p. 29. That proof uses `ξ₁, …, ξ_n`, the diagonal subalgebra `Ã` of `M_n(B(H))` and `x ⊕ ⋯ ⊕ x ∈ Ã''`.

The same defect was searched for across the README. Six other Peterson locators attach a lemma to a proof step, and each lemma states the step it is cited for, on the cited page:

| README line | Locator | `peterson-notes` line | Page |
| --- | --- | --- | --- |
| `:484` | Lemma 2.7.1 | 1200 | 32 |
| `:495` | Lemma 3.1.5 | 1629 | 42 |
| `:534` | Lemma 3.1.8 | 1652 | 43 |
| `:635` | Lemma 2.8.8 (its proof carries the weights `4⁻ᵏ`, line 1524) | 1517 | 38 |
| `:779` | Lemma 3.4.1 and Proposition 3.4.2 | 2053, 2071 | 53 |
| `:919` | Lemma 4.4.1 | 2473 | 63–64 |

No other locator was changed.

## Build

`lake build TauCetiRoadmap.VonNeumannAlgebras.Suggested`: `Build completed successfully (8976 jobs).` The only warnings are seven `declaration uses sorry`, at `Suggested.lean:52`, `:62`, `:71`, `:94`, `:106`, `:114`, `:131`. `Suggested.lean` is unchanged, so the eleven elaborated signatures in `scratch/signatures.md` still hold, with no section binder dropped. No new `#check @name` pass was run, because no declaration changed.

## Gate

`gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (verbatim):

```text
depcheck: 238 roadmaps, 2277 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

## Adversarial pass

The only statement touched is the V1.3 amplification step whose locator changed.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| V1.3: for `x ∈ A''` and `ξ₁, …, ξ_n`, the projection onto `closure Ã(ξ₁ ⊕ ⋯ ⊕ ξ_n)` lies in `Ã'`, so `x ⊕ ⋯ ⊕ x` preserves it | `n = 1`; `A = ℂ·1` on `ℂ²` with `n = 2`, `ξ = (e₁, e₂)`; `A = D` diagonal in `M₂`, `x = e₁₁ ∈ D'' = D`, `ξ = (e₁, e₂)` | `n = 1`: `Ã = A`, which is exactly Lemma 2.5.5. `ℂ·1`, `n = 2`: `Ã(e₁ ⊕ e₂) = ℂ(e₁, e₂)` is 1-dimensional and `x = λ·1` preserves it. `D`: one vector at a time, Lemma 2.5.5 gives `a = 1` (`a e₁ = e₁ = x e₁`) and `a' = 0` (`a' e₂ = 0 = x e₂`), two different approximants. The amplification gives the single `a = e₁₁`, with `(x − a)e₁ = 0` and `(x − a)e₂ = 0`. | The `n`-vector step is not contained in Lemma 2.5.5; it is in the proof of Theorem 2.5.6. The mathematics stands. | Locator only (H02) |

## Ownership

Open pull requests were checked with `roadmaps list` (453 open roadmap pull requests, index of 2026-11-05T20:33:39Z). The only open pull request carrying `VonNeumannAlgebras` is #1041, listed without `(new)`; #889 is no longer open. Main's `TauCetiRoadmap/VonNeumannAlgebras` now owns every object of this folder (H01).

## Sources

`peterson-notes` was fetched through the sources service from the author's Vanderbilt teaching page (licence class `author-page`; cache hash `5a30c5db…`, 124 pages, pdf page = printed page). The folder has no `sources.toml`, and this job may edit only `README.md` and `Suggested.lean`, so no manifest entry was written. No text is missing, and there is no `needs-references.toml`.

## Untrusted text

The comment contains no instruction to run a command or act outside the job. Its "close this pull request" is a recommendation about the pull request, not an action this job takes.
