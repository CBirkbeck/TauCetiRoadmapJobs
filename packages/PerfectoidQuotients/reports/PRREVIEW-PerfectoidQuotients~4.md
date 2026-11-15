# Review of PerfectoidQuotients (pull request #1042 at 46c6938)

**Verdict:** needs changes

## R01 (P3) — State that this pull request adds a new roadmap

**Location:** pull request description, folder paragraph: “Roadmap folder `TauCetiRoadmap/PerfectoidQuotients` (README, `Suggested.lean`, `metadata.toml`).”

**Claim:** The description names the folder but never identifies the change as adding a new roadmap rather than revising one on main.

**Witness:** `git ls-tree origin/main TauCetiRoadmap/PerfectoidQuotients` has no entry; `git diff --name-status origin/main...HEAD` lists three added files, all in this folder.

**Repair:** Replace the quoted sentence with: “This pull request adds the new roadmap `TauCetiRoadmap/PerfectoidQuotients`, with `README.md`, `Suggested.lean` and `metadata.toml`.”

## Previous findings

- R01 — repaired: the description now says “`Suggested.lean` states one headline theorem and no definitions” and identifies §0.3's `Witt.witt_principal_quotient_p_torsion`, matching the file.
- R02 — repaired: the Validation paragraph now says “The roadmap has been through author-side red-team passes”; it no longer presents them as future work.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Supplier contract, README:301–304: relative Frobenius | `F₂ → F₄`, `α²=α+1`; `F₃ → F₃` | `α⊗1 ↦ α+1`; `(α+1)²=α`; `2³=2` | Isomorphism, with the stated direction | None |
| Same contract, nonreduced base | Identity on `A=F₂[ε]/ε²` | `ε⊗1=1⊗ε²=0`; `1⊗ε ↦ ε≠0`; inverse `a ↦ 1⊗a` | Relative Frobenius is invertible although absolute Frobenius kills ε | None |
| Same contract, negative control | `F₂ → F₂[ε]/ε²`, not étale | `ε⊗1≠0 ↦ ε²=0` | Étale hypothesis excludes the noninjective map | None |
| §1.3 restriction direction | `g=0`, `T=t`, `|t|=1/2`; `g=1`, `T=0` | First point: `1/2≤1/2`, `1/2>1/4`; second: `1≤1`, `1>1/2` | `U₂⊆U₁⊆U₀`; sections go `B₀→B₁→B₂` | None |
| §1.3 identity and composition | `ℓ=k`; `(ℓ,k,m)=(0,1,2)`, coordinate T | `res_(ℓ,ℓ)(T)=T`; `res_(1,2)(res_(0,1)(T))=T=res_(0,2)(T)` | Restrictions agree; the same holds for every section | None |
| §1.3 saturated model identification | Zero integral model, empty Y | `O⁺(∅)=0`; rational model `0`; saturation `0_*=0` | Both models agree, including the degenerate case | None |
| PR description's change classification | Folder at base and head | `0→3` files; `0→32` headings; `0→1` Lean declarations | New roadmap | R01 |

Rows for statements the diff leaves untouched stand as in the previous review, of `6fb01ee`.

- Changed passages: 3 reviewed; seeded §1.3 is the only sampled subsection changed; no Lean statement or layer was added, removed or reordered since `6fb01ee`.
- Source locators checked, 4: bhatt-dsc lines 176, 192, 225 (Notation 2.1, Definition 2.2, footnote 6, printed p.4); stacks-0EBS line 726 (Lemma 41.14.3, chapter p.16).
- Supplier citations resolved: PerfectoidQuotientsPartII's seven cited sections appear in its supplier contract, README:294–321; SchemeAndStackFoundations §0.29, README:2575–2637, supplies both relative Frobenius and its affine formula.
- Pinned declarations opened, 3: `AlgebraicGeometry.Scheme.Hom.relativeFrobenius` (`TauCeti/AlgebraicGeometry/Frobenius/Relative.lean:84`), `.isIso_relativeFrobenius` (`Etale.lean:107`), and `TauCeti.Perfectoid.IsIntegralPerfectoid` (`TauCeti/RingTheory/Perfectoid/Integral.lean:76`).
- Gate: all checks pass; targeted `lake build TauCetiRoadmap.PerfectoidQuotients.Suggested` succeeds (sorry and module-system advisory warnings). Outside-folder base diff: 0 files; worktree clean.
- Dependency output: `depcheck: 245 roadmaps, 2212 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Direct `lake env lean` and the scratch `#check @` probe succeed with only the sorry warning; 1 elaborated signature agrees with §0.3, no binder lost. Previous one-tactic results stand for the unchanged theorem.
- Remark (untouched text): `Suggested.lean:19` calls the integral-perfectoid predicate absent; the current Tau Ceti pin defines it at `TauCeti/RingTheory/Perfectoid/Integral.lean:76`.

Overlap check: read PerfectoidQuotientsPartII, PrismaticCohomology, PrismaticCohomologyPartII, PrismaticCohomologyPartIII, PrismaticCohomologyPartIV and PerfectoidSpaces; the changed root-neighborhood API belongs here, rational localization and saturation to PerfectoidSpaces, relative Frobenius to SchemeAndStackFoundations/Tau Ceti; Part II and the prismatic roadmaps consume this roadmap's integral algebra. No competing ownership in the changed passages.

Source independence: 2 mathematical passages compared with 2 sources, changed passages only; no copied expression or reused material. Largest share among rechecked locators: bhatt-dsc, 3 of 4. Arrangement not compared again: no layer added, removed or reordered.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
