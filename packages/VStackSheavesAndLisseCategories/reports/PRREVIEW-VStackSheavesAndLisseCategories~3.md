# Review of VStackSheavesAndLisseCategories (pull request #1230 at c5fdecd)

**Verdict:** needs changes

Incremental re-review of the 56 changed lines since 014d321: the two locator repairs of the previous report, the new VS3.3 subsection "Coefficient stages and scheme coefficients" with its scope paragraph, supplier-contract bullet, `*Needs:*` lines and layer dependencies, and the module header of `Suggested.lean`. The gate and the elaboration were run again in full.

## R01 (P1) — The coefficient-stage citations of EtaleCohomologyFoundations resolve only in a revision pull request, not on main

**Location:** `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:39`, `:89`, `:1070` ("Then `Scheme.IsInvertibleOn ℓ X_alg` holds, by `Scheme.isInvertibleOn_iff_ne_zero`"), `:1072–1074`, `:1084`, `:1091`, `:1111`; `TauCetiRoadmap/VStackSheavesAndLisseCategories/Suggested.lean:20–21`.

**Claim:** EtaleCohomologyFoundations supplies the class `Scheme.IsInvertibleOn ℓ X` and the lemma `Scheme.isInvertibleOn_iff_ne_zero` (Conventions, §F.0.1), normalized systems over a Noetherian pair `(Λ,I)` with `Λ/I` finite, hence `D_c^b(X_alg,𝒪_E)` from `(𝒪_E,𝔪_E)`-systems (§F.4.1), the pro-étale coefficient ring objects `𝒪_E,X`, `E_X`, `ℚ̄_ℓ,X` (§F.4.3), and rationalization along `𝒪_E,X→E_X` with `D_c^b(X,ℚ̄_ℓ)` as a 2-colimit (§F.4.5).

**Witness:** EtaleCohomologyFoundations on main (eaf17b1) contains none of these: its README and `Suggested.lean` have no `IsInvertibleOn` or `isInvertibleOn_iff_ne_zero` (grep: zero hits); §F.4.1 (README line 959) forms systems only over `Λ_n = ℤ/ℓⁿ`; §F.4.3 (line 999) identifies only `ℤ_ℓ,X` with `Scheme.ellAdicSheaf`; §F.4.5 (line 1041) has `ℚ_ℓ,X = ℤ_ℓ,X[1/ℓ]`, finite `E` "by scalar extension, using `O_E` lattices" and `ℚ̄_ℓ` objects "defined over finite `E`", no ring objects `𝒪_E,X`, `E_X`, `ℚ̄_ℓ,X` and no 2-colimit. Every cited item exists only in the open revision pull request #1891 of EtaleCohomologyFoundations (its README lines 23, 1360–1361, 1427–1430, 1525), and a pull request that revises an existing roadmap is never a dependency: the roadmap is cited as it is on main. The dependency check cannot see this because the roadmap name resolves. Note also that even in that revision `Scheme.isInvertibleOn_iff_ne_zero` carries `[Nonempty X]`, so line 1070 would not apply to an empty `X_alg` (where the conclusion is vacuous).

**Exact repair:** Cite EtaleCohomologyFoundations as it is on main and own the remainder in VS3.3, with no change of mathematics:

1. Invertibility: replace the two Lean names (lines 39, 89, 1070, 1084, 1091) by §F.0.1's stalkwise invertibility of an integer with its residue-characteristic criterion, in prose. For `X_alg` over `C`, `ℓ` is a unit in every residue field because each residue field is a `C`-algebra and `ℓ ≠ 0` in `C` (characteristic `0` or `p`); for the last Check, when `C` has characteristic `p` and `X_alg` is nonempty, `p = 0` in every residue field.
2. `(𝒪_E,𝔪_E)`-systems: main's §F.4.1 has `ℤ/ℓⁿ`-systems only. Either define `D_c^b(X_alg,𝒪_E)` in VS3.3 as this roadmap's own target (normalized systems `K_n ∈ D^b_ctf(X_alg,𝒪_E/𝔪_E^n)`, finite rings killed by `ℓⁿ`, so §F.0.1 applies; the normalization is that of §F.4.1 with `ℤ/ℓⁿ` replaced by `𝒪_E/𝔪_E^n`), with three Checks (constant tower `𝒪_E/𝔪_E^n` is normalized; `E = ℚ_ℓ` recovers §F.4.1; a tower with unrelated ranks fails derived normalization), or take `D_c^b(X_alg,𝒪_E)` as the `𝒪_E`-lattice form of main's §F.4.5 and say so.
3. Ring objects: cite §F.4.3 for `ℤ_ℓ,X = Scheme.ellAdicSheaf ℓ` only; define `𝒪_E,X`, `E_X` and `ℚ̄_ℓ,X` in VS3.3 as the sheaves of continuous maps to `𝒪_E`, `E` and to `PadicAlgCl ℓ` with values locally in a finite extension, as this roadmap's own definitions (the VS3.3 profinite-set computation already gives their sections).
4. Rational and `ℚ̄_ℓ` categories: cite main's §F.4.5 for `ℚ_ℓ,X = ℤ_ℓ,X[1/ℓ]`, rationalization up to isogeny, finite `E` by scalar extension with `𝒪_E` lattices and bounded constructible `ℚ̄_ℓ` objects defined over finite `E`; state the identification of the last with the 2-colimit of the `D_c^b(X_alg,E)` as VS3.3's own claim (objects and morphisms are defined over a common finite extension).
5. Suggested.lean lines 20–21: drop "the pro-étale coefficient ring objects of `EtaleCohomologyFoundations` §F.4.3" or restrict it to `ℤ_ℓ,X`.

Tested on the refuting instance: with these citations every `*Needs:*` item of VS3.3 resolves on main (§F.0.1 line 175, §F.4.1 line 959, §F.4.3 line 999, §F.4.5 line 1041), and the stage computation `C(S,ℤ_ℓ)`, `C(S,𝒪_E)`, `C(S,E)` on a profinite `S` is unchanged.

## R02 (P3) — The README names pins that are not the manifest's

**Location:** `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:61`: "The pins are Mathlib `6b7abb3c…` and Tau Ceti `a91d3aaf…`"; the Mathlib links at `6b7abb3c` on lines 63–65 and 72 and the Tau Ceti links at `a91d3aaf` on line 68.

**Claim:** The roadmap's pins are those commits.

**Witness:** `lake-manifest.json` at this head pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (the merge of main at f4e1e116 moved them); the gate builds against these. `PadicAlgCl` (`Mathlib/NumberTheory/Padics/Complex.lean:54`), `Scheme.ellAdicSheaf` (`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:64`), `TauCeti.Huber.Pair` (`TauCeti/RingTheory/Huber/Pair.lean:153`), `spa` (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:105`) and `SmoothDiscreteTopRep` (`…/SmoothDiscrete/Basic.lean:656`) all exist at the manifest's pins, so nothing mathematical changes.

**Exact repair:** State the manifest's commits in line 61 and point the links of lines 63–65, 68 and 72 at them (or drop the commit hashes from the sentence and keep the links as fixed snapshots, saying so).

## R03 (P3) — A junk value in the new Check and a phantom sub-label in two locators

**Location:** `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:1089` ("On `S=ℕ∪{∞}` … send `n↦ℓ^(n+1/n)`"); `:996` and `:1082` ("FS, Example VII.5.1(a)–(`b`), pp.264–265").

**Claim:** The map is defined on all of `ℕ∪{∞}`; FS Example VII.5.1 has parts (a) and (b).

**Witness:** At `n = 0` the exponent `0 + 1/0` is undefined. FS lines 10264–10285 (pp.264–265) give Example VII.5.1 as one unlabelled paragraph, with no (a) or (b).

**Exact repair:** Take `S = ℕ_{≥1} ∪ {∞}` (or send `0 ↦ 0`); for `n ≥ 1` the values `ℓ^(n+1/n)` have norm `ℓ^(−n−1/n) → 0`, so the map is continuous, and `ℚ_ℓ(ℓ^(n+1/n)) = ℚ_ℓ(ℓ^(1/n))` has degree `n`, as the Check says. Replace both locators by "FS, Example VII.5.1, pp.264–265".

## Previous findings

- R01 — repaired: line 1119 now adds "for the representable diagonal and isomorphism sheaves, FS proof of Theorem IV.1.19 and Lemma IV.1.20, pp.112–113"; FS lines 4283 (p.112) and 4317–4319 (p.113) are those passages.
- R02 — repaired: line 1129 now reads "§III.2.5, p.97; Theorem III.4.5, p.102, and Proposition III.4.7, pp.102–103; … proof of Corollary V.2.3, p.172"; FS lines 3668, 3866, 3891–3902 and 6646–6652 confirm each page.

## Verified sound

**Scope of this round.** The folder diff since 014d321 (47 insertions, 9 deletions) was read in full together with everything it cites: the FS passages behind the two locator repairs, EtaleCohomologyFoundations on main (eaf17b1) at Conventions, §F.0.1, §§F.4.1–F.4.5, the two Mathlib declarations, the VS3.1 "Solid embedding of constructible coefficients" and VS3.3 "Lisse scalar extension and completion" targets the new subsection builds on, the Conventions paragraph (lines 45–49) defining `Λ = ℤ_ℓ ⊗_(ℤ_ℓ,disc) Λ_disc`, and the changed Lean docstring and header. The outside-folder diff against origin/main is empty (`git diff --stat origin/main...HEAD` excluding the folder prints nothing); the long list in the change summary is the merge of main (f4e1e116), not the pull request's own changes.

**Gate.** Run again on this head with the targeted build:

```text
gate VStackSheavesAndLisseCategories: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

**Dependency check.** `depcheck: 240 roadmaps, 2356 edges, 0 problem(s)`: no UPWARD or CYCLE line for this roadmap. R01 is invisible to it because the cited roadmap name exists on main; only the cited content does not.

**Elaboration.** `lake env lean` on `Suggested.lean` succeeds with exactly three `sorry` warnings (lines 49, 52, 58) under the new `module` / `public import Mathlib` / `@[expose] public section` header. A scratch copy with `#check @` for all four declarations gives `SolidAb : Type (u+2)`, `SolidAb.abelian : Nonempty (Abelian SolidAb)`, `inclusion_isRightAdjoint : (ObjectProperty.ι fun A => CondensedMod.IsSolid (ULift ℤ) A).IsRightAdjoint` and `derived_inclusion_isRightAdjoint : ∀ [HasDerivedCategory CondensedAb], (ObjectProperty.ι fun K => ∀ n : ℤ, …IsSolid ((homologyFunctor n).obj K)).IsRightAdjoint`: the `HasDerivedCategory` binder and the quantifier over every `n : ℤ` are kept; nothing changed from the previous report's signatures. The one-tactic probe (`first | infer_instance | simp | rfl`, and `exact ⟨inferInstance⟩` for the abelian statement) fails on all three sorried theorems, so no padding.

**Seeded sample.** The two sampled targets the diff touches were re-read at the new locators (FS cache lines quoted under Previous findings); "Full stratum automorphisms" (FS III.5.1, p.104; III.5.3, p.106) and "Filtered charts and contraction" (FS V.3.2–V.3.7, pp.173–177) are untouched and stand as in the previous report. New locators of VS3.3: FS lines 10401–10402 (p.268) state the coefficient convention `Λ = ℤ_ℓ ⊗_(ℤ_ℓ,disc) Λ_disc` for a discrete `ℤ_ℓ`-algebra; FS Proposition VII.6.5, lines 10455–10456 (p.269), gives `D_lis(Spa C,Λ) ≅ D(Λ)` for relatively discrete modules, which is Check 1; FS Example VII.5.1, lines 10264–10275, is the `ℤ_ℓ` embedding of `D_c^b(X_alg,ℤ_ℓ)` with compact image, the model for the `𝒪_E` form (its sub-labels are R03).

**Library declarations opened at the manifest pins** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): `PadicAlgCl` is `AlgebraicClosure ℚ_[p]` with the spectral norm (`Mathlib/NumberTheory/Padics/Complex.lean:54,67`), so "the algebraic closure of `ℚ_ℓ`" is exact and its subfield topology on a finite `E` is `E`'s own; `AlgebraicGeometry.Scheme.ellAdicSheaf` is the pushforward to the pro-étale site of the fpqc sheaf of continuous maps to `ℤ_[ℓ]` (`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:64–68`), so "`U ↦ C(U,ℤ_ℓ)` on the pro-étale site" is exact; both files also exist at the README's stated commit `6b7abb3c`. The Tau Ceti carriers of line 65 exist at `2fd255d9` (R02).

**Citations resolved.** VS3.1's new `*Needs:*` item "§§F.4.1–F.4.2 (normalized systems and their classical realization, the source `D_c^b(X_alg,ℤ_ℓ)`)" matches main's F.4.1 (`ℤ/ℓⁿ`-systems, locally Noetherian `X`, invertible `ℓ`) and F.4.2 (`K_Zℓ = Rlim K_n`); `X_alg` of finite type over `C` is Noetherian and `ℓ` is invertible on it. The VS3.3 internal links resolve to the headings at lines 992, 1048 and 1056. Ownership: on main only EtaleCohomologyFoundations mentions `ℚ̄_ℓ` coefficients on schemes; no roadmap on main or among the readable open checkouts owns `𝒪_E,X`, `E_X`, `ℚ̄_ℓ,X` or `(𝒪_E,𝔪_E)`-systems, which is why R01's repair owns them here. Ownership against open pull requests was checked only through the index and the readable checkouts the brief lists.

**Adversarial table.** Rows for statements the diff leaves untouched are those of the previous report (cited as "r2"); rows with computed values are added for every changed statement. `O` below is `𝒪_E` with uniformizer `ϖ`, `d = [E:ℚ_ℓ]`.

| Statement (README line) | Instances | Values on the two sides / excluded model | Result; change |
| --- | --- | --- | --- |
| Every target block of VS0–VS5 other than those below | as in r2 | as in r2 (92 rows, values recorded there) | Pass; carried from r2. |
| Stack of bundles (1119; sampled, locator repaired) | `G = 1`; `𝔾_m`, trivial line | `G=1`: one object, automorphism `1`. Isom(`O`,`O`) is the invertible locus in `H⁰(O) = E`, i.e. `Eˣ`; FS IV.1.20 (line 4317) gives Isom as an open subdiamond of `BC(E₁^∨ ⊗ E₂) = BC(O) = E`, which contains `Eˣ` as the open complement of `0`. | Pass; locator now supports the diagonal claim. |
| Newton geometry (1129; sampled, locator repaired) | `𝔾_m`, `b = π^m`, `m = −1,0,1`; quasicompact open of `Bun_𝔾m` | `(ν,κ) = (m,m)`; degrees `1,0,−1`. A quasicompact open meets finitely many of the degree components `ℤ`, while `Bun_𝔾m` itself meets all: FS V.2.3's proof (line 6648) uses exactly the quasicompact case. | Pass; locator now supports the finiteness claim. |
| Stage rings on profinite `S` (1068) | `S = ∅`; `S = *`; `S = ℕ∪{∞}` | `∅`: all stages `0`. `*`: `ℤ_ℓ`, `O`, `E`, `ℚ̄_ℓ` (the condensed `ℤ_ℓ ⊗ O_disc = ℤ_ℓ^d = O` with its profinite topology; `ℤ_ℓ ⊗ E_disc = colim_n ϖ^(−n) O = E`). `ℕ∪{∞}`: `C(S,E)` = convergent sequences in `E`, since `S` is compact and colimits of condensed rings are computed on `S` through finite covers. Wrong model `E_disc`: sections `C(S,E_disc)` = eventually constant sequences, missing `(ϖⁿ)_n → 0`. | Pass; no change. |
| `ℚ̄_ℓ` stage is the colimit, not the completion (1068, 1089) | the map `n ↦ ℓ^(n+1/n)`, `n ≥ 1`, `∞ ↦ 0` | Norms `ℓ^(−n−1/n) → 0`, so continuous into `ℚ̄_ℓ` and into `ℂ_ℓ`; `ℚ_ℓ(ℓ^(n+1/n)) = ℚ_ℓ(ℓ^(1/n))` has degree `n` (Eisenstein `xⁿ − ℓ`), unbounded, so it lies in no single `C(S,E)`. The completion model `ℂ_ℓ` would accept it; the colimit rejects it. At `n = 0` the formula is undefined (R03). | Pass after R03. |
| Invertibility of `ℓ` on `X_alg` (1070, 1091) | `X_alg = ∅`; `X_alg = Spec C`, `char C = p`, `ℓ = p`; `ℓ ≠ p` | Empty: vacuously invertible (no residue field), outside the cited lemma's `[Nonempty X]`. `Spec C`, `ℓ = p`: `p = 0` in the residue field `C`, not a unit. `ℓ ≠ p`: `ℓ ∈ Cˣ`, hence a unit in every residue field (a `C`-algebra). | Mathematics passes; citation is R01. |
| `𝒪_E` form of the solid embedding (1076) | `X_alg = Spec C`; `A = O`, `O/ϖ`, `O[1]` | Verdier dual at a point is `RHom_O(−,O)`: `O ↦ O`, `O/ϖ ↦ (O/ϖ)[−1]`, `O[1] ↦ O[−1]`; the solid dual `RHom(−,O)` applied again gives `O`, `O/ϖ`, `O[1]`. So the composite is covariant and fixes these three objects; the one-duality model would send `O[1]` to `O[−1]`. | Pass; no change. |
| Commutation with `ℤ_ℓ → O → O′` (1078, item 1) | `A = ℤ_ℓ`, `A = ℤ/ℓ` at a point, `d = 2` | `RHom_O(ℤ_ℓ ⊗ O, O) = O = RHom_ℤℓ(ℤ_ℓ,ℤ_ℓ) ⊗ O` (both `ℤ_ℓ²` as modules). `RHom_ℤℓ(ℤ/ℓ,ℤ_ℓ) ⊗ O = (ℤ/ℓ)[−1] ⊗ O = (O/ℓ)[−1] = RHom_O(O/ℓ,O)`. Finite freeness of `O` over `ℤ_ℓ` is what makes `⊗O` exact and commute with `RHom`. | Pass; no change. |
| Rational Hom and full faithfulness over `E` (1079, item 2) | `A = B = O`; `A = O/ϖ, B = O`; at a point | `Hom(O, O ⊗ E) = E = O ⊗_ℤℓ ℚ_ℓ`. `Hom(O/ϖ, E) = 0`, and `Hom(O/ϖ,O) = 0`, `Ext¹ = O/ϖ`, both `⊗ℚ_ℓ = 0`. Compactness of `A` is needed: for the noncompact `A = ⊕_ℕ O`, `Hom(A, O⊗E) = ∏ E ≠ (∏ O) ⊗ ℚ_ℓ` (unbounded denominators). | Pass; compactness hypothesis is in the statement. |
| `ℚ̄_ℓ` form (1080, item 3) | `A = B = E_X` at a point | 2-colimit Hom: `colim_{E′} E′ = ℚ̄_ℓ`. Solid side: `End(ℚ̄_ℓ) = ℚ̄_ℓ` as `ℚ̄_ℓ = colim E′` and `E` is compact. The completion model gives `End(ℂ_ℓ) = ℂ_ℓ ≠ ℚ̄_ℓ`. | Pass; no change. |
| Check 1: geometric point (1088) | `Λ_disc = O, E, ℚ̄_ℓ` | FS VII.6.5: `D_lis(Spa C,Λ) = D(Λ_disc)`; scalar extension `O → E` sends `O/ϖ ↦ 0`, `O ↦ E`, i.e. ordinary base change. | Pass; no change. |
| Check 3: `Spec C` (1090) | `O`, `O/ℓ` | `O ↦ O`; rationally `O/ℓ ↦ 0`, `O ↦ E` (`O ⊗ ℚ_ℓ = E`). | Pass; no change. |
| Scope paragraph, supplier bullet, `*Needs:*` and layer dependencies (39, 89, 998, 1084, 1111) | EtaleCohomologyFoundations on main vs. #1891 | On main: §F.0.1 stalkwise invertibility, F.4.1 `ℤ/ℓⁿ`, F.4.3 `ℤ_ℓ,X` only, F.4.5 `ℤ_ℓ,X[1/ℓ]`, `O_E` lattices, `ℚ̄_ℓ` over finite `E`. Cited: class and lemma names, `(Λ,I)`, `𝒪_E,X/E_X/ℚ̄_ℓ,X`, 2-colimit — present only in #1891. | R01. |
| `Suggested.lean` header and docstring (1–3, 20–21, 34) | elaboration; gate | Three `sorry` warnings only; gate `imports=0 build=0`. Docstring's "§F.4.3 ring objects" is the same drift. | Header passes; docstring in R01. |

## Not verifiable

- Nothing in this round. FS was read from the author-hosted edition in the sources cache (383 PDF pages, printed pagination), and EtaleCohomologyFoundations was read on main and at the head of its revision pull request #1891.
- Ownership of the `𝒪_E` and `ℚ̄_ℓ` scheme-coefficient objects against open pull requests not listed with files in the brief was not checked beyond the index search.

## Source issues

- none
