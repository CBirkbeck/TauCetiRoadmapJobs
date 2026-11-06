# Review of ModularCharactersAndBlocks (pull request #1775 at ae2f373)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

🤖 Incremental AI re-review of the 29 lines changed since `931da09` (the `k̄` convention in §1.1 and the §2.3 descent route; `Suggested.lean` and every other section are byte-identical to the head the previous review read). Two findings, both P3, nothing blocking: the family index is still main's copy and excludes what this roadmap owns (unrepaired since the third review; the last repair comment confirms the finding and says the index is outside the repair job's two files), and the repaired §2.3 contains one false side remark, that `k̄/k₀` is not algebraic whenever `k` is infinite. The repair of the previous R02 is otherwise correct: the descent now runs along `Gal(k̄₀/k₀)` with `k̄₀` the algebraic closure of the finite field `k₀` inside `k̄`, the stability and endomorphism-dimension argument is right, the three Mathlib names exist at the pin with the hypotheses the route uses, and the Webb exercises say what the README says. The gate passes, the dependency check reports no problem, and the Lean file elaborates with exactly the eight `sorry` warnings. No pull-request file was changed outside the folder.

## R01 (P3) — The family index excludes the roadmap it now contains

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:11–63` (the list of the family's roadmaps) and `:111–117`, “the modular theory proper — Brauer characters, decomposition matrices, blocks with defect … — is out of scope for every roadmap here”.

**Claim:** The family index describes the family after this pull request.

**Witness:** `git diff origin/main...HEAD -- TauCetiRoadmap/RepresentationTheory/README.md` is empty at `ae2f373`; `git diff --stat origin/main...HEAD` lists only the folder's two files. `grep -c ModularCharactersAndBlocks` on the index gives `0` while the folder `ModularCharactersAndBlocks/` is in the family directory. The exclusion sentence names exactly the objects `ModularCharactersAndBlocks/README.md:26` says this roadmap owns. The pull-request description says the index and the scope boundaries are updated.

**Re-raised: H01** (the repair comment on `ae2f373`). The reason given there, that the index is outside the two files a repair job may edit, is a statement about the repair job's allowance, not about the pull request: the brief for this review names the files directly in `TauCetiRoadmap/RepresentationTheory/` as the pull request's own, the comment itself says the finding is correct as stated, and the defect is in the pull request the human will approve. It is raised again so that it reaches the author's own commit, which the repair comment names as the place for the edit.

**Repair:** On top of the index as it stands on the branch (main's copy, so that main's later entries are kept), add a list entry for ModularCharactersAndBlocks after ModularInduction (Brauer characters, decomposition and Cartan matrices, projective characters, block idempotents, defect groups, Brauer's three main theorems, the principal-block and section-orthogonality interfaces); a dependency bullet under “How they depend on one another” saying it consumes CharacterTheory, ModularInduction, QuiverRepresentations Layer 3 and InductionRestriction Layer 6; and a scope bullet naming ModularCharactersAndBlocks as the owner of Brauer characters, decomposition matrices and blocks with defect, keeping the exclusion of the modular representation theory of symmetric groups. `git diff 5fe14341~1 4e18c0d3 -- TauCetiRoadmap/RepresentationTheory/README.md` shows three edits with this content; apply them to the current index, not to the older copy that commit edited.

## R02 (P3) — “`k̄/k₀` itself is not algebraic when `k` is infinite” is false for `k = 𝔽̄_p`

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:422–423`, “(`k̄/k₀` itself is not algebraic when `k` is infinite, so the descent is never run along it)”.

**Claim:** For every infinite field `k` of characteristic `p` containing `ζ_{e'}`, the extension `k̄/k₀` is not algebraic.

**Witness:** `k = 𝔽̄₂` (an algebraic closure of `𝔽₂`, infinite, containing `ζ₃`), `G = C₃`, `p = 2`: `k₀ = 𝔽₄`, `k̄ = k`, and `k̄/k₀ = 𝔽̄₂/𝔽₄` is algebraic, indeed Galois; `k̄₀ = k̄` and the descent along `Gal(k̄₀/k₀)` is the descent along `Gal(k̄/k₀)`. The correct condition is that `k` is not algebraic over `𝔽_p`: for `k = 𝔽₄(T)` the extension `k̄/k₀` has transcendence degree `1`, which is the case the previous round's finding was about. The route itself is unaffected: it uses `k̄₀`, never `k̄/k₀`.

**Repair:** Replace the parenthetical by “(`k̄/k₀` itself need not be algebraic, for instance when `k = 𝔽₄(T)`, so the descent is never run along it)”, or by “is not algebraic when `k` is not algebraic over `𝔽_p`”. Tested on the instance: with either wording the sentence is true for `k = 𝔽̄₂` (algebraic, `k̄₀ = k̄`) and for `k = 𝔽₄(T)` (transcendence degree `1`), and the Check at `:454–459` on `𝔽₄(T)` still reads as written.

## Previous findings

- R01 — not repaired: `git diff origin/main...HEAD -- TauCetiRoadmap/RepresentationTheory/README.md` is empty at `ae2f373`; the index lists no entry for this roadmap, and `:117` still reads “is out of scope for every roadmap here”. The repair comment answered it as not actionable in a repair round; raised again as R01 with the reason.
- R02 — repaired, with one new false remark: `README.md:420–435` now names `k̄₀ ⊆ k̄` the algebraic closure of `k₀` inside `k̄`, runs the Brauer-character and recognition argument for simple `k̄₀[G]`-modules and `Gal(k̄₀/k₀)`, derives `k₁ = k₀` from the endomorphism dimension, and keeps the base change `k₀ → k`; the bullet at `:446–448` cites Webb, Exercise 8(a), for `k ⊆ k̄` as asked. The parenthetical at `:422–423` is raised as R02 above.

## Verified sound

**Scope of this round.** The diff since `931da09` is 20 insertions and 9 deletions: the sentence “`k̄` denotes a fixed algebraic closure of `k`” in §1.1 (`README.md:105–106`), the descent route of §2.3 (`:417–435`) and the bullet after it (`:446–448`). No file outside the folder changed; `git diff --stat origin/main...HEAD` lists only the folder's README (911 lines) and `Suggested.lean` (164 lines), and `git diff 5c1a0d2 HEAD -- Suggested.lean` is empty. Everything the previous two reports verified for the untouched sections stands and is cited below where carried forward.

**Gate and build.** The worker's gate at `ae2f373` reads `set_option=0 … depcheck=0 … outside-folder=0 … source-material=0 build=0 OK`; my own run of the gate command of the brief gave the same line with every counter `0` and exit `0`. Independent `lake env lean TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/Suggested.lean` from the pull-request worktree exited 0 in 7 s with exactly the eight `declaration uses sorry` warnings at lines 42, 56, 72, 99, 117, 127, 139, 153 and nothing else. The file is unchanged since `5c1a0d2`, so the r5 report's signature comparison (`#check @name` for all eleven declarations, each type agreeing with its README statement and carrying its own binders) and padding probe (none of the eight theorems closes in one tactic) stand. The worktree head is `ae2f373d1c201a033b778654b1e491b7649b3db3` and clean.

**Dependency check.** The command of the brief returned exactly:

```text
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line. The diff adds no supplier citation: the `*Needs:*` line of §2.3 is unchanged since `931da09` (§2.1; three Mathlib names; SemisimpleAlgebras Layers 0 and 2, which exist on main at `RepresentationTheory/SemisimpleAlgebras/README.md:169` and `:212`).

**The changed passage against its suppliers and sources.**

| Claim in the diff | Where it resolves | Result |
| --- | --- | --- |
| `k̄₀ ⊆ k̄`, the algebraic closure of `k₀` inside `k̄`, is an algebraic closure of `𝔽_p` and a splitting field for `G` | `k₀/𝔽_p` algebraic, so the algebraic closure of `k₀` in `k̄` is the algebraic closure of `𝔽_p` in `k̄`, algebraically closed; an algebraically closed field splits every finite-dimensional algebra | Right. |
| `k̄₀/k₀` is Galois because `k₀` is perfect | `k₀` finite, hence perfect; an algebraic closure of a perfect field is separable and normal over it | Right. |
| `μ_{e'}(k̄₀) = μ_{e'}(k₀)` | `p ∤ e'`, so `X^{e'} − 1` is separable with `e'` roots in `k̄₀`; `k₀ = 𝔽_p(ζ_{e'})` contains a primitive one, hence all `e'` | Right; for `e' = 1` both sides are `{1}`. |
| Brauer character of `M^σ` equals that of `M`; recognition gives `M^σ ≅ M` | `README.md:368–372`: the Brauer character of a `k̄[G]`-module, values the lifts of eigenvalues; `:388`: a semisimple module is determined by its Brauer character; `σ ∈ Gal(k̄₀/k₀)` fixes `μ_{e'} ⊆ k₀`, so `g` has the same eigenvalues on `M^σ` and `M` | Right; the step from `k̄ ⊗ M^σ ≅ k̄ ⊗ M` back to `k̄₀` is the absolute simplicity of simples over the algebraically closed `k̄₀`, which the target's closing sentence (“identify the simple-class bases over `k₀`, `k` and `k̄`”) covers. |
| `End_{k₀[G]}(T)` is a finite division algebra, hence a field `k₁ ⊇ k₀` (`littleWedderburn`) | `Mathlib/RingTheory/LittleWedderburn.lean:169`, `instance littleWedderburn (D) [DivisionRing D] [Finite D] : Field D`; Schur's lemma gives the division ring, `T` finite over `k₀` finite gives `Finite` | Exists at the pin with the hypotheses used. |
| `k̄₀ ⊗_{k₀} T ≅ ⊕` of the `[k₁ : k₀]` Galois conjugates of `k̄₀ ⊗_{k₁} T` | `k̄₀ ⊗_{k₀} k₁ ≅ ∏_{τ : k₁ → k̄₀} k̄₀` (`k₁/k₀` separable, `[k₁ : k₀]` embeddings) and `Gal(k̄₀/k₀)` permutes the embeddings transitively | Right. |
| `k̄₀ ⊗_{k₁} T` simple since `End_{k₁[G]}(T) = k₁` | `A → End_{k₁}(T)` is surjective when `End_A(T) = k₁` (Jacobson density), and surjectivity is preserved by base change, so `E ⊗ T` is simple for every `E ⊇ k₁` | Right for every field `k₁`; the word “perfect” is not needed here (a note, not a finding). |
| `End(k̄₀ ⊗_{k₀} T) = k̄₀ ⊗_{k₀} k₁` of dimension `[k₁ : k₀]`, versus `M_n(k̄₀)` of dimension `n²` when the `n` conjugates are isomorphic, so `n = 1` | `Hom` of finite-dimensional modules commutes with base change; `n = n²` forces `n = 1` | Right. |
| `k₀ = 𝔽_p(ζ_{e'})` finite; `IntermediateField.adjoin.finiteDimensional` | `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:481`, `(hx : IsIntegral K x) : FiniteDimensional K K⟮x⟯` | Exists at the pin; `ζ_{e'}` is a root of the monic `X^{e'} − 1`. |
| radical lies in every ideal with semisimple quotient; `Ring.jacobson_le_of_eq_bot` | `Mathlib/RingTheory/Jacobson/Radical.lean:166`, `{I : Ideal R} [I.IsTwoSided] (h : jacobson (R ⧸ I) = ⊥) : jacobson R ≤ I` | Exists at the pin (the module-form at `:90` is the other overload). |
| Webb, Chapter 9, Exercise 4, p. 165 | `webb` lines 6974–6977 (printed p. 165 = PDF marker 172): `F` splitting for `A`, `E ⊇ F`, `Rad(E ⊗_F A) ≅ E ⊗_F Rad(A)`; the bracketed remark at 6964–6965 gives `E ⊗ Rad(A) ⊆ Rad(E ⊗ A)` always | Supports the base change `k₀ → k` as the README argues it. |
| Webb, Chapter 9, Exercise 8(a), p. 166 (new bullet at `:446–448`) | `webb` lines 7004–7008 (PDF 173): `F` splitting, `E ⊇ F`, every simple `E ⊗_F A`-module is written in `F`, same number of simples | Supports absolute simplicity and the bijection of simples under `k → k̄` once `k` splits `G`. |
| Webb, remark on p. 144 | `webb` lines 6057–6070 (PDF 151): `𝔽_p(ζ)` is a splitting field, and the smallest one for `G` and all its subgroups | Supports the choice of `k₀` and the subgroup clause. |
| Webb, Theorem 9.2.7, p. 144 (unchanged locator) | `webb` 6054–6056 | As in r5 and r6: ordinary form with `m` the exponent; the README's characteristic-`p` reading is explained in the text. |
| Webb, Exercise 1(b), p. 165 (read as the negative control) | `webb` 6958–6966: `A = 𝔽_p(t)` over `F = 𝔽_p(t^p)`, `Rad(E ⊗_F A) ≠ E ⊗_F Rad(A)` | Shows the base change needs the base field to split (or be perfect); `k₀` finite supplies it. |
| §1.1: `k̄` a fixed algebraic closure of `k` | Every later use (`:368`, `:376`, `:421`, `:442`, `:446`) reads `k̄` as the closure of `k`; §2.2 and the Lean headlines use `[IsAlgClosed k]` on `k` itself | Consistent. |

**Sampled targets.** Of the fifteen seeded targets, only “2.3 Residue-field splitting” falls in the changed passage; it is checked in the table above. The other fourteen (§§1.1 apart from the new sentence, 1.2, 1.3, 2.1, 2.4, 3.1, 4.1, 4.2, 5.1, 6.2, 7.1, 7.2, 8.2, 8.3) are byte-identical to `5c1a0d2`, where the r5 report opened each at its locator (its “Sources: the seeded sample” table, with `webb`, `martinez`, `sambale`, `craven`, `axiom-third` and `axiom-section` line numbers); the page offsets it recorded (`webb` printed = PDF − 7, `martinez` PDF − 8, `sambale` = PDF, `craven` PDF − 5) were used again here for Webb and agree.

**Ownership and consumers.** No new object is introduced by the diff (`k₀`, `k̄₀`, `k₁`, the Galois descent and the radical base change are proof-route steps inside §2.3, not targets with carriers), so the r5 report's ownership search stands: `IsDefectGroup`, `brauerProjection`, `IsBlockIdempotent`, `brauer_first_main` declared only here; GlaubermanZStar the only consumer among open heads. The worker's citation check at this head found no cross-roadmap citation and no Lean name unresolved. Ownership against open pull requests whose files the brief does not supply was not re-searched.

**Adversarial computations.** The rows for the untouched statements are those of the r6 report (rows A01–A15, A16b–A16d, A17–A44, which cite r5), carried forward with their values; A16a is replaced by the rows for the repaired descent, and A16e–A16g are new. Notation as in r5: `r = (123)`, `t = (12)` in `S₃`; `α² + α + 1 = 0` in `𝔽₄`.

| Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| A01–A15 (r6 A01–A15, unchanged text) | as in r6 | as in r6 (e.g. A14: `S₃`, `p = 3`: `2` simples, `2` regular classes; A15: `End_{𝔽₂[C₃]}` of the `2`-dimensional simple is `𝔽₄`, `𝔽₄[C₃] = 𝔽₄³`) | Pass | — |
| A16a §2.3 descent along `Gal(k̄₀/k₀)` | `G = C₃`, `p = 2`, `k₀ = 𝔽₄`, `k̄₀ = 𝔽̄₂`; negative control `𝔽₂` in place of `k₀` | `T` any of the three one-dimensional `𝔽₄[C₃]`-modules (`r ↦ 1, α, α²`): `k₁ = End = 𝔽₄ = k₀`, `n = 1`, `𝔽̄₂ ⊗ T` simple, `End = 𝔽̄₂` of dimension `1 = 1²`; the Galois conjugate of `r ↦ α` under `Gal(𝔽̄₂/𝔽₄)` is `r ↦ α` (σ fixes `𝔽₄`), stable. Over `𝔽₂` instead: `T = 𝔽₄` with `r ↦ α`, `k₁ = 𝔽₄`, `n = 2`, `𝔽̄₂ ⊗_{𝔽₂} T = (r ↦ α) ⊕ (r ↦ α²)`, swapped by Frobenius, not isomorphic, `End = 𝔽̄₂ ⊗ 𝔽₄ = 𝔽̄₂²` of dimension `2 = n ≠ n² = 4` | Pass; stability is exactly what `ζ_{e'} ∈ k₀` buys, and without it the dimension count gives nothing | — |
| A16b §2.3 base change `k₀ → k` (r6 A16b) | `C₃`, `𝔽₄ → 𝔽₄(T)`; `C₂`, `𝔽₂ → 𝔽₂(T)`; Webb Ex. 1(b) | `rad = 0` both sides, `𝔽₄(T)³`; `rad(𝔽₂[C₂]) = (1 + t)`, base change `(1 + t) k[C₂]`, local, equality; control `E[x]/(x − t)^p` radical `(x − t) ≠ 0` vs `Rad(A) = 0` | Pass | — |
| A16c §2.3 Check on `𝔽₄(T)` (r6 A16c) | `C₃`, `p = 2`, `𝔽₄(T)`; `𝔽₂(T)` | `k[C₃] = k³`; `𝔽₂(T) × 𝔽₂(T)[x]/(x² + x + 1)`, dimensions `1`, `2` | Pass | — |
| A16d §2.3 subgroup clause (r6 A16d) | `C₂ ≤ S₃`, `p = 3`; `C₃ ≤ S₃`, `p = 2` | `2 ∣ 2`; `3 ∣ 3` | Pass | — |
| A16e §2.3 remark “`k̄/k₀` not algebraic when `k` infinite” | `k = 𝔽̄₂`, `G = C₃`, `p = 2`; `k = 𝔽₄(T)` | `k₀ = 𝔽₄`, `k̄ = 𝔽̄₂`, `𝔽̄₂/𝔽₄` algebraic and Galois, `k̄₀ = k̄`, transcendence degree `0`; for `𝔽₄(T)`: transcendence degree `1`, not algebraic | Remark false for `𝔽̄₂`; route unaffected | R02 |
| A16f §2.3 bullet: absolute simplicity and bijection of simples under `k → k̄` | `C₃`, `p = 2`, `k = 𝔽₄`; control `k = 𝔽₂` | `𝔽₄[C₃]`: `3` one-dimensional simples, `𝔽̄₂[C₃]`: `3`, each `End = 𝔽₄` resp. `𝔽̄₂`, bijection; `𝔽₂[C₃]`: `2` simples (dimensions `1`, `2`) against `3` over `𝔽̄₂`, no bijection, and the `2`-dimensional one has `End = 𝔽₄ ≠ 𝔽₂`, so the bullet's hypothesis “once `k` is known to split `G`” is needed | Pass | — |
| A16g §1.1 `k̄` convention and `μ_{e'}(k̄₀) = μ_{e'}(k₀)` | `e' = 3`, `p = 2`; `e' = 1`, `p = 5` (`C₅`) | `μ₃(𝔽̄₂) = {1, α, α²} = μ₃(𝔽₄)`, `3` elements each; `μ₁ = {1}` both, `k₀ = 𝔽₅` | Pass | — |
| A17–A44 (r6 A17–A44, unchanged text) | as in r6 | as in r6 (e.g. A19: `DᵀD = [[2,1],[1,2]]` for `S₃`, `p = 3`; A35: `k[C₂]` one block of defect `⟨t⟩`; A42: `ker 1 ∩ ker sgn = C₃ = O_{2'}(S₃)`) | Pass | — |

## Not verifiable

- **Navarro, Theorem 6.10 (`navarro`)** and **Serre (`serre`)**: settled as uncertified; cited by locator; untouched by the diff.
- **Open pull requests without supplied files** were not re-searched this round; the diff introduces no new object.

## Source issues

- **Misprint** in webb at Theorem 9.2.7 and the remark after it, printed p. 144: the source says a field containing a primitive `m`-th root of unity, `m` the exponent of `G`, is a splitting field, and that `𝔽_p(ζ)` with `ζ` a primitive `m`-th root is the smallest for all subgroups; in characteristic `p` dividing `m` no such root exists, and it should be the prime-to-`p` part of `m`; affects nothing.
