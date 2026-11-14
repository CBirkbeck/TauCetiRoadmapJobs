# FIX-DESIGN-FinitenessAndDualityOfGroups~13

Review settled: `REV-DESIGN-FinitenessAndDualityOfGroups~12`. It has one finding, F01 (P3), about the
source manifest. The finding was verified and applied as asked. The same check was then run on every
source, which found further gaps of the same kind; those were repaired too. No theorem, hypothesis,
definition, Check or dependency changed.

Files changed:
- `packages/FinitenessAndDualityOfGroups/sources.toml` (locators and `cited_for` only; no new work,
  no key, status, hash or access field touched)
- `packages/FinitenessAndDualityOfGroups/design/plan.json` (five `locator.where` strings)
- `packages/FinitenessAndDualityOfGroups/design/README.md` (two citations: §2.8 and §7.5)

The review's "For the human reviewers" section lists no finding, and nothing was changed because of
it. Its "Source issues" section reports misprints in the sources; these are not findings. The one
that touches a stated result (BieriEckmann1973 Proposition 5.1 omits "nontrivial") is already handled
in README §1.8, which treats rank zero separately.

## F01 (P3) — applied

Verified against the cached texts:
- **Brown1974 §1 Lemma.** Wall's finiteness lemma is at Brown1974 lines 136–164, printed pp. 231–232.
  README §8.1 cites it, but the manifest locator listed only Theorem 1, Theorem 1′ and Swan's
  theorem.
- **Brown1974 §5 Proposition 4.** It is at Brown1974 lines 558–563, printed p. 242. README §8.9 and
  plan target 8.7 cite it, but the manifest listed only §5 Proposition 2.
- **BieriEckmann1973 sequence (5.1).** It is in §5.2 at BieriEckmann1973 line 662, printed p. 120
  (line 657). README §1.4 cites it; it was absent from the locator.
- **Serre1971Bourbaki for 1.2.** README §1.2 cites Serre1971Bourbaki 1.2, lines 55–58 (type FL).
  Section "1.2" was missing from `cited_for`.

Old → new, as asked:
- **Brown1974.** "§1 Theorem 1, …" became "§1 Lemma (Wall's finiteness lemma, lines 136-164),
  Theorem 1, …". "§5 Proposition 2" became "§5 Propositions 2 and 4 (Proposition 4 at p. 242,
  lines 558-563)".
- **BieriEckmann1973.** The locator gains "; §5.2, sequence (5.1), p. 120".
- **Serre1971Bourbaki.** `cited_for` gains "1.2".

**The same pattern elsewhere.** Every source key was compared in three places: the README sections
that cite it, the per-target locators in `plan.json`, and the manifest's `locator` and `cited_for`.
This found and repaired the following:

- **Brown1974, manifest.**
  - Appendix A Lemma 1 (lines 1295–1302), cited in §7.5, was missing from the locator; added.
  - The §3 Example (arithmetic groups, lines 371–379), cited in Layer 4 Examples, was missing; added.
    "Layer 4 Examples" was added to `cited_for`.
  - The Scope non-goals cite §6 Corollaries 2–3 of Theorem 5 and Theorem 6, §7, and Appendix B
    (Proposition 11, line 1362). These are now in the locator, and "Scope and ownership" is in
    `cited_for`.
- **BieriEckmann1973, manifest.**
  - The Conventions cite lines 122–124, the module conventions after Definition 1.1. The locator now
    reads "Definition 1.1 with the conventions … (lines 116-135)", and "Conventions" was added to
    `cited_for`.
  - §0.1, line 61 (2.7) and §1.2, line 155 (2.1) are now named in the locator.
- **Brown1975, manifest.** The proof of Theorem 2 (lines 147–157), cited in §1.5, is now named.
- **README §7.5.** "Brown1974 Lemma 1" was ambiguous, because Brown1974 also has a Lemma 1 in §9.3
  (line 1113). It now reads "Brown1974 Appendix A, Lemma 1, lines 1295–1302".
- **`plan.json` against the README.**
  - The locator of target 1.2 lacked Serre1971Bourbaki 1.2 and BrownGTM87 §VIII.6; both added.
  - Target 1.7 lacked BrownGTM87 §VIII.5, and target 3.2 lacked BrownGTM87 §VIII.3; both added.
  - Target 7.5 lacked Appendix A Lemma 1, and target 8.9 lacked Proposition 4; both added.
- **README §2.8.** `plan.json` and the manifest cited Serre1971Bourbaki 1.1, lines 40–42, for §2.8,
  but the README section cited no source. The README now cites it for the discrete invariant `cd_ℤ`
  and says the comparison is the argument that follows. The statement itself is unchanged.

After the edits, a script compared each source key across the README sections, the `plan.json`
locators and the manifest's `cited_for`. All eleven keys agree in all three places; there are no
missing or extra entries.

## Adversarial pass (changed text)

No mathematical statement changed. The table covers the two README citations whose wording changed.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §2.8: `cd_ℤ` of 2.1 (least `n` with `Hᵏ(G, M) = 0` for all `M` and all `k > n`) against Serre1971Bourbaki 1.1's definition (supremum of the `q` with `H^q(G, M) ≠ 0` for some `M`) | `G = 1`; `G = ℤ`; `G = C₂`; `G = ℤ²` | `1`: `H⁰(1, ℤ) = ℤ`, nothing above degree 0, so both give `0`. `ℤ`: `H¹(ℤ, ℤ) = ℤ` and `H^{≥2} = 0`, so both give `1`. `C₂`: `H^{2k}(C₂, ℤ) = ℤ/2` for every `k ≥ 1`, so both give `⊤`. `ℤ²`: `H²(ℤ², ℤ) = ℤ`, so both give `2`. Serre's supremum is never over an empty set, since `H⁰(G, ℤ) = ℤ ≠ 0`. | The two definitions agree. The §2.8 Checks (`ℤⁿ`: `n = n`; nontrivial finite `G`: `⊤ = ⊤`; `G = 1`: `0 = 0`) are unchanged. | Citation added |
| §7.5: Brown1974 Appendix A Lemma 1 (`Γ' ◁ Γ` of finite index, `R` commutative, `P` finitely generated projective over `ℤΓ`, `V` finitely generated projective over `R`; then `Hom_{ℤΓ'}(P, V)` is finitely generated projective over `R[Γ/Γ']`) applied to the lattice `L` over the local ring `A` | `P = ℤΓ`, `Γ' = Γ`, `V = K` trivial; `P = ℤΓ`, `Γ = Γ' × C₂`, `V = K²` | The lattice is `L = Aⁿ` for the generators' matrices, which have entries in `A`. It is free, so the lemma's hypothesis holds. First case: `Hom_{ℤΓ}(ℤΓ, A) = A`, free of rank 1 over `A[1] = A`, and `r(P) · dim V = 1 · 1`. Second case: `Hom_{ℤΓ'}(ℤΓ, A²)` is induced, `A[C₂]²`, of `A`-rank `4 = 2 · 2`; free rank `2 = r(P) · dim V`. | Hypotheses met at the generality of §7.5. | Locator made exact |

## Checks run

**Dependency check.** Output of
`tauceti-roadmap … gate --candidate packages/FinitenessAndDualityOfGroups/design/README.md --only FinitenessAndDualityOfGroups …`:

```text
candidate: FinitenessAndDualityOfGroups is not in the merge order yet; checked as if placed after CohomologyOfGroups (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2201 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The roadmap is not in the merge order yet, which is expected at
the design stage.

**Other checks.**
- **Parsing.** `plan.json` parses as JSON. `sources.toml` parses as TOML: 11 entries, keys
  unchanged.
- **Elaboration.** This design stage has no `Suggested.lean`, so there was nothing to elaborate and
  no `#check` comparison to run. No Lean command was run.
- **Ownership and overlap.** No construction, target or supplier edge was added, so neither needed
  a new check. The supplier list and the gaps (`simplicial-replacement-dimension`,
  `order-complex-nerve-realization`) are unchanged.
- **Sources.** No source was fetched, and none was needed. Every new locator was read in the cached
  texts of Brown1974, Brown1975, BieriEckmann1973 and Serre1971Bourbaki. No new citation of the
  uncertified works was added.

## For the maintainer

- No id, section, target or Lean name changed, so citing roadmaps are unaffected.
- The manifest now records the non-goal citations of Brown1974 (§6 Corollaries 2–3 and Theorem 6, §7,
  Appendix B) under "Scope and ownership". These passages are cited only to delimit scope; no target
  rests on them.
- Labels other than section numbers in `cited_for` follow the existing usage ("Layer 8 Examples"):
  "Conventions", "Scope and ownership", "Layer 4 Examples".
