# Review of EtaleBaseChange (pull request #196 at 4bd7237)
Folder: `TauCetiRoadmap/CohomologicalPointCounting/EtaleBaseChange/`

**Verdict:** rejected

The roadmap re-plans material that roadmaps on main already own, layer by layer (R01). That is not repairable by edits to this folder: once every target that exists elsewhere is deleted and cited, nothing of this roadmap's own remains. The gate also fails (R06, R07), so there is no acceptance on this head in any case. The remaining findings are recorded so that whatever the family keeps of this material is written correctly where it ends up.

## R01 (P1) — Every layer re-plans a roadmap on main

Location: `TauCetiRoadmap/CohomologicalPointCounting/EtaleBaseChange/README.md` lines 123–140 ("What is missing: build here … 1. the geometric morphism of small étale topoi … 14. explicit fibre-transport interfaces") and Layers 0–9 (lines 144–352).

Claim: the README says "Mathlib does not supply the full derived proper/smooth base-change and finiteness theory in the form required here" (line 121) and plans items 1–14 as new work; it names no Tau Ceti roadmap as supplier or owner of any of them. The only roadmap it cites as a dependency is the sibling `ConstructibleEtale` (line 37).

Witness: each layer is already a planned target of a roadmap on the content repository's main branch, earlier in the merge order (SchemeAndStackFoundations at position 2, EnhancedDerivedSheaves 17, EtaleCohomologyFoundations 18; this roadmap is placed at 393):

| This README | Owner on main | Where |
|---|---|---|
| Layer 0: site functor `U ↦ U×_Y X`, `f^* ⊣ f_*`, exactness, small-étale specialisation | SchemeAndStackFoundations §2.1 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md` lines 3265–3300 (`Functor.sheafPullback`, `sheafPushforwardContinuous`, "including its small-étale specialization") |
| Layer 1: `R^i f_*` as sheafification of `V ↦ H^i(u(V),F)`, stalks | SchemeAndStackFoundations §2.1 | same, `higherDirectImage_iso_sheafify` (line 3290) |
| Layer 2: `Rf_* : D⁺ → D⁺`, `R(g∘f)_* ≅ Rg_* Rf_*`, Leray | SchemeAndStackFoundations §§2.1–2.2 | `Sheaf.derivedPushforward`, `derivedPushforward_comp` (line 3291), `leray_spectral_sequence` (line 3311) |
| Layer 3: the exchange `g^*Rf_*K → Rf'_*g'^*K`, identity and pasting coherence, agreement on `H⁰` | EnhancedDerivedSheaves §0.4 | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` lines 494–504 (`ClassicalDerived.functorCoherence`: "the canonical exchange has direction `g*Rf*K→Rf′*g′*K` and agrees on `H⁰`…", "Two Cartesian squares give the same exchange transformation as their outer rectangle") |
| Layer 4: smooth base change, rotated square, qcqs `g`, limit corollary, separably closed extension | EtaleCohomologyFoundations F.2.2 | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` lines 522–538, `VanishingCycles.smoothBaseChange`, same square, same hypotheses, same corollaries |
| Layer 5: proper base change for all torsion, `D⁺` form, stalk formula | EtaleCohomologyFoundations F.2.1 | lines 504–520, `VanishingCycles.properBaseChange` ("No Noetherian or invertibility hypothesis", "geometric-stalk forms") |
| Layer 6: `H^q = 0` for `q > 2 dim X`, affine Artin vanishing, constructibility and `Dᵇ_ctf` preservation under proper `f`, finiteness over separably closed `k` | EtaleCohomologyFoundations F.3.0 and F.3 | lines 629–643 (`etaleCohomologicalDimension`), 678–684 (`affineArtinVanishing`), 692–699 (`etaleFiniteness`) |
| Layer 7: local and universal local acyclicity by strict-local fibre comparison, base-change stability, smooth ULA, tensor and triangle stability, cospecialisation with path composition | EtaleCohomologyFoundations F.2.3 | lines 540–563, `VanishingCycles.localAcyclicity`, citing the same Stacks Definition 59.93.1 (0GJP) |
| Layer 8: lisse `R^i f_*` for smooth proper `f`, stratum version under ULA and constructibility, path transport with identity/composition laws | EtaleCohomologyFoundations F.3 | lines 707–716, `VanishingCycles.lisseDirectImageTransport` ("A supplied étale path transports fibre cohomology, with identity/inverse/composition…") |
| Layer 9: `K ⊠ L`, `RΓ(X,K)⊗^L RΓ(Y,L) ≅ RΓ(X×Y, K⊠L)` without properness | EtaleCohomologyFoundations F.2.6 | lines 645–670, `VanishingCycles.etaleKunneth` |

EtaleCohomologyFoundations' scope sentence (line 7) claims exactly this list: "proper and smooth base change, local acyclicity, finite-coefficient Künneth, cohomological dimension and constructible finiteness", and its `Suggested.lean` lists the declarations (`TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean` lines 521–526). The family's own siblings (`CompactSupport/README.md` lines 102, 387) cite `EtaleBaseChange` as the owner of proper base change, so the duplication propagates: those citations must point at EtaleCohomologyFoundations F.2.1 instead.

Repair: delete this folder. In the family index and in the sibling READMEs, cite the owners by name and section: SchemeAndStackFoundations §§2.1–2.2 for `Rf_*`, stalks and Leray; EnhancedDerivedSheaves §0.4 for the exchange transformation and its pasting; EtaleCohomologyFoundations F.2.1, F.2.2, F.2.3, F.2.6, F.3.0 and F.3 for the theorems. A difference in generality or a genuinely new statement (none was found in this README: every hypothesis here is the same as or weaker than the owner's) would be an "EtaleCohomologyFoundations, Part II" roadmap whose introduction says where the base roadmap stops; it would not be a new family member planning the same theorems. Tested: the dependency check accepts a README with those citations (all three owners are earlier in the merge order than any position this family can take).

## R02 (P2) — Layer 6 constructibility of `R^i f_* F` is stated without the hypotheses that make it true

Location: `README.md` line 291, "constructibility of `R^i f_* F` for proper `f`".

Claim: for every proper `f` and (by the bullet's wording) every `F`, `R^i f_* F` is constructible.

Witness: `A = k[x₁, x₂, …]`, `𝔪 = (x₁, x₂, …)`, `f : Spec k → Spec A` the closed immersion at `𝔪` (proper), `F = ℤ/ℓ` (constructible). `f_* F` is the skyscraper at `𝔪`. Its support `V(𝔪)` is closed with non-quasi-compact complement `⋃ D(xᵢ)`, so it is not a constructible subset, and no finite constructible stratification of `Spec A` makes `f_*F` finite locally constant on strata (on the stratum through `𝔪` the stalk rank would have to be constant, but `{𝔪}` is not open in any `D(g) ∩ V(J)` with `J` finitely generated). So `R⁰f_*F` is not constructible. Without constructibility of `F` the bullet fails already for `f = id`, `F = ⨁_{n≥1} ℤ/ℓ`. The owner states the theorem with "proper `f : X → Y` between Noetherian schemes", "constructible `F`" and `N` invertible on `Y` (`EtaleCohomologyFoundations/README.md` line 693); Stacks' own form uses finite type over a field or Noetherian bases.

Repair: state "for proper `f : X → Y` between Noetherian schemes and constructible `F` of `Λ`-modules with `Λ` killed by an integer invertible on `Y`, `R^i f_* F` is constructible", with the two instances above as negative-control Checks. The same bullet list has "finiteness of `H^i(X,K)` for proper `X` over a separably closed field" (line 290) with no class stated for `K`; `K = ⨁_{n≥1} ℤ/ℓ` on a point has infinite `H⁰`, so write `K ∈ Dᵇ_ctf(X,Λ)` there too. (After R01 these statements live in EtaleCohomologyFoundations F.3, which already carries the hypotheses.)

## R03 (P2) — The summit and the Künneth target are colloquial: no statement, no hypotheses, no locator

Location: `README.md` line 352, "**Summit:** proper/smooth base change and the lisse-direct-image theorem provide a complete, path-aware comparison of fibre cohomology in families." and lines 342–348 (Layer 9: "For schemes `X, Y` over a separably closed field … under the standard finiteness/Tor hypotheses").

Claim: a summit theorem exists; Künneth holds for schemes over a separably closed field.

Witness: the summit names no morphism, coefficient class, hypothesis or conclusion, and has no locator; the seeded sample could only be checked against the nearest theorems in the sources: Stacks Lemma 59.94.3 (`stacks-03N1` line 9223: `f` proper, `K ∈ D⁺` with torsion cohomology, `f` locally acyclic relative to `K`; then specialisation and cospecialisation are isomorphisms) and Stacks Theorem 59.91.11 (line 8827). Neither is what the sentence says, and "complete" is not a mathematical hypothesis. For Künneth, Stacks Lemma 59.97.9 (line 9935) requires `X, Y` of finite type over `k` (its proof uses `cd(X) < ∞` from Lemma 59.96.2, line 9464, which needs finite type); "schemes" with "standard finiteness/Tor hypotheses" neither states finite type nor says which Tor condition on `K, L` is meant (the owner's statement, F.2.6, says `K, L ∈ Dᵇ_ctf` and finite type).

Repair: state the summit as a theorem with its quantifiers: "for `f : X → S` proper, `K ∈ Dᵇ_ctf(X,Λ)` with `Λ` killed by an integer invertible on `S`, and a connected locally closed Noetherian stratum `T ⊂ S` on which `R(f_T)_*K_T` is constructible and `(f_T, K_T)` is ULA, `R^i(f_T)_*K_T` is lisse, its stalk at `s̄` is `H^i(X_{s̄},K)` (Stacks Lemma 59.91.13), and an étale path `s̄₀ ⇝ s̄₁` induces an isomorphism of stalks compatible with concatenation" (SGA 4 XVI; Stacks Lemma 59.94.3). State Künneth for finite-type `X, Y` over separably closed `k`, `Λ` killed by an integer invertible in `k`, `K, L ∈ Dᵇ_ctf` (Stacks Lemma 59.97.9). Both already exist in that form in EtaleCohomologyFoundations F.3 and F.2.6 (see R01).

## R04 (P3) — Layer 4 states smooth base change below the source's generality

Location: `README.md` line 237, "every section is annihilated by an integer invertible on `S`".

Claim: the torsion hypothesis of smooth base change is that each section is killed by one integer invertible on `S`.

Witness: Stacks Theorem 59.89.2 (`stacks-0EYQ` line 8199) assumes only that the stalks at geometric points are torsion of orders invertible on `S`. For `T = Spec k`, `F = ⨁_{n≥1} ℤ/ℓⁿ`, the section `(1)_m` over the étale `U = ∐_{m≥1} Spec k` has components of order `ℓ^m` and is killed by no single integer, while every stalk is torsion of order a power of `ℓ`; the source asserts the conclusion for this `F`, the README does not.

Repair: "every section is étale-locally annihilated by an integer invertible on `S`", or Stacks' stalkwise phrasing. (EtaleCohomologyFoundations F.2.2 uses the same global phrasing and should read the same way; that is a note for its owner, not a finding here.)

## R05 (P3) — README shape: no Summary, scope, conventions, supplier contracts, `*Needs:*` lines, Checks, Examples, Dependencies or References

Location: `README.md` throughout; e.g. line 1 (`# Roadmap: …` with no `**Summary.**`), line 21 ("Suggested code home"), line 40 ("`Suggested.lean` is nonexhaustive"), lines 144–352 (layers written as bullet lists with no `### k.n` subsections, no `*Needs:*` lines, no `**Checks.**`, no `### Examples`, no `### Dependencies`), line 366 ("Design notes for Lean"), line 395 ("Completion criterion").

Claim: the README is in TauCetiRoadmap form.

Witness: compare `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` lines 5–57 (Scope and ownership, Conventions, Exact supplier contracts) and 504–520 (a target with hypotheses, locator, `*Needs:*` and three Checks). This README has no locator at any claim (the only locators are the table at lines 50–58, which omits Layers 1, 3 and 8 entirely), no Check anywhere, and no supplier cited by section. Its prose includes process and instruction text that is not roadmap content: "Do not build a theorem-specific derived functor only for proper maps" (line 203), "This layer is complete only when downstream proofs can invoke pasting without unfolding the construction" (line 223), "Do not hide a dimension induction behind a citation" (line 294), "Do not expose an unqualified `fiberCohomologyEquiv`" (line 338).

Repair: if any part of this material survives R01, write it in the house shape: `**Summary.**`, `## Scope and ownership` naming what is deferred to SchemeAndStackFoundations §§2.1–2.2, EnhancedDerivedSheaves §0.4 and EtaleCohomologyFoundations F.2–F.3, `## Exact supplier contracts` by declaration, `### k.n` prose targets with hypotheses, a locator at each claim and a `*Needs:*` line, at least three discriminating Checks per definition, `### Examples` and `### Dependencies` per layer, `## Downstream consumers`, `## References`.

## R06 (P3) — Gate: LaTeX and TeX delimiters (88 + 43)

Location: `README.md` lines 7–19, 64–102, 129–131, 146–201, 209–247, 258–347 (every display and most inline formulas use `\[ … \]` and `\( … \)`, `_{…}`, `\mathrm`, `\operatorname`).

Claim: the text is in house style.

Witness: the gate reports `latex=88 tex=43 … FAIL`; rule: no LaTeX delimiters or TeX-only syntax outside code spans and code blocks.

Repair: Unicode with ASCII inside backtick code spans, e.g. `g^*Rf_*K → Rf'_*g'^*K`, `H^q(X, F) = 0` for `q > 2 dim X`; display formulas become code spans or indented code blocks.

## R07 (P3) — Gate: `metadata.toml` missing

Location: `TauCetiRoadmap/CohomologicalPointCounting/EtaleBaseChange/` (no `metadata.toml`).

Witness: gate line "`metadata.toml` missing"; every roadmap folder on main carries one.

Repair: add the folder's `metadata.toml` in the form used by the roadmaps on main (moot if R01's repair deletes the folder).

## R08 (P3) — `Suggested.lean` does not say which headline theorems are not statable, nor what the pin lacks, and carries process text

Location: `TauCetiRoadmap/CohomologicalPointCounting/EtaleBaseChange/Suggested.lean` lines 6–14 ("This file is not the roadmap and is not exhaustive … depend on types built in the preceding roadmap. Do not invent empty predicates … Prototype their canonical transformations and `IsIso` theorems here once the types exist.") and line 19 ("`-- No compiled targets yet; see README.md.`").

Claim: the headline theorems cannot be stated at the pins because of types owed by `ConstructibleEtale`.

Witness: the sheaf-level headlines (proper base change for torsion abelian sheaves, smooth base change, the `2 dim X` bound) need nothing from `ConstructibleEtale`; what the pin lacks is the direct image along a scheme morphism on small étale sheaves: Mathlib 9caeba1 has `Scheme.smallEtaleTopology` (`Mathlib/AlgebraicGeometry/Sites/Etale.lean` line 50), `MorphismProperty.Over.pullback` (`Mathlib/CategoryTheory/MorphismProperty/OverAdjunction.lean` line 97), `sheafPushforwardContinuous` (`Mathlib/CategoryTheory/Sites/Continuous.lean` line 357), `sheafPullback` and `sheafAdjunctionContinuous` (`Mathlib/CategoryTheory/Sites/Pullback.lean` lines 55, 59, 75) and `Functor.rightDerived` (`Mathlib/CategoryTheory/Abelian/RightDerived.lean` line 110), but no `IsContinuous` instance for `MorphismProperty.Over.pullback` under `smallGrothendieckTopology` (the only such instance, `Mathlib/CategoryTheory/Sites/Over.lean` line 372, is for the plain `Over` category). So `f_*` on `Sheaf X.smallEtaleTopology AddCommGrpCat` is a theorem away, and an empty file is the correct form; the docstring must then name each headline (proper base change, smooth base change, cohomological dimension, finiteness, lisse direct images, Künneth) and that missing carrier, with no instructions to contributors and no "yet".

Repair: a module docstring listing those headlines as not statable because the pinned Mathlib has no continuous étale pullback functor between `smallEtaleTopology` sites (and no étale geometric stalk functor), and nothing else in the file.

## Verified sound

Dependency check (the command from the brief, run on this head):

```text
depcheck: 163 roadmaps, 1163 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The README has no `*Needs:*` lines or supplier-table rows, so the check has nothing to test; the merge-order candidate places EtaleBaseChange last (line 393 of 393), after SchemeAndStackFoundations (2), EnhancedDerivedSheaves (17) and EtaleCohomologyFoundations (18). Its only named dependency, `ConstructibleEtale`, is a sibling in the same pull request; `CompactSupport` is named only as a consumer.

Out-of-folder changes: the diff of `origin/main...HEAD` excluding the seven roadmap folders and the family index is empty (the index edits were dropped in the head commit).

Build: `lake env lean` on `Suggested.lean` exits 0 with no output; the file declares nothing, so there is no `#check @name` comparison to make and no one-tactic padding probe to run (zero sorried declarations).

Source locators (one chapter text, `stacks-03N1`, Stacks version ed88ff78 of 14 July 2026, also reached as `stacks-0EYQ`, `stacks-095S`, `stacks-0GJP`): the section numbers the README cites all match the current numbering: 34–38 functoriality of small étale topoi (line 41–45), 53 stalks of higher direct images and 54 Leray (64–65), 86–88 base-change preliminaries (97–101), 89 smooth base change = tag 0EYQ (102, 8145), 91 proper base change = tag 095S (104, 8616), 93 local acyclicity and 94 cospecialization (106–107), 95–96 cohomological dimension (108–109), 97 Künneth (110). Tag 0GJP is Definition 59.93.1 (line 9038).

Adversarial table (values computed on each side):

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| Layer 5 proper base change, "no invertibility hypothesis" | `f : Spec L → Spec k`, `[L:k]=2` separable, `g : Spec k̄ → Spec k`, `F` any abelian sheaf | `R^q f_* F = 0` for `q>0` both sides (Stacks Prop. 59.55.2); `g^*f_*F` and `f'_*g'^*F` both `F_{x̄}⊕F_{x̄'}` (two geometric points of `X'`) | agrees | none |
| same, residue-characteristic torsion | `F = ℤ/p` on `X` proper over `S` of characteristic `p` | Stacks Thm 59.91.11 (`stacks-095S` line 8839) assumes only "abelian torsion sheaf" | README's claim supported | none |
| Layer 5 stalk formula `(R^i f_*K)_{ȳ} ≅ H^i(X_{ȳ},K)` | `f` proper, `K ∈ D⁺` torsion | Stacks Lemma 59.91.13 (line 8884) | supported | none |
| Layer 4 smooth base change hypotheses | `T = Spec k`, `F = ⨁ ℤ/ℓⁿ`, section `(1)_m` over `∐_m Spec k` | orders `ℓ^m` unbounded; no single integer kills the section; all stalks torsion of order a power of `ℓ` | README narrower than Thm 59.89.2 | R04 |
| Layer 4 limit corollary | `S' = lim Sᵢ` smooth over `S`, affine transitions, `f` qcqs | Stacks Lemma 59.89.3 (line 8526) requires exactly these | supported | none |
| Layer 6 `H^q(X,F)=0`, `q > 2 dim X` | `X = ℙ¹_{k̄}`, `F = ℤ/ℓ`, `ℓ ≠ char k` | `H² = ℤ/ℓ ≠ 0` at `q = 2 = 2 dim X`; `H^q = 0` for `q ≥ 3` | bound sharp, true | none |
| Layer 6 affine bound `q > dim X` | `X = 𝔾_m`, `F = ℤ/ℓ` | `H¹ = ℤ/ℓ` (Kummer), `H² = 0`; Stacks Prop. 59.95.6 (line 9332) gives `cd(X) ≤ dim X + cd(K)` for all torsion `F` | true; README's invertibility hypothesis is unneeded in the affine case | none (R05 covers hypotheses) |
| Layer 6 constructibility of `R^i f_*F`, proper `f` | `f = id`, `F = ⨁ ℤ/ℓ`; `f : Spec k → Spec k[x₁,x₂,…]` at `𝔪`, `F = ℤ/ℓ` | `R⁰f_*F = F` not constructible; skyscraper at `𝔪`, support not constructible (complement not quasi-compact) | false as written | R02 |
| Layer 6 finiteness of `H^i(X,K)`, proper `X` | `X = Spec k̄`, `K = ⨁ ℤ/ℓ` | `H⁰ = K` infinite | false without `K ∈ Dᵇ_ctf` | R02 |
| Layer 7 definition of local acyclicity | Stacks Def. 59.93.1 (line 9046): isomorphism of `(93.0.1)` for every geometric point `t` of `Spec O^sh_{S,s}`; ULA = after every base change `S' → S` | README's "strict-local neighbourhoods", "stable under base change" | agrees | none |
| Layer 8 lisse `R^i f_*K`, smooth proper `f` | elliptic family `E → S` in characteristic `p` with ordinary and supersingular fibres, `K = ℤ/p` | `R¹f_*ℤ/p` has stalk rank 1 at ordinary, 0 at supersingular points | not lisse: invertibility of `Λ`'s annihilator (standing convention line 64) is needed and present | none |
| Layer 8 stratum version | Stacks Lemma 59.94.3 (line 9223): proper `f`, `K ∈ D⁺` torsion, locally acyclic ⇒ `sp`, `cosp` isomorphisms | README gives no hypotheses | colloquial | R03 |
| Layer 9 Künneth | Stacks Lemma 59.97.9 (line 9935): finite type `X, Y` over separably closed `k`, `n` invertible in `k`, arbitrary `E ∈ D(X,ℤ/n)`, `K ∈ D(Y,ℤ/n)` | README: "schemes", "standard finiteness/Tor hypotheses" | hypotheses unstated; source needs finite type | R03 |
| Layer 9, `X = Y = 𝔸¹_{k̄}`, `K = L = ℤ/ℓ` | `RΓ(𝔸¹) = ℤ/ℓ[0]`, `RΓ(𝔸²) = ℤ/ℓ[0]`, tensor `ℤ/ℓ[0]` | agrees (non-proper case) | none |
| Worked example 2, `ℙⁿ_S → S` | `S = Spec k̄`, `n = 1`, `Λ = ℤ/ℓ` | stalk of `R²f_*Λ` = `H²(ℙ¹) = ℤ/ℓ(−1)`, fibre cohomology the same | agrees with Lemma 59.91.13 | none |
| Worked example 3, finite étale `f` | `f : Spec L → Spec k`, `[L:k] = 2` | `f_*Λ` = permutation module `Λ[Gal]`-induced of rank 2, `R^q f_* = 0`, `q>0` | agrees | none |
| Worked example 7, Künneth on finite étale schemes | `X = Y = Spec(k̄ ⊔ k̄)` | `RΓ(X) = Λ²`, `RΓ(X×Y) = Λ⁴ = Λ²⊗Λ²` | agrees | none |
| Summit | no quantifiers | nearest theorems: Lemma 59.94.3, Thm 59.91.11 | not a statement | R03 |

Library declarations opened at the pins (Mathlib 9caeba1):

- `AlgebraicGeometry.Scheme.smallEtaleTopology`, `Mathlib/AlgebraicGeometry/Sites/Etale.lean` line 50; `smallEtalePretopology` line 54; `geometricFiber` line 64 (a point of the big étale topology, not a small-site stalk functor).
- `AlgebraicGeometry.Scheme.AffineEtale.sheafEquiv`, `Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean` line 133, and the `IsGrothendieckAbelian` instance at line 145 (the README's "small affine étale site, and sheaf equivalence" and "Grothendieck-abelian sheaf categories" claims are true).
- `CategoryTheory.Functor.sheafPushforwardContinuous`, `Mathlib/CategoryTheory/Sites/Continuous.lean` line 357; `sheafPullback`, `sheafAdjunctionContinuous`, `Mathlib/CategoryTheory/Sites/Pullback.lean` lines 55, 59, 75 (the README's "generic sheaf inverse/direct-image adjunctions" claim is true).
- `CategoryTheory.Functor.rightDerived`, `Mathlib/CategoryTheory/Abelian/RightDerived.lean` line 110.
- `CategoryTheory.MorphismProperty.Over.pullback`, `Mathlib/CategoryTheory/MorphismProperty/OverAdjunction.lean` line 97; `Etale` is stable under base change (`Mathlib/AlgebraicGeometry/Morphisms/Etale.lean` line 73); no `IsContinuous` instance for this functor under `smallGrothendieckTopology` (R08).
- `AlgebraicGeometry.Scheme.ellAdicSheaf`, `EllAdicCohomology`, `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean` lines 71, 75 (family-index claim, true).
- `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean` and `Smooth.lean` exist (the README's morphism-property list).

Cross-roadmap citations resolved: `ConstructibleEtale` (sibling folder in this pull request, present), `CompactSupport` (sibling, present, cites this roadmap as owner of proper base change at its lines 102 and 387). The worker's citation scan found no unresolved citation or Lean name; confirmed. Ownership was checked by object against main (grep of every roadmap README for proper base change, smooth base change, Künneth, local acyclicity, cospecialisation, Leray) and, through the roadmaps index, against the open roadmap pull requests: the owner of every object is on main (R01); the open pull requests that mention proper base change (EtaleDualityAndPerverseSheaves, ClassicalAdicEtaleCohomologyPartII, DiamondSixOperations, LefschetzPencilsAndVanishingCycles and others) consume it and do not build a second copy.

Declared gaps: none declared (no readable `design/plan.json`); nothing to check.

Previous AI review: none.

## Not verifiable

- SGA 4, Exposés XII, XIV, XVI (README line 47): no open legal copy is known to the sources service; cited by locator only. No statement in the README depends on a passage that Stacks does not also give.
- J. S. Milne, *Étale Cohomology*, Chapter VI §§1–4 (line 48): Princeton University Press, paywalled; cited by locator only.
- Ownership against open pull requests was checked through the roadmaps index for the objects named above only; every other open pull request was not read.

## Source issues

- none
