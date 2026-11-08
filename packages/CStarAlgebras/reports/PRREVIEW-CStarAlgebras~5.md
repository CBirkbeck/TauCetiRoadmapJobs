# Review of CStarAlgebras (pull request #860 at 33ddcef)

**Verdict:** accepted

Incremental re-review of the 9 lines changed since 37316ab (all in the README, §3.2 and its
reference entry; nothing in `Suggested.lean`, nothing outside the folder). The single finding of
the previous review is repaired, the repair introduced no new problem, the gate passes with the
candidate merge order, the elaboration is clean, and the dependency check reports no problem.
No finding remains, new or carried.

## Previous findings

- R01 — repaired: line 928–931 "Smith's lemma: a map `u : E → M_n` has `‖u‖_cb = ‖u_n‖` (Smith
  1983, Theorem 2.10), by compressing the test vectors … the compression uses only the matrix
  norms of `E`, so the lemma holds for every operator space `E`, complete or not"; line 2013
  "Theorem 2.10 (Smith's lemma), cited in §3.2". Both halves of the repair (the item number and
  the generality clause) are present and correct, below.

## Verified sound

**Gate at 33ddcef.** The worker's gate: every check 0, `build=0`, OK. Re-run from the worktree
with the brief's command: every text check 0, `stray-files=0`, `outside-folder=0`, `dirty=0`;
its `depcheck` line reads `NOT IN ORDER: CStarAlgebras (insert it after its last supplier)`,
which is the main-branch merge order not listing this new roadmap, not a defect (the brief:
"not in the merge order" is never a finding before intake). With the candidate order the check
is clean:

```
depcheck: 235 roadmaps, 2180 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the candidate order lists VonNeumannAlgebras at line 5,
CStarAlgebras at line 6, HilbertModules at line 12. `git diff --stat origin/main...HEAD`
outside the folder: empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.
`git diff 37316abc..HEAD -- TauCetiRoadmap/CStarAlgebras/Suggested.lean`: empty.

**Elaboration.** `lake env lean TauCetiRoadmap/CStarAlgebras/Suggested.lean` from the worktree:
exit 0 in 10 s, nineteen "declaration uses `sorry`" warnings at lines 53, 60, 69, 78, 87, 110,
117, 139, 152, 159, 165, 173, 191, 209, 231, 261, 293, 326, 347, nothing else. Since the Lean
file is byte-identical to the one the previous two reports read, their signature comparison
(26 declarations against their README statements; the two leads `directSumOperator` and
`conjugate` without `[CompleteSpace]` are `def`s whose types do not need it, and
`voiculescu_weyl_von_neumann` carries it) and their one-tactic probe (all nineteen theorems fail
`first | rfl | simp | infer_instance | exact?`) carry forward; the worker's `signatures.md` at
this head flags the same two leads and nothing else. The README's only Lean name in the changed
passage, `IsCompletelyBounded` (line 930), is declared at `Suggested.lean` line 134 (a `def`
with a real body), and the gate's `readme-ids-missing=0` confirms every backticked name.

**The changed passage against its sources and the roadmap's own definitions.**

- The locator. Smith 1983 is paywalled and settled as uncertified, so its text was not read.
  The theorem number is corroborated by a legal secondary text: C. Eckhardt, *On OL∞ structure
  of nuclear, quasidiagonal C*-algebras*, arXiv:0809.3227 (J. Funct. Anal. 258 (2010)), proof
  of its Lemma 2.3, cites "[14, Theorem 2.10]" for "every bounded map ψ from an operator space
  into `M_n` is completely bounded with `‖ψ^(n)‖ = ‖ψ‖_cb`", with [14] = R. R. Smith, J. London
  Math. Soc. (2) 27 (1983), 157–166. That is the statement at the README's generality (operator
  spaces, not only C*-algebra domains), under the item number the README now cites. The manifest
  `sources.toml` still records `smith1983` with scheme `page`, locator `157–166`; the manifest is
  not a file of this pull request and the page range is not wrong, so this is a remark for the
  worker, not a finding: narrowing it to scheme `theorem`, "Theorem 2.10" would match the README.
- The generality clause. §3.1 (lines 886–889) defines an abstract operator space by Ruan's two
  axioms with rectangular levels, `‖x ⊕ y‖ = max(‖x‖, ‖y‖)` and `‖αxβ‖ ≤ ‖α‖‖x‖‖β‖` for scalar
  matrices `α, β`, with no completeness. The compression argument uses exactly the second axiom
  for rectangular scalar matrices (`β* x α ∈ M_n(E)` for `x ∈ M_m(E)`, `α, β : ℂ^n → ℂ^m`
  isometries), so "the compression uses only the matrix norms of `E`" and "complete or not" are
  consistent with the roadmap's own definition and with the §3.2 sentence "Keep incomplete
  operator spaces in the construction". The clause also agrees with the Check at line 941
  (`n = 1`: `‖u‖_cb = ‖u‖` for a bounded functional on any operator space) and with the Check
  at line 943 (`CB(ℂ, F) → F` an isometry for every operator space `F`, complete or not).

**Adversarial table** (values computed on each side; rows marked (r4) carry the previous
report's values for statements this diff leaves untouched, re-read at this head).

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| §3.2 Smith's lemma, operator-space form (changed) | `u : E → M_n`, `x ∈ M_m(E)` with `‖x‖ ≤ 1`, unit `ξ, η ∈ ℂ^m ⊗ ℂ^n`; `n = 0`; `E = c₀₀` (incomplete, minimal structure), `u` a functional; transpose `M_2 → M_2` at level `m = 4` | `ξ = Σ_j ξ_j ⊗ e_j` with `ξ_j ∈ ℂ^m` spanning `V`, `dim V ≤ n`; isometry `α : ℂ^n → ℂ^m` onto a space containing `V` gives `ξ = (α ⊗ 1)ξ'`, `‖ξ'‖ = 1`; likewise `η = (β ⊗ 1)η'`; `⟨u_m(x)ξ, η⟩ = ⟨u_n(β* x α)ξ', η'⟩` and `‖β* x α‖ ≤ ‖β*‖‖x‖‖α‖ = ‖x‖` by the second Ruan axiom (rectangular, §3.1 line 887), so `‖u_m‖ ≤ ‖u_n‖` for every `m ≥ n`, and `‖u_n‖ ≤ ‖u‖_cb` trivially; no completeness of `E` enters; `n = 0`: `M_0 = 0`, `u = 0`, both sides `0`; `c₀₀`: `‖u‖_cb = ‖u‖` (the `n = 1` Check), and the sup norm on `c₀₀` is not complete, so the "complete or not" clause has a witness; transpose: level `2` already gives `2`, level `4` gives `2` again | holds at the README's generality; Eckhardt cites it at this generality to Smith, Theorem 2.10 | none |
| §3.2 reference entry (changed) | the entry at line 2012–2013 | journal, volume, pages and DOI unchanged from the previous head; item "Theorem 2.10" added; "cited in §3.2" matches the one citing section (grep: lines 928 and 941 only) | consistent | none |
| (r4) §3.2 transpose Check | transpose on `M_n`, `n ≥ 1` | `‖u‖ = 1`, `‖u_n‖ = n` (the flip `[E_ji]` of norm `1` maps to `n` times a rank-one projection) | holds | none |
| (r4) §3.2 `CB(ℂ, F) ≅ F` Check | `F` any operator space; `F = c₀₀` | `u ↦ u(1)` isometric since `M_k(CB(ℂ, F)) = CB(ℂ, M_k(F))` and a map from `ℂ` is determined by `u(1)`; `CB(ℂ, c₀₀) ≅ c₀₀` incomplete | holds | none |
| (r4) every other row of the previous reports (§§1.1–1.8, 2.1–2.10, 3.1, 3.3, 4.1–4.4, 5.1–5.5, 6.1–6.3, 7.1–7.4, 8.1–8.4, 9.1–9.7) | as in the previous reports | as in the previous reports | holds | none |

**Ownership and duplication.** The diff adds no object and no citation of another roadmap; the
previous reports' search by object (Stinespring, Kadison transitivity, quasidiagonality,
Choi–Effros, Voiculescu, multipliers, Pedersen ideal, Haagerup tensor product, Dauns–Hofmann,
Grothendieck inequality, Wittstock, Ruan, open projections, maximal tensor norm, completely
bounded maps) stands. The worker's citation resolver finds no cross-roadmap citation nowhere;
its two Lean-name leads (`C1.CommutativeMultiplierMorphisms`, `C2.AnnHull`) are the README's own
target labels in its scope table, resolved in the previous reports.

**Seeded sample.** Of the fifteen seeded targets (1.7, 2.1, 2.6, 3.2, 4.1, 5.4, 6.1, 6.2, 6.5,
7.1, 7.2, 9.1, 9.4, 9.5, 9.7), the diff touches only 3.2, checked above. The other fourteen are
unchanged since the previous reports, whose locator checks (`blackadar` II.4.2–II.4.3,
II.5.3.3, II.5.3.13, II.6.5.10–15, II.7.3.6, II.9.4.6, II.9.6.6, III.5.2.5–11, IV.3.1, IV.3.2.4,
IV.3.4.2–21, II.8.4.29, V.4.1–V.4.2; `pisier-gt` 7.1, 12.3–12.9, 13.3–13.10; `ozawa2004`
2.2–3.17; `stinespring1955` Theorems 1 and 4; `phillips1940` Lemma 3.3; `dadarlat2001`
Definition 2.4, Propositions 2.1–2.5, Theorem 2.6, Lemma 3.1, §4) carry forward.

## Not verifiable

- Smith 1983, Theorem 2.10 (paywalled, settled as uncertified): cited by locator; the item
  number is corroborated by Eckhardt, arXiv:0809.3227, proof of Lemma 2.3, not by Smith's text.
- The other uncertified texts of the previous reports (Pedersen 1979, Effros–Haagerup 1985, Ruan,
  Blecher–Paulsen, Wittstock, Paulsen, Arveson, Haagerup 1983 and 1985, Choi, Kirchberg,
  Dadarlat 1999, Runde, Takesaki, Pisier LNM, Connes, Lance, Effros–Lance): unchanged by this
  diff.

## Source issues

- none
