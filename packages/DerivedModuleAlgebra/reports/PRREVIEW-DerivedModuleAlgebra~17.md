# Review of DerivedModuleAlgebra (pull request #1701 at f8483df)

**Verdict:** needs changes

This is an incremental re-review of 2 changed lines since `62d4e4e`. Below, "README" means `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and "Lean" means `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`.

The only change is at README:1035. The §0.2.2 citation of [StacksSites] Remark 21.39.11 (Tag 08QD) now reads `pp.96–97` instead of `p.96`. The new range is correct (see Verified sound). No new defect is introduced, and the folder has no finding.

One P3 finding remains: the previous R01, about the pull-request description, is still not repaired. Its repair is an edit to the description on GitHub, not to the folder.

## R01 (P3) — The pull-request description still describes a README-only amendment

This is the previous review's R01 (R03 and R02 before that), not repaired.

**Location.** The pull-request description (data), unchanged since the previous head:
- **Summary:** "README only; `Suggested.lean` is unchanged";
- **What this roadmap builds:** "Polynomial laws with Roby representability (`PD.robyRepresentability`)";
- **Why Tau Ceti wants it:** "Thirteen roadmaps consume it".

**Claim.** A human approves on the basis of the description. Three of its statements are false at this head.

**Witness.**
- `git diff --numstat origin/main...HEAD` gives `491 1230` for Lean, so Lean is changed.
- `robyRepresentability` occurs 0 times in the folder.
- README:2684–2689 lists eighteen downstream consumers.

**Repair.** Edit the description on GitHub:
1. Replace the last sentence of **Summary** with: "The head also replaces main's `Suggested.lean` with the roadmap's headline theorems and the few definitions they need, including the §1.5 ordinary-quotient comparisons on K-flat models."
2. Replace `PD.robyRepresentability` with `DividedPowerAlgebra.homogeneousLawEquiv`. This is the name README:114 and README:267 use. It is declared at the Tau Ceti pin in `RingTheory/DividedPowerAlgebra/Representability.lean`:440.
3. Replace "Thirteen" with "Eighteen".

**Test.** Re-read the edited description against `git diff --numstat origin/main...HEAD`, a grep of the folder for the cited name, and README:2684–2689. All three statements then hold.

## Previous findings

- R01 — not repaired: the description still says "README only; `Suggested.lean` is unchanged", still names `PD.robyRepresentability` and still says "Thirteen roadmaps consume it". The folder commit `f8483df` changes only README:1035. Raised again above as R01.

## Verified sound

### The change: README:1035, the §0.2.2 citation

- **Diff.** `git diff 62d4e4e f8483df` changes one line of README, and `--word-diff` confirms the only change is `p.96;` → `pp.96–97;`. Lean is byte-identical to the previous head. Nothing outside the folder changed: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty.
- **StacksSites Remark 21.39.11, Tag 08QD.** Read in the cached chapter PDF text.
  - The remark starts at StacksSites line 4324, on printed p.96 (page marker at line 4288). That part sets `C = Δ` and identifies `Lπ_!` with `M• ↦ s(M•)`.
  - The part §0.2.2 relies on is at lines 4334–4339, on p.97 (page marker at line 4332). It says that for flat simplicial modules, `s(M• ⊗ M′•)` is quasi-isomorphic to the total complex of `s(M•) ⊗ s(M′•)`, and calls this a special case of Eilenberg–Zilber.
  - So `pp.96–97` is the right range, and the old `p.96` was incomplete. The previous review listed this locator under "Not verifiable" as "not re-read"; it is now verified.
  - The source's hypothesis, flat simplicial modules, is the hypothesis README:1025–1027 attaches to the derived identification. README:1024 says the chain homotopy equivalences themselves need no flatness, and README cites [DoldPuppe] for that, not Stacks.
- **DoldPuppe §2, Theorems 2.9 and 2.15, pp.213–217**, the other locator in the same parenthesis. Both read in the cached text:
  - Satz 2.9 is at DoldPuppe line 422, printed p.213 (header at line 412). It gives a universal chain homotopy equivalence between the total and diagonal complexes of a bisimplicial object, unique up to universal homotopy given degree 0.
  - Satz 2.15 is at line 567, printed p.217 (header at line 566). It says the shuffle map and the Alexander–Whitney map are universal homotopy equivalences.
  - The range is correct. The Lean docstrings of `simplicialTensorComparison` (docstring at Lean:127) and `bisimplicialDiagonalComparison` (docstring at Lean:152) cite these two theorems and not Stacks, so they need no page change.
- **Other occurrences.**
  - The tags `08J7` and `08QD` match the `locator` recorded for StacksSites in the package `sources.toml`.
  - README:1891 (Tag 08J7, p.82) and the References entries at README:2735 and 2759 are untouched. Tag 08J7 is at StacksSites line 3669, on p.82, as cited.
- **Seeded sample where it meets the change.** §0.2.2 builds on the seeded target §0.2, so I read the §0.2 locators in StacksMA (README:788–795):
  - On p.144: Definition 15.60.1 (06XZ) at line 6709, and Lemma 15.60.5 (06Y2) at line 6725.
  - On p.145: Lemma 15.60.7 (064K) at line 6741, and Lemma 15.60.8 (06Y3) at line 6753.
  - On p.146: Lemma 15.60.10 (06Y4) at line 6781.
  - On p.147: Lemma 15.60.12 (064L) at line 6824, and Definition 15.60.13 (064M) at line 6846.
  - Every number, tag and the range pp.144–147 is correct, and each statement supports the README's sentence. In particular, 06Y4 gives a K-flat resolution with flat terms, and 06Y3 covers filtered colimits.
  - The other seeded targets lie outside the change. Their r16 verdicts stand.

### Gate, dependency check, elaboration, signatures

- **Gate (my run at this head).** All counters are 0, then `OK`, exit 0:
  - `set_option`, `blob`, `latex`, `tex`, `prnum`;
  - `sorry-data`, `sorry-examples`, `residue`, `private-paths`;
  - `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`, `forbidden`;
  - `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`;
  - `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`;
  - `dirty`, `outside-folder`, `source-material`.

  The worker's record for this head also has `build=0`.
- **Dependency check.** Output:

```text
depcheck: 240 roadmaps, 2370 edges, 0 problem(s)
```

- **Elaboration.** I ran `lake env lean` on Lean. It exits 0 with exactly 29 "declaration uses `sorry`" warnings and nothing else, the same as r16.
- **Signatures.** I elaborated a scratch file, Lean followed by `#check @name` for all 39 declarations. It prints 39 signatures with no error. Lean is unchanged since r16, whose comparison with the README stands: no binder is lost, and `simplicialTensorComparison` and `bisimplicialDiagonalComparison` say "No flatness is assumed", as README:1024 does.
- **Padding.** No declaration changed, so r16's one-tactic probe stands.

### Citations, overlaps, ownership

- **Citations.** The change adds no name or cross-roadmap citation. `citations.md` lists no unresolved cross-roadmap citation. Its 97 Lean-name leads are the left column of the cited-names table (README:41–76, line numbers unchanged), resolved by its right column as in r16.
- **Overlaps.** `overlaps.md` reports:
  - no other open pull request changes this roadmap;
  - no cited id is dropped or defined only by a revision.

  The dropped §1.T.1 ids and the `#1t1-towers-lim-and-lim¹` anchor keep their old → new mapping at README:34–36, untouched.
- **Ownership.** No object is added, so the r16 ownership audit stands. The one roadmap supplier is AlgebraicTopology Stage 6, item 0, on main.

### Adversarial table

Rows marked **(r17)** were computed this round for the passage the diff touches. All other rows are carried from the r16 report (PRREVIEW-DerivedModuleAlgebra~16) for statements the diff leaves untouched, with r16's values.

| Statement | Instances | Values on each side; wrong model excluded | Result | Change |
| --- | --- | --- | --- | --- |
| §0.2.2 shuffle/AW comparison and its flat derived identification (README:1012–1036) **(r17)** | constant `A`; constant `ℤ/2` over `ℤ`; Dold–Kan of `[ℤ --2→ ℤ]` | **Constant `A`:** `s` has `d_n = Σ(−1)^i = 1` for even `n ≥ 2` and `0` for odd `n`, so `H_* = A[0]`; both sides have `H_0 = A ⊗ A`, and the degree-0 shuffle is the identity. **Constant `ℤ/2`:** both sides are `ℤ/2[0]`, so EZ holds without flatness, but `ℤ/2 ⊗^L ℤ/2` has `H_1 = ℤ/2 ≠ 0`. Hence "EZ computes `⊗^L` without flatness" is false, and flatness is required, as README:1025 and 08QD state. **`[ℤ --2→ ℤ]`:** degreewise free with `s ≃ ℤ/2[0]`; both sides and `ℤ/2 ⊗^L ℤ/2` have `H_0 = H_1 = ℤ/2`, as the flat case requires | True | none |
| §0.2.2 locator (README:1035) **(r17)** | StacksSites p.96 vs p.97 | Remark begins at line 4324 (p.96); flat EZ statement at lines 4334–4339 (p.97) | `pp.96–97` correct | none |
| `ordinaryQuotientCompletion` (Lean:327) (r16) | `ℤ`, `(p)`, `P = ℤ[0]`; `I = 0`; `I = A`; `A = 0`; `ℤ_p ⋉ ℚ_p/ℤ_p` | **`ℤ`:** tower `ℤ/p^(n+1)`, `L = ℤ_p[0]`. **`I = 0`:** `L = P`, `η = id`. **`I = A`:** `L = 0`, both Hom sets singletons. **`A = 0`:** `D(0)` trivial. **`ℤ_p ⋉ ℚ_p/ℤ_p`:** naive `ℤ_p[0]` vs `H^−1(Λ A) = ℤ_p`; not Noetherian, so excluded | True | none |
| `_of_boundedTorsion` (Lean:346) (r16) | `f = 0`; `f = 1`; `k[ε]/ε²`, `f = ε`; `ℤ[x_i]/(p x_i)`, `f = p` | **`f = 0`:** `c = 1`, `L = P`. **`f = 1`:** `L = 0`. **`ε`:** `c = 2`, `L = P`, `A[1/ε] = 0`. **`p`:** `c = 1`; `A[f^(n+c)] → A[fⁿ]` by `f^c` is 0 | True | none |
| `_of_isWeaklyRegular` (Lean:368) (r16) | `[]`; `[p, 1]`; `[x₁, x₂]`; `[f]` | **`[]`:** `L = P`. **`[p, 1]`:** `I = ℤ`, `L = 0`. **`[x₁, x₂]`:** `(x₁ⁿ, x₂ⁿ) ⊂ Iⁿ` and `I^(2n−1) ⊂ (x₁ⁿ, x₂ⁿ)`. **`[f]`:** bounded-torsion row with `c = 0` | True | none |
| `nonempty_…HomologyIso` (Lean:389) (r16) | `ℤ[0]`; `F_p[0]`; `⊕_n ℤ[n]`; `ℚ_p/ℤ_p` over `ℤ_p` | **`ℤ[0]`:** `H⁰ = ℤ_p`. **`F_p[0]`:** `H^−1` levels with zero transitions, `lim = lim¹ = 0`. **`⊕_n ℤ[n]`:** degreewise `ℤ_p`. **`ℚ_p/ℤ_p`:** `H^−1 = ℤ_p` but `(H^−1)^ = 0`, so `hfin` is needed | True | none |
| §1.5 Checks (README:2093–2128) (r16) | `ℤ[x_i]/(p x_i)`; `ℤ[x₁, x₂, …]`; `k[x,y]/(xy)`; `A/I = 0`; `R ⋉ T` | **`ℤ[x_i]/(p x_i)`:** torsion killed by `p`, `c = 1`; not weakly regular; not Noetherian. **`ℤ[x₁, x₂, …]`:** `(x₁, x₂)` is not principal. **`k[x,y]/(xy)`:** no weakly regular generators; `Λ = k[[x,y]]/(xy)`. **`R ⋉ T`:** `Hom(C, R[1]) = 0`, so nonsplit | True | none |
| Docstring §1.4, §1.9, §1.E bullets (Lean:74–92) (r16) | pin grep | `TauCeti.koszulComplex` is a single complex; no product totalization at either pin; every §1.E.0 object has a "Construct" sentence | Holds | none |
| §0.1 Check (README:781–784) (r16) | constant `A[t]` over `A[t]/(t²)` | `H₀ = A[t]`; kernel `t²A[t] ≠ 0` | True | none |
| `quasiIso_whiskering_of_projective` (Lean:174) (r16) | `Γ₀[ℤ --2→ ℤ] → ℤ/2`, `F = V ⊗ V` | `H₁ = ℤ/2` vs `0`; the target is not projective, so excluded | True | none |
| §0.7 Check (README:1325) (r16) | `k[x,y]/(x,y)²` | `Rel/TrivRel` has basis `r₁, r₂, y r₁`; `H^−2 = k` | True | none |
| §0.13 Checks (README:1510–1512) (r16) | `(p) ⊂ ℤ`; `k[X]/X²`; char 2 | `F_p[1]`; `X² ↦ 2X dX`, the zero map in char 2 | True | none |
| §0.14 Check, `exteriorPower_decalage`, `symmetricPower_decalage` (Lean:197, 215) (r16) | `Be` over `F₂`; `N = ℤ/2` | `∧²(Be) = 0` vs signed coinvariants `F₂`; `F₂` vs `Γ²_ℤ(ℤ/2) = ℤ/4`, so flatness is needed | True | none |
| `simplicialTensorComparison` (Lean:134) (r16) | bidegree (1,1) | `d∇ = ∇d` with `∇ = s₁⊗s₀ − s₀⊗s₁`; the opposite sign fails unless `2 = 0` | True | none |
| §0.25 Checks (r16) | `k[x]/x³ → k[x]/x² → k`; `ℤ/4 → F₂` | connecting map onto `k`; `Tor₁^(ℤ/4)(F₂, B′) ≠ 0` | True | none |
| `derivedLimit_isTriangulated`, §1.1 Checks (r16) | `ℤ` with `×p`; `[ℤ → ℤ/p^(n+1)]` | `lim¹ = ℤ_p/ℤ`; `H¹(Rlim) = ℤ_p/ℤ` | True | none |
| §1.2 laws, reflector, `completeNakayama` (Lean:268–310) (r16) | `I = A`; `ℚ_p`; `ℤ[1/p]`; `m ⊂ O_ℂp` | `M = 0`; nonzero class; `ℤ_p`, `0`; `m = m²` with `m ≠ 0`, so `hI` is needed | True | none |
| §1.4, §1.6, §1.7 Checks (r16) | `(p)`; `P• → 0`; `ℤ`; `F_p` | chain map `(×p, id)`; Hom `∅` vs `{*}`; `Ext¹(ℤ[1/p], ℤ) ≠ 0`; `H^−1 = F_p` | True | none |
| `cohomologicalAmplitude_of_completeTorAmplitude`, Lean:437, 456 (r16) | `ℤ[1/p][−1]`; `ℤ/4` with `M = ℤ/2`, `ℤ/4` | `hc` needed; `Tor₁ = ℤ/2`; `ℤ/2 ≅ 2ℤ/4` | True | none |
| §1.9 Checks; `isPerfect_*` (Lean:493–526) (r16) | `ℤ_p → ℤ_p × ℤ_p`; `eA ⊂ k × k`; bi-infinite `ℤ/4` | section splits; Euler ranks `(1, 0)`; `F₂` in every degree when the bound is dropped | True | none |
| Lean:537, 550, 574, 587 (r16) | `k[t]/(t^(n+1))`; `R = 0`; `ℤ_(p)` | `1 + t` a unit; `E = 0`; `End(ℚ_p/ℤ_p) = ℤ_p ≠ ℤ_(p)` | True | none |

### Headline theorems (carried from r16; Lean unchanged)

- **Stated in Lean:**
  - S.1 second page;
  - §0.2.2 Eilenberg–Zilber, both forms;
  - §0.3 resolution independence;
  - §0.17 both décalages;
  - §1.1 exactness;
  - the §1.2 laws;
  - the §1.3 reflector and Nakayama;
  - the §1.5 comparisons and the 0A06 computation;
  - §1.8, three theorems;
  - §1.E.0 perfection, base change, unit reflection and the residue criterion;
  - §1.M Matlis duality.
- **Named in the docstring with the missing carrier:**
  - `⊗^L` and derived scalar extension;
  - the S.1 edge maps and exact sequences;
  - the cotangent complex;
  - `LF`, `L∧ⁿ`, `LSymⁿ`, `LΓⁿ`;
  - the §1.1.1 adjunction;
  - the §1.4 Koszul tower;
  - §1.6, §1.9 and §1.E effectivity.

### Remarks on untouched text (no change requested)

- The pull-request title, "cite the affine-crystalline formalisation at the divided power targets", also describes only the original amendment. It falls under the same description edit as R01.
- Source issues from r16 stand: StacksMA Tag 0BKH, the StacksMA 0AAJ proof misprint, SAG Construction 25.2.2.2, and the SAG p.1705 proof label. This round's reading found no further issue.

## Not verifiable

These items, outside the change, are unchanged from r16:
- **NSW printed and PDF pages** (README:960–962). The cache entry for NSW holds only the authors' landing page.
- **IllusieCC, Chapter II, 1.2.6.2** (README:1423). It is recorded as uncertified: Springer LNM 239 is paywalled, and I found no open copy.

StacksSites Remark 21.39.11, listed here in r16, is now verified (see above).

## Source issues

- none
