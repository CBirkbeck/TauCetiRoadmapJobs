<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13813#issuecomment-6797823865 -->
Review (claude) of 6a76302

Verdict: needs_changes

1. **F01** (P2) 7.2 defines as its own a notion the pinned Tau Ceti already has (`TauCeti.IsReplete`), and 7.2–7.5 carry a hypothesis the pinned instance makes redundant

   Location: `packages/SpectralSequencesAndConvergence/design/README.md` line 1264–1265, "Define: `C`
   has *lim-acyclic epimorphic towers* if `C` has countable products and every tower whose transitions
   are epimorphisms has `lim¹ = 0` and epimorphic limit projections"; line 1268–1269, 1322–1323
   ("`CountableAB4Star`, exact sequential colimits and lim-acyclic epimorphic towers"), 1395; Summary
   line 19–21; Scope line 43–44; Conventions line 93–95; plan targets 7.2, 7.3, 7.4 (statements, 7.4
   hypothesis 5).

   Claim: the hypothesis is a new notion this roadmap owns, independent of `CountableAB4Star`.

   Witness: `TauCeti/CategoryTheory/Limits/Replete.lean` line 91 (`class IsReplete`: for every tower
   of epimorphisms the projection of every limit cone to `F 0` is an epimorphism), line 107
   (`IsReplete.epi_π_app`: every projection), line 357 (`instance countableAB4Star [Abelian C]
   [HasCountableProducts C] [IsReplete C]`). In an abelian category with countable products the two
   notions coincide. Lim-acyclic gives replete by definition. Conversely, for an epimorphic tower
   `f_n : F_{n+1} ↠ F_n` put `T = ∏ F_k` and `P_n = F_n ⊕ T` with transitions
   `(a, t) ↦ (f_n a + π_n t, t)` (the composite of `f_n ⊕ 1` and a shear, so epimorphisms). The cone
   `∏ F_n → P_n`, `x ↦ (π_n x, (1 − s) x)`, is a limit cone: a compatible family is `(x_n, t)` with
   `x_n − f_n x_{n+1} = π_n t`, that is `(1 − s)x = t`. Repleteness makes `∏ F_n → P_0 = F_0 ⊕ T`
   an epimorphism, hence `1 − s` is one and `lim¹ F = 0`. So "lim-acyclic epimorphic towers" is
   `HasCountableProducts` plus `TauCeti.IsReplete`, an invented name for the literature's (Bhatt–Scholze,
   Definition 3.1.1) and the library's "replete", and `CountableAB4Star` in 7.2 (Mittag–Leffler
   statement), 7.4 and 7.5 follows from the other hypotheses. SchemeAndStackFoundations §2.17 (on
   main) already cites the class and plans *IsReplete.derived_limits* for abelian sheaves on a replete
   topos.

   Repair:
   - 7.2: delete the definition. Write "`C` is *replete* (Tau Ceti `TauCeti.IsReplete`,
     `TauCeti/CategoryTheory/Limits/Replete.lean`): the projections of every limit cone of a tower of
     epimorphisms are epimorphisms (`TauCeti.IsReplete.epi_π_app`). Prove: an abelian category with
     countable products is replete if and only if every tower with epimorphic transitions has
     `lim¹ = 0` (route: the tower `F_n ⊕ ∏ F_k` above). Prove: an abelian category with countable
     products and enough projectives is replete." Keep the Mittag–Leffler statement with the
     hypothesis "countable products and replete"; `CountableAB4Star` is then Tau Ceti's instance
     `TauCeti.IsReplete.countableAB4Star`, cited, not assumed. Keep the Neeman sentence (exact products
     do not give repleteness).
   - 7.3 bullet, 7.4, 7.5, Summary, Scope, Conventions: replace "lim-acyclic epimorphic towers" by
     "replete"; in 7.4 the hypotheses on `C` become "countable products and coproducts, exact
     sequential colimits, replete". 7.1 and the main statement of 7.3 keep `CountableAB4Star` (they do
     not use repleteness).
   - Supplier contracts, "From Tau Ceti": add `TauCeti.IsReplete`, `TauCeti.IsReplete.epi_π_app`,
     `TauCeti.IsReplete.countableAB4Star`, `TauCeti.isReplete_sheaf`
     (`TauCeti/CategoryTheory/Sites/Replete.lean` line 48). Scope: add to the Tau Ceti item "replete
     categories"; add "SchemeAndStackFoundations §2.17: replete topoi and *IsReplete.derived_limits*
     for abelian sheaves, an instance of 7.2". `*Needs:*` of 7.2–7.5 and the plan's prerequisites
     (`tauceti:TauCeti.IsReplete`), statements and 7.4's hypothesis list likewise.
   - Module bullet of 7.2: "`ModuleCat.{u} R` for `R : Type u` is replete (enough projectives)". The
     route through `TauCeti.IsReplete.of_reflectsEpimorphisms` (line 118) along the forgetful functor
     to types (`ModuleCat.forget_preservesEpimorphisms`, `Mathlib/Algebra/Category/ModuleCat/EpiMono.lean`
     line 67) would give every universe; it was located, not elaborated.

   Tested on the instances of 7.2's Checks: `ℤ/ℓ^{n+1} ↠ ℤ/ℓ^n` in `ModuleCat ℤ` (replete: `ℤ_ℓ → ℤ/ℓ^n`
   onto, `lim¹ = 0`, and `1 − s` onto `∏ ℤ/ℓ^n` as the construction predicts); the tower `×ℓ` on `ℤ`
   is not epimorphic, so repleteness says nothing and `lim¹ = ℤ_ℓ/ℤ ≠ 0` stays consistent. The proofs
   of 7.2–7.5 use only "epimorphic towers have epimorphic projections and `lim¹ = 0`" and exact
   countable products; both remain available.

2. **F02** (P3) four `DoubleComplex.*` names attributed to DerivedModuleAlgebra §S.1 do not exist there

   Location: `packages/SpectralSequencesAndConvergence/design/README.md` line 287–289 ("with
   `DoubleComplex.abutmentFiltration`, `DoubleComplex.eInftyIsoGr`, `DoubleComplex.page_eq_eInfty` and
   `DoubleComplex.fiveTerm_exact`"), line 758, line 961–963 (also `DoubleComplex.spectralSequence`).

   Claim: these are §S.1's declarations.

   Witness: `TauCetiRoadmap/DerivedModuleAlgebra/README.md` on main (87f83a6) has only
   `DoubleComplex.totalCohomology_of_exact_rows`, `DoubleComplex.edgeBottom`, `DoubleComplex.edgeLeft`,
   `DoubleComplex.spectralSequence_map` (line 65); §S.1 (line 955–1012) states the rest in prose.
   `roadmaps grep` finds the five names at no open head.

   Repair: line 287–289: "§S.1: the first-quadrant double-complex spectral sequence, its column
   filtration of `Hⁿ(Tot A)`, the identification `E_∞^{pq} ≅ FᵖH^{p+q}/F^{p+1}H^{p+q}`, the
   stabilisation for `r > max(p, q + 1)`, the edge morphisms (`DoubleComplex.edgeBottom`,
   `DoubleComplex.edgeLeft`) and the five-term sequence." Line 758 and 961–963: name "§S.1's graded
   identification and five-term sequence" and "§S.1's spectral sequence" in prose. Scope line 72: §S.1
   is stated for an abelian category, not only for modules. A comparison citation, not a supply.

3. **F03** (P3) 5.4 does not contain Tau Ceti's exhaustiveness theorem

   Location: `packages/SpectralSequencesAndConvergence/design/README.md` line 1080–1083, "this contains
   Tau Ceti's `CochainComplex.exists_mem_range_filtrationAbutmentFiltrationι` in that universe"; first
   Check, line 1088–1089.

   Claim: 5.4 implies the Tau Ceti theorem on modules.

   Witness: `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Exhaustive.lean` line 96–99: the only
   hypothesis is that every element of `K^n` lies in some step. 5.4 also assumes exhaustiveness on
   `K^{n−1}` and bounded below on `K^n`, `K^{n+1}`. The `ℓ`-adic filtration of `ℤ` in degree `0`
   (5.4's third Check) satisfies Tau Ceti's hypothesis and not 5.4's.

   Repair: "The exhaustiveness step of the route (exhaustive on `K^n` alone makes the induced
   filtration of `H^n` exhaustive) is, for `ModuleCat R`, Tau Ceti's
   `CochainComplex.exists_mem_range_filtrationAbutmentFiltrationι`; the theorem contains DGFloer Layer
   1 item 3's classical convergence theorem." First Check: "…The exhaustiveness step then is Tau
   Ceti's statement." Tested on the `ℓ`-adic instance: the step applies (`F^0 H^0 = H^0`), the theorem
   does not.

Files reviewed: `packages/SpectralSequencesAndConvergence/design/README.md`,
`packages/SpectralSequencesAndConvergence/design/plan.json`,
`packages/SpectralSequencesAndConvergence/sources.toml`. Previous review: round 4 (R01 P2, R02 P3)
and its repair report. Both repairs hold. Three findings this round: one P2 (blocking), two P3.
Maintainer notes: none. No `Suggested.lean` exists at the design stage, so elaboration, the `#check`
comparison and the one-tactic probe are not available (this lane does not elaborate).

## The two repairs of round 4

| Id | Status | Repaired passage and check |
|---|---|---|
| R01 (P2) | repaired | 5.2 line 1009–1013: "The inclusion is an isomorphism if and only if (24.6.1) is an equality at `(p, n − p)`, and the projection if and only if (24.6.2) is. When both are equalities at every position of total degree in `I`, these comparisons are the `β`…". Fourth Check present (line 1026–1033); plan 5.2 agrees. Recomputed: see table. Conventions line 110–114 and 3.2's locator now separate given `β` from Stacks' canonical comparison. |
| R02 (P3) | repaired | Contract line 191–195: "`AB5` and `AB4Star` for `ModuleCat.{u} R` with `R : Type u` only, and `EnoughProjectives` for `ModuleCat.{v} R` under `Small.{v} R`"; 7.2 line 1280; 5.4, 7.4, 7.5 bullets likewise. At the pin: `ModuleCat/AB.lean` 28, 30, 38; `ModuleCat/Projective.lean` 60; `GrothendieckAxioms/Basic.lean` 99, 107–109, 129, 152, 166. |

Pattern pass. R01's pattern (an abstract `β` identified with a canonical map): every "iff" and
"weak" in the README was reread; 4.3–4.5, 5.3, 5.4 state convergence through 4.3's comparisons, and
3.3–3.6, 7.4, 7.5 use only existence of `β`. R02's pattern (library facts cited at a generality the
pin lacks) led to R01 and R03 above: every "contains", "is Tau Ceti's" and "from Mathlib's
instance" sentence was checked against the pinned declaration's hypotheses. No finding of round 4
was marked not actionable.

## Verified sound

**Principles.** No route-specific shortcut, no algorithm, no copied passage, no Lean at this stage;
layers are named by their mathematics and ordered by their `*Needs:*` lines. Declared gaps: none
(`plan.json` `gaps = []`). Gate output, verbatim:

    candidate: SpectralSequencesAndConvergence is not in the merge order yet; checked as if placed after StableHomotopyKTheory (the intake inserts it when its design is accepted)
    depcheck: 223 roadmaps, 1968 edges, 0 problem(s)

No UPWARD or CYCLE line. None of the never-cite roadmaps occurs in the README.

**Suppliers and citations resolved.** StableHomotopyKTheory at its open head: §§7.21–7.26 present,
§7.22 with degrees `a, b, c`, `D′ = im i`, `E′ = ker(jk)/im(jk)`, `j`-degree `b − a`, page `r ≥ 1`,
`d_r` of degree `c + b − (r − 1)a`; merge order line 17. On main: DGFloer Layer 1 item 3
(line 630–655: Weibel 5.5.1(2), 5.5.10, native page `r + 1` at `(2p + q + 1, −p − 1)`, as in the
Conventions); AlgebraicTopology "Stage 6 items 0–5 are §§6.0–6.5" (line 879, a mapping, so the
citation stays valid); DerivedModuleAlgebra §S.1 (line 955; names: R02); SchemeAndStackFoundations
§2.2 (line 4184) and §2.17 (line 4977); ComplexKahlerGeometry K8 (line 366 maps K8 to Layer 8).
Overlaps file: no pull request changes this roadmap, no dropped id, no revision-only id.

**Ownership against open pull requests** (`roadmaps grep` on main and the indexed open heads for
"limit page", "conditional(ly) converg", "whole-plane", "lim-acyclic", "replete"): exact couples and
conditional convergence are owned only by StableHomotopyKTheory §7.22, §7.26 (cited); repleteness by
Tau Ceti and SchemeAndStackFoundations §2.17 (R01); CrystallineCohomology and DiamondEtaleCohomology
consume or instantiate it for topoi. No second owner of towers, limit page, convergence structures
or abelian-category lim¹.

**Library declarations opened at the pins this round.** Mathlib:
`CategoryTheory/Filtration/Basic.lean` (`Filtration` as `I ⥤ MonoOver X`, `FilteredObject`; no
exhaustiveness or separation field, as the contract says); `ModuleCat/AB.lean` 28–40;
`ModuleCat/Projective.lean` 60; `GrothendieckAxioms/Basic.lean` 99–129, 152–170;
`SpectralObject/HasSpectralSequence.lean` 394–398 (`IsFirstQuadrant`: zero for `j ≤ 0` and for
`n < i`), 437–441 (`IsThirdQuadrant`: zero for `0 < i` and for `j ≤ n`);
`spectralSequenceFirstPageXIso` in `SpectralObject/FirstPage.lean`. Tau Ceti:
`SpectralObject/Abutment.lean` 44 (`abutment`), 50 (`abutmentFiltration (q n : ℤ)`, the image of
`H^n(⊥ ≤ q)`), 54, 76, 92, 114 (`isZero_abutmentFiltration` from `H^n(⊥ ≤ q) = 0`), 123
(`isIso_abutmentFiltrationι` from `H^n(q ≤ ⊤) = 0`); `SpectralObject/Comparison.lean` 121–131
(hypotheses: `H^m(⊥ ≤ i) = 0`, `i ≤ a`, `m ∈ {n, n + 1}`; `H^m(i ≤ ⊤) = 0`, `i ≥ b`,
`m ∈ {n − 1, n}`; page `r ≥ 2`); `Filtered/Exhaustive.lean` 96, 200;
`GrothendieckGroup/EulerCharacteristic.lean` 165 (the engine takes a function `w` with a homology
relation, so 2.3's route with `v` additive only on `P` applies); `Limits/Replete.lean` 91, 107,
118, 357. For the remaining contract names round 4's file-and-line record stands.

**Sources: the seeded sample**, read at the locators (no author-flagged unverified locator exists).
- 1.1: stacks-012K 2612–2619 (construction of `B₃`, `Z₃` from `d₂`); helle-rognes2024 65–70.
- 2.2: stacks-012K 3107–3116 (Definition 24.7; bounded below is `E^{p,n−p} = 0` for `p ≥ b`, as in
  the README), 3120–3130 (Lemma 24.8 (3)–(5)).
- 3.1: stacks-012K 2349–2368 (Definition 19.1 (7)–(9)); helle-rognes2024 81–84.
- 3.2: helle-rognes2024 94–98 (Definition 2.7, "there are isomorphisms", exhaustive included);
  stacks-012K 3131–3143 (Definition 24.9, "via Lemma 24.6").
- 3.3: stacks-012K 3055–3061 (Lemma 24.4, the induced morphism of spectral sequences).
- 3.4: stacks-012K 3152–3174 (Lemma 24.11 (2)–(4)), 3175–3197 (Lemma 24.12).
- 3.6: weibel1994 §5.2 and mccleary2001 Ch. 2, uncertified.
- 4.2: helle-rognes2024 145–152 (Definition 3.6).
- 4.4: stacks-012K 3202–3240 (Lemma 24.13).
- 4.6: weibel1994 5.2.12, uncertified.
- 5.2: stacks-012K 3062–3071, 3072–3106 ((24.6.1) at 3093, (24.6.2) at 3098), 3144–3151.
- 5.4: weibel1994 5.5.1, uncertified; stacks-012K 3202–3210.
- 6.3: stacks-012K 2834–2905 (§23, Definition 23.1 to Lemma 23.3, tags 012B–012D); weibel1994
  5.9.4, uncertified.
- 7.3: helle-rognes2024 225–229 (sequence (3.1), citing Boardman 3.4(b)), 205 and 213–214
  (Lemma 3.15 (c) and its proof).
- 7.5: weibel1994 5.5.10, eilenberg-moore1962 §7, uncertified.
- Also read: helle-rognes2024 153–178 (Definitions 3.7, 3.11, Theorems 3.9, 3.10), 215–230;
  stacks-012K 1158–1161, 2981–2992, 3010–3014, 3715–3735. The manifest records every cited work.

**Adversarial table** (sampled targets, repaired passages, headline theorems, the findings'
targets).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 order isomorphism | `A = ℤ`, `B = 4ℤ`, `Z = ℤ`; `X = 0`; `A = ℤ/4` | `0 ≤ 2ℤ/4 ≤ ℤ/4 ↦ 4ℤ ≤ 2ℤ ≤ ℤ`; `B = Z`, interval one point; `(0, 2ℤ/4)` and `(2ℤ/4, ℤ/4)` both present `ℤ/2` | holds |
| 1.1 bounds transported | nonempty family in `[B, Z]`; lower bound `S` outside | meet in `Subobject A` of members `≥ B` is `≥ B`; `S ∨ B` is an interval lower bound | holds (statement is about the interval) |
| 2.2 stabilisation page | leaving and entering `d_r` at `fil = f`, degree `n` | target `fil = f + r − e` in degree `n + 1`, zero once `f + r − e ≥ β(n + 1)`; source `f − r + e ≤ α(n − 1)` | bound as stated |
| 2.2 first quadrant | `β(n) = n + 1`, `α(n) = −1`, `e = 0`; `(1, 0)` | `r ≥ n + 2 − p = q + 2` and `r ≥ p + 1`: `r > max(p, q + 1)`; `(1, 0)`: `r ≥ 2` | holds |
| 2.2 second Check | 1.4's `ℓ`-adic complex | `gr^0 K = ℤ` in degree `0`, `gr^p K = ℤ/ℓ` in degree `1` (`p ≥ 1`); degree `1` nonzero for all `p ≥ 1`; `Z_r(0,0) = ℓ^{r−1}ℤ` | holds |
| 3.1 predicates | `ℓ`-adic `ℤ`, `ℤ_ℓ`; constant; zero filtration of `X ≠ 0`; `ℤ/4` | `lim ℤ/ℓ^p = ℤ_ℓ ≠ ℤ`; meet `X ≠ 0`; join `0 ≠ X` (and complete: tower constant `X`); `gr^0 = gr^1 = ℤ/2` | holds |
| 3.2 Checks | `×2` from page `1`; `ℓ`-adic `ℤ`; zero sequence with constant `ℤ` | `E_∞^{1,0} = ℤ/2 = gr^1 H^1` with `(1,0) ↦ (1, 1)`; `gr^p = ℤ/ℓ`, `p ≥ 0`, not complete; all `gr = 0`, meet `ℤ ≠ 0` | hold |
| 3.3 compatibility | `(−1, id)` on `E_1^{0,0} = ℤ ⇒ H^0 = ℤ`; `(0, 0)` to zero | `β ∘ (−1) = −β ≠ gr^0(id) ∘ β`; both sides `0` | holds |
| 3.4 | `ℤ/4`, `ℤ/2 ⊕ ℤ/2`; all `E_∞ = 0`; Euler bullet | finite ⇒ exhaustive, separated, complete; lengths `2 = 1 + 1`; `F^a = H`, `F^b = 0`, all `gr = 0` ⇒ `H = 0`; finitely many nonzero positions ⇒ `d_r = 0` once `r − e` exceeds the spread of `fil`, then 2.3 | holds |
| 3.5 (headline) | separation; completeness | `E = E′ = 0`, `H^0 = ℤ` constant, `h = 0`; `ℤ → ℤ_ℓ` with equal `gr^p = ℤ/ℓ`, not onto | holds; hypotheses needed |
| 3.6 two rows | `q ∈ {0, 1}`, degree `n + 1` | positions `(n + 1, 0)`, `(n, 1)`; `E_∞ = coker d_2`, `ker d_2`; `F^{n+2} = 0`, `F^n = H` | exact as stated |
| 3.6 extended five-term | `m ≥ 1`; `m = 0` | entering `d_r` at `(j, 0)`, `j ≤ m`: source `(j − r, r − 1)` needs `r − 1 ≥ m`, then `j − r < 0`; `d_{m+1} : E_2^{0,m} → E_2^{m+1,0}` the only one; `m = 0`: composite of two identities is not `0` | holds; `m ≥ 1` needed |
| 3.6 Checks | Hopf pages; `×2 ⊗ ℚ` | `H^1 = H^2 = 0`, `H^0 = H^3 = ℤ`; degree-`1` sum `1`, `dim H^1 = 0` | hold |
| 4.2 | `ℤ →(×2) ℤ`; first quadrant | `abutmentFiltration (−1) 1 = im(H^1(G_{−1}) = ℤ → ℤ/2) = H^1`, `(−2)`: `0`; `F^3 = H^1`, `F^4 = 0`, `gr^3` at `(3, −2)`; `F^0 = aF(n + 1) = H^n`, `F^{n+1} = aF(0) = 0` | holds |
| 4.4 (headline) | `a ≤ q < b`; `q ≥ b`; `q < a`; `×2` in degree `1` | `max(q − a + 2, b − q + 1) ≤ b − a + 1`; `j = q + 1`, page `q − a + 2`, `gr = 0`; `H^n(⊥ ≤ q + 1) = H^{n+1}(⊥ ≤ q) = 0`; `a = −2`, `b = 0`, `F^p = H^1` for `p ≤ 2`, `0` for `p ≥ 4` | holds |
| 4.5 (headline) | first quadrant; third quadrant `m = −2`, `m ≥ 1` | `a = min(0, n + 1)`, `b = n + 1`: `H^n = 0` for `n < 0`; `a = min(m, 1)`, `b = 1` from zero for `j ≤ n` and `0 < i`; positions `(p, 2 − p)`; `H^m = 0` for `m ≥ 1` | holds |
| 4.6 | Tau Ceti hypotheses vs 4.4's | vanishing of `H^{n−1}, H^n(j ≤ ⊤)` gives `H^n(⊥ ≤ j) ≅ H^n(⊥ ≤ ⊤)`; `⊥` side identical | contains it, as claimed |
| 5.2 dictionary (repair) | `Zᵗ`, `Bᵗ` in `E_1 = Z_1/B_1` | image of `H^n(F^p K)`: `Ker d ∩ F^p + F^{p+1}`, contains `B_1 = d(F^p K^{n−1}) + F^{p+1}`; `δ[y] = [dy]` for `dy ∈ F^p`: `Im d ∩ F^p + F^{p+1}` | holds |
| 5.2 two "iff" (repair) | `×2` at `(1, 0)`; 4.3's complex; fourth Check's complex | `Bᵗ = 2ℤ = B_2`; `Bᵗ = ℤ ≠ 0 = B_∞`, (24.6.2) strict; `E_∞^{0,0} = ℤ^(ℕ) ⊕ ℤ`, `H^0 = ℤ^(ℕ)`, `0 ⊊ 0 ⊕ ℤ` | true/true, false/false, false/false |
| 5.3 (headline) | degree used on the `⊤` side | `x = dy ∈ F^s K^n` is a cocycle of `F^s K` dying in `H^n(K)`; injectivity in degree `n` gives `x ∈ d(F^s K^{n−1})` | README's degree `n` is right (see Source issues) |
| 5.4 | route; non-exhaustive complex; `ℓ`-adic `ℤ` | `H^{n+1}(F^s K) = 0` for `s ≥ p₀`: regular; colimit map iso in degree `n − 1`, mono in `n`: epi on `H^{n−1}`; `F^{p₀} H^n = 0`: complete; `E_∞^{0,0} = ℤ`, `H^0 = 0`; converges, `ℤ` not complete | theorem holds; "contains" claim: R03 |
| 6.3 | degrees; `×2` | `k` lands in `D(p + 2, q − 1)`: `c = (2, −1)`, `d_r`: `(r + 1, −r)`; `d_1 = ×2` from `E(1, −1)` to `E(3, −2)`; `A^p = 0, ℤ, ℤ/2` for `p ≥ 4`, `= 3`, `≤ 2`; `D(1, −1) = H^0(K) = 0` | holds |
| 7.2 definition (R01) | abelian `C` with countable products, epimorphic tower | `lim(F_n ⊕ ∏F_k) = ∏F_n`, first projection `(π_0, 1 − s)`; replete ⇒ `1 − s` epi ⇒ `lim¹ = 0` | equals `TauCeti.IsReplete`: R01 |
| 7.2 enough projectives | `P ↠ ∏ A_n`, components `y_n` | `x_0 = 0`, `f_n x_{n+1} = x_n − y_n`: `(1 − s)x = y` epi | holds |
| 7.3 | constant; `×ℓ` | `0, 0, 0`; `Q = 0`, `RQ = ℤ_ℓ/ℤ`, transition `×ℓ` bijective (`ℤ_ℓ = ℓℤ_ℓ + ℤ`; `ℓx ∈ ℤ ⇒ x ∈ ℤ`): `0 → 0 → ℤ_ℓ/ℤ → ℤ_ℓ/ℤ → 0` | holds |
| 7.4 (headline) | HR 3.9, 3.10 under `s ↦ −s` | conditions and conclusions agree with line 153–168 with `A^{±∞}` swapped; `W` as line 169–178 | agree |
| 7.5 (headline) | route; `ℤ_ℓ`; `ℤ` | complete ⇒ `1 − s` iso on `∏_s F^s K^m` ⇒ iso on `∏ H^n(F^s K)` (exact products): `lim = lim¹ = 0`; `E_1^{p,−p} = 0` for `p < 0`, `W^0 = 0`, strong; not complete, not strong | holds |
| R02 repair | `ModuleCat.{0} ℤ`, `ModuleCat.{1} ℤ` | instances at AB.lean 30, 38 apply to the first only; `AB5OfSize_shrink` (166) is a lemma | as the contract now says |

**Shape and completeness.** 31 targets in 7 layers; a script over the README finds for every
target a `*Needs:*` line and at least three Checks; 7 `### Examples` and 7 `### Dependencies`;
Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build,
Downstream consumers, References present. No LaTeX delimiters, no line over 100 characters, no
process words, pull-request numbers, dates or machine paths ("lemma" only in "five-lemma" and
source labels).

**Headline theorems for the package stage** (from the Summary): 2.2, 3.5, 3.6, 4.1 with 4.3, 4.4,
4.5, 5.3, 5.4, 6.3, 7.4, 7.5. As rounds 3 and 4 recorded, 2.2, 3.5, 3.6, 4.4, 4.5, 5.3, 5.4 and
7.5's strong-convergence clause are statable at the pins once the few definitions of Layers 1–3
have real bodies; 6.1–6.3 and 7.4 need StableHomotopyKTheory §7.22's exact-couple carrier and are
to be named in the module docstring as not statable. After R01, 7.5 is stated on `TauCeti.IsReplete`.

## Not verifiable

- weibel1994, boardman1999, eilenberg-moore1962, mccleary2001, massey1952, cartan-eilenberg1956:
  settled as uncertified in the manifest, cited by locator only. Boardman's 3.4(b), 5.10, 8.10, 8.13
  agree with helle-rognes2024 line 153, 163, 166, 226; the numbers 7.1 and 8.2 of 7.4's half-plane
  criteria could not be checked.
- Elaboration, the `#check` comparison and the one-tactic probe: not available (design stage, no
  `Suggested.lean`; this lane does not elaborate). The route `IsReplete (ModuleCat.{v} R)` through
  `of_reflectsEpimorphisms` named in R01 was located at the pin, not elaborated.

## Source issues

- **Misprint** in stacks-012K at Lemma 24.13 (tag 0BK5), proof of equality in (24.6.2), printed page 67: the source says the identity `d(F^s K^{n−1}) = Im(d) ∩ F^s K^n` follows from the cohomology isomorphism in degree `n − 1`, for `s < p₁(n − 1)`; it should be injectivity of `H^n(F^s K) → H^n(K)` in degree `n`, for `s ≤ p₁(n)` (`K = (ℤ →id ℤ)`, `F^s K = (0 → ℤ)` refutes the degree `n − 1` form); affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6a763025ec49d219c9050568c97b6eaa2529e1c1", "job": "REV-DESIGN-SpectralSequencesAndConvergence~5", "model": "fable", "worker": "chris-x10"} -->
