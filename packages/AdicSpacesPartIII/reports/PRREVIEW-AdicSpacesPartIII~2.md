# Review of AdicSpacesPartIII (pull request #1807 at 6fcc928)

**Verdict:** needs changes

## R01 (P2) — F0.6 still states SchemeAndStackFoundations §4.9's three formal-functions theorems in full

**Location:** `TauCetiRoadmap/AdicSpacesPartIII/README.md` lines 2871–3060 (*theorem-on-formal-functions*, *formal-functions-affine*, *formal-functions-at-point*). Line 2880: "This target is an adapter of SchemeAndStackFoundations §4.9 (`Scheme.Modules.Cohomology.formalFunctionsIso`), which owns the theorem". This is previous R05, partly repaired.

**Claim:** README line 766 says SchemeAndStackFoundations §4.9 owns these targets. The README still states them on the same scheme carrier, each with its own route, *Needs:* and examples, so the theorems are planned a second time. Scope line 51 ("does not state them again") also contradicts line 98 ("F0 restates these as adapters").

**Witness:** SchemeAndStackFoundations README on main, §4.9 (lines 5736–5745), states `H^p(X,F)^∧ ≅ lim_n H^p(X,F/I^nF)` for proper `X → Spec A`, its Mittag-Leffler system and its local-ring form. It exports them as `formalFunctionsIso`, `formalFunctions_mittagLeffler` and `formalFunctions_local`.

**Repair:**
- Reduce each target to one citation sentence that keeps its label, since CrystallineCohomology and ShimuraCompactifications cite it. Follow the pattern of *affinoid-completed-field-extension*. For the first target: "*theorem-on-formal-functions* is SchemeAndStackFoundations §4.9's `Scheme.Modules.Cohomology.formalFunctionsIso`, read on quotient systems through *pow-quotient-formal-module-comparison*; it is not proved again."
- Do the same for the other two with `formalFunctions_mittagLeffler` and `formalFunctions_local`.
- Delete the three targets' routes, *Needs:* lines and examples.
- At line 98, replace "F0 restates these as adapters, transported along" with "F0 cites these, read along".

## R02 (P3) — `GlueingSquare` keeps none of the Tate, completeness or scalar-tower binders the README gives it

**Location:** `Suggested.lean` lines 296–331: the section variables, then `structure GlueingSquare : Prop`. README line 9518: "define `GlueingSquare R R₁ R₂ R₁₂` as a proposition on the four complete Hausdorff Tate rings … with commutativity expressed by the scalar-tower instances".

**Claim:** A `structure` keeps only the section variables its fields use. The predicate is therefore defined for arbitrary uniform rings with four algebra maps and no scalar tower, which is more general than the README states.

**Witness:** `#check @Huber.GlueingSquare` shows only `[CommRing _]`, `[UniformSpace _]` for each ring, and `[Algebra R R₁] [Algebra R R₂] [Algebra R₁ R₁₂] [Algebra R₂ R₁₂]`. Commutativity of the square still follows from `exact_sub`.

**Repair:** In the README sentence and the docstring, write: "define `GlueingSquare R R₁ R₂ R₁₂` as a proposition on four uniform rings and their algebra maps (commutativity of the square follows from `exact_sub`); the complete Hausdorff Tate hypotheses are hypotheses of `projective_sections`, `of_simpleLaurent` and `finite_sections_of_simpleLaurent`."

## R03 (P3) — `IsTopologicallyFinitePresentation.completedAway_quotient` restates the pinned `quotientPowEquiv`, and its tfp hypothesis is unused

**Location:** `Suggested.lean` lines 130–142: "(hA : IsTopologicallyFinitePresentation O A) (hϖ : IsAdic (Ideal.span {algebraMap O A ϖ})) … ∃ e : (B ⧸ J) ≃+* Localization.Away fbar".

**Claim:** The statement holds for every adic ring in which `ϖ` generates an ideal of definition, so `hA` plays no role. It is an API lemma, not a headline theorem.

**Witness:** `TauCeti.AdicRing.CompletedAway.quotientPowEquiv` (`CompletedAway.lean:323`) gives `CompletedAway A f ⧸ I^n ≃ₐ[A] (A ⧸ I^n)_f` with no tfp hypothesis. `idealEquiv` (`:526`) replaces the chosen `I` by the finitely generated ideal of definition `ϖA`.

**Repair:**
- Delete the declaration from `Suggested.lean` and from the R2.1 row of the table under "How to read the build".
- In the `Lean:` sentence of *formal-localization-flatness* (line 4230), drop it.
- In that target, cite `TauCeti.AdicRing.CompletedAway.quotientPowEquiv` with `idealEquiv` for `B/ϖ^m B ≅ (A/ϖ^m A)[1/f]`.

## R04 (P3) — Padding: `Algebra.projectiveTrace_baseChange` and the unused `GlueingDatum.ofModule`

**Location:** `Suggested.lean` lines 503–507 (`projectiveTrace_baseChange`) and lines 368–375 (`GlueingDatum.ofModule`).

**Claim:** The first follows in one line from the pinned module lemma. The second is a definition that no theorem in the file uses.

**Witness:** On a scratch copy, `rw [projectiveTrace, projectiveTrace, LinearMap.comp_apply, LinearMap.comp_apply, ← _root_.LinearMap.projectiveTrace_baseChange]; congr 1; ext x; simp` closes the first. `ofModule` occurs nowhere in the file except its own definition.

**Repair:**
- Delete both declarations from `Suggested.lean` and from the R3.8 and R3.1–R3.2 rows of the table under "How to read the build".
- At line 11963, replace "Lean: `Algebra.projectiveTrace_baseChange`." with "This target is specified in this README only."
- Drop `GlueingDatum.ofModule` from the `Lean:` sentence of *glueing-square* (line 9537).

## R05 (P3) — R3.8 says the étale trace criterion is new beyond fields, but the pinned Tau Ceti proves the field and finite free cases

**Location:** README lines 11987–11989: "The field case is Mathlib's `_root_.Algebra.traceForm_nondegenerate` and `traceForm_nondegenerate_tfae`; the statement over an arbitrary commutative ring is new".

**Claim:** The Mathlib lemmas cover only separable field extensions. The étale-algebra field case and the finite free case over any ring are already at the pin, and the target's *Needs:* line omits them.

**Witness:** `TauCeti/RingTheory/Etale/Discriminant.lean` has `TauCeti.Algebra.etale_iff_traceForm_nondegenerate` (line 66, any finite-dimensional algebra over a field), `etale_iff_isUnit_discr` (line 122, any basis over any ring) and `isUnit_discr_localization_iff` (line 144). Mathlib's `traceForm_nondegenerate` (`Trace/Basic.lean:502`) needs `[Algebra.IsSeparable K L]` with `L` a field.

**Repair:** Replace the sentence with: "The field case is Tau Ceti's `TauCeti.Algebra.etale_iff_traceForm_nondegenerate` and the finite free case is `TauCeti.Algebra.etale_iff_isUnit_discr`; the finite projective case, reduced to the free one by localising at primes with `TauCeti.Algebra.isUnit_discr_localization_iff`, is new." Add the three names to the *Needs:* line.

## R06 (P3) — The supplier tables still attribute Tau Ceti's classes to Part II and list a Part III target as an R3 supplier

**Location:**
- README line 557: "AdicSpacesPartII `Huber.IsNoetherianType`, `Huber.IsHuberStandard`, `Huber.IsAdicHom`, …".
- Line 9217: "whose hypothesis `Huber.IsNoetherianType` (AdicSpacesPartII) covers this case".
- Line 320: "`TauCetiRoadmap.AdicSpacesPartIII.AdicSpace.analytification.modules_chartSections` | This README, R3.1a".

**Claim:** Lines 87–89 say these classes are Tau Ceti's, and `Huber.laurent_exact_of_finite` uses the Tau Ceti class. A target of this roadmap is not one of its suppliers.

**Witness:** `Suggested.lean` line 276 has `[TauCeti.Huber.IsNoetherianType A]`, a class defined at `TauCeti/RingTheory/Huber/NoetherianType/Basic.lean:38`. Row 561 already cites `TauCeti.Huber.IsAdicHom`.

**Repair:**
- In row 557, drop `Huber.IsNoetherianType` and `Huber.IsAdicHom`.
- Add the row "`TauCeti.Huber.IsNoetherianType` | `TauCeti/RingTheory/Huber/NoetherianType/Basic.lean` | Huber rings with a noetherian ring of definition, or strongly noetherian Tate rings."
- At line 9217, write "whose hypothesis `TauCeti.Huber.IsNoetherianType` covers this case".
- Delete row 320.

## R07 (P3) — Trailing API paragraphs and second Checks lists rename targets and reuse Check labels

**Location:** README: the API paragraphs at lines 2184–2195 and 2226–2229, and at 2086–2092 and 2126–2132. The Checks lists at lines 2205–2224 and 2234–2239, and at 2113–2124 and 2134–2140.

**Claim:** The same declaration gets two names:
- `FormalScheme.Hom.isProper_iff_reduction` and `isProper_iff_reductionWith`;
- `IsProper.comp` and `isProper_comp`;
- `FiniteType.comp` and `finiteType_comp`.

Each of these targets has two Checks lists, and one label names two different Checks.

**Witness:** *formalMorphisms_powerSeries* is "the non-adic `T`-adic formal disc … fails finite type" at line 2140, and "a closed map of one-point spaces can fail formal properness" at line 2239. *formalMorphisms_empty* occurs at both 2139 and 2238.

**Repair:** For every target followed by such a paragraph (the pattern recurs through F0.3–F0.8):
- merge the paragraph into the target's `Define … prove` sentence, with one name per declaration;
- merge the second list into the target's **Checks.**;
- make every label unique, for example *formalProper_powerSeries* at line 2239.

## R08 (P3) — The AutomorphicBundles consumer sentence names a section label and a declaration that its head does not have

**Location:** README lines 12043–12045: "AutomorphicBundles B5.1 is a consumer of this scheme trace … Its scheme-level `finiteLocallyFreeTrace` denotes this `AlgebraicGeometry.Scheme.Hom.finiteTrace`, by import or transparent alias".

**Claim:** The cited label B5.1 and the name `finiteLocallyFreeTrace` do not exist at the consumer's head.

**Witness:** At its open head, AutomorphicBundles maps "B5.1a = 12.2, B5.n = 12.(n+1) for n ≥ 2". Its §12.1, *The coefficient trace adapter*, cites `AlgebraicGeometry.Scheme.Hom.finiteTrace` directly, and `finiteLocallyFreeTrace` occurs nowhere in that README.

**Repair:** Replace the sentence with: "AutomorphicBundles §12.1 consumes this scheme trace and its unit, composition and arbitrary-base-change laws through `AlgebraicGeometry.Scheme.Hom.finiteTrace`; its coefficient projection-formula and stack-descent adapters belong to AutomorphicBundles."

## R09 (P3) — Process wording in "How to read the build"

**Location:** README lines 704–705: "Library definitions from the supplier replace the corresponding suggested carriers when available." Line 722: "The heading `R3/<label>` of a target names its block when it is formalised".

**Claim:** These sentences describe future formalisation work, not mathematics. The README must be timeless.

**Witness:** The README rules forbid process narrative and anything "for later". The `R3/<label>` block labels in the table at lines 725–732 are used nowhere else in the README.

**Repair:** Delete the sentence at lines 704–705, and delete lines 722–732 (that paragraph and its table).

## R10 (P3) — The description says this folder's `Suggested.lean` changes only in comments

**Location:** The pull-request description: "Every Suggested.lean it changes states headline theorems at the pins: … AdicSpacesPartIII's and ComplexKahlerGeometry's change only in comments".

**Claim:** This head rewrites this folder's `Suggested.lean` and most of its README. The description mentions only the two R3.6 edits, and does not say that the pull request revises a roadmap on main.

**Witness:** Against `origin/main` the folder changes by 3700 lines (README 3144, `Suggested.lean` 556). 26 declarations are removed, including `AdicRing.CompletedTensorProduct`, `grothendieckExistence` and `LinearMap.projectiveTrace`. The import `TauCetiRoadmap.AdicSpacesPartII.Suggested` is replaced by Tau Ceti modules.

**Repair:** Replace the clause with: "AdicSpacesPartIII, a roadmap on main, is revised throughout: its Suggested.lean drops 26 declarations (the F0.1 adic-ring constructions and the projective trace, now cited from Tau Ceti; the formal-functions and existence theorems of SchemeAndStackFoundations §§4.9–4.10; Check mirrors) and imports Tau Ceti modules instead of AdicSpacesPartII's Suggested.lean, and its README cites the pinned Tau Ceti declarations in F0.1, F0.2 and R3.8."

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| *colimit-of-thickenings* | `X_n=Spec ℤ/p^{n+1}`; `A_n=k[x_i]/((x_1..x_{n+1})^{n+1}+(x_{n+2},…))` | first gives `Spf ℤ_p`; second: `J_n=(x_1..x_{n+1})`, `x_3∈ker(A_n→A_1)`, `x_3∉J_n²` (n≥2): (b) fails, (a),(c) hold | holds | none |
| *completion-detects-near-closed* | `Spec ℤ`, `V(p)`, `u=·ℓ`, `ℓ≠p` | `û` iso on `ℤ_p` (`ℓ` a unit); `u` iso on `D(ℓ)⊇V(p)`, not on `Spec ℤ` | holds | none |
| *existence-proper-support-reduction* | `A¹_{ℤ_p}`, `G=Ô_{V(x)}` | support one point, proper; `Z=V(x)≅Spec ℤ_p`; `Z=Supp G` fails since `pⁿG≠0` | holds | none |
| *formal-morphism-full-faithfulness* | `Aut(P¹_{ℤ_p})`; `X=A¹` | `PGL_2(ℤ_p)=lim PGL_2(ℤ/p^{n+1})`; non-proper: `ℤ_p[x]⊊ℤ_p⟨x⟩` | holds | none |
| *generic-fibre-fibre-products* | `Spf O⟨S⟩ ×_{Spf O} Spf O⟨T⟩` | `d = Spa K⟨S,T⟩`, the bidisc, `= disc ×_{Spa K} disc` | holds | none |
| *fibral-finiteness-criterion* | `{|t|=1}⊔{|t|<1}→{|t|≤1}` | bijective, flat, rank 1, not quasi-compact, not finite | holds | none |
| *content-ideal-product* | `ϖζ(1+ζ)` in `O_K⟨ζ⟩` | `c=(ϖ)=c(ϖζ)·c(1+ζ)=(ϖ)(1)` | holds | none |
| *flattening-local-step* | `O_K⟨ζ,ξ⟩/(ζξ−ϖ)→O_K⟨ζ⟩`, blow up `(ζ,ϖ)` | chart `ϖ=ζu`: strict transform `ξ=u`, iso; chart `ζ=ϖv`: `vξ=1`, open immersion; `W_0=T_0` | holds | none |
| *tate-acyclicity-finite-modules* | `ℚ_p⟨T⟩`, `f=T`, `M=A/(T)` | `B₂=B₁₂=ℚ_p⟨T,T⁻¹⟩`; sequence `0→ℚ_p→ℚ_p⊕0→0→0` exact | holds | R06 (wording) |
| *coherent-sheaf-operations* | `i:Spa K→disc`, `T:O→O` | `i*T=0:K→K`; `coker T=(K⟨T⟩/(T))~`, stalk `K` at 0 | holds | none |
| *sheaf-of-continuous-differentials* | `Sp B→Sp A`; étale `u` | `I/I²` finite over `B` (Conrad-AWS Ex. 3.1.4); `u*Ω¹ ≅ Ω¹` | holds | none |
| *gaga-comparison-map* | `A¹_K`, `F=O`; `F=O/(T)` | `Σϖ^{n²}Tⁿ` entire, not in `K[T]`, so `c_F` not surjective; skyscraper `K→K` iso | holds | none |
| *rigid-genus-one-projective-embedding* | smooth, `D=[e]`; `n`-gon; 2-gon, one component | rank 3, plane cubic; `d=n`, rank `3n`, `P^{3n−1}`; degree 0 on missing component, not ample | holds | none |
| *rigid-projective-hilbert-hom* | `Hilb¹(P¹)`; `t=ε` over `k[ε]` | `P¹` represents points over any base; `t=ε ≠ t=0` though reductions agree | holds | none |
| *gelfand-spectrum-banach-ring* | `ℚ_p`; `K[ε]`; `A=0` | `M(ℚ_p)={|·|_p}`; `α(ε)²=0`, max `0=lim‖εⁿ‖^{1/n}`; `M(0)=∅`, both sides 0 | holds | none |
| `IsCompleteRankOneBase` | `(ℤ_p,p)`; `ϖ=0`; `ϖ` a unit | dim 1, nonzero nonunit, complete: holds; `ne_zero` fails; `not_isUnit` fails | discriminating | none |
| `iff_of_surjective` | `O⟨ξ⟩→O`, `ξ↦0` | kernel `(ξ)` finitely generated; `O` tfp | holds | none |
| `isTopologicallyFinitePresentation_of_flat` | `O⟨T⟩/(ϖT)`; `O⟨T⟩` | `T` is `ϖ`-torsion, not flat, no claim; `O⟨T⟩` tfp | holds | none |
| `isAdmissibleAlgebra_iff_flat` | `a·x=0`, `a≠0` | rank one: `ϖⁿ∈aO`, so `ϖⁿx=0`, `x=0`; flat ⇔ torsion-free (`flat_iff_torsion_eq_bot_of_isBezout`) | holds | none |
| `finitePresentation_of_fg` | `J=(ϖ)⊆O` | `J≅O`, finitely presented | holds | none |
| `IsTopologicallyFinitePresentation.isAdicComplete` | `O⟨T⟩`; `O[T]` | complete; `O[T]` incomplete and not tfp | holds | none |
| `completedAway_quotient` | `O⟨T⟩`, `f=T`, `m=1`; any adic `A` | `B/ϖB=k[T,T⁻¹]=k[T]_T`; holds without tfp via `quotientPowEquiv`, `idealEquiv` | holds, `hA` unused | R03 |
| `completedAway_flat` | `f=0`; `f=1`; `O⟨T⟩/(ϖT)`, `f=T` | `B=0`; `B=A`; `B=(O/ϖ)[T,T⁻¹]`, flat | holds | none |
| `ringKrullDim_genericFibre_le` | `O⟨T⟩/(ϖT)`; `O/ϖ` | `0≤1`; `⊥≤0` | holds | none |
| `ringKrullDim_genericFibre_eq` | `O⟨T⟩`; `O⟨S,T⟩/(ST−ϖ)`; `A=0` | `1=1`; annulus 1 = `dim k[S,T]/(ST)`=1; `⊥=⊥` | holds | none |
| `isReduced_isPureDimensional_genericFibre` | nilpotent `a∈A_K` | Conrad-MR Lem. A.2.2 scales `a` into `A∖𝔪A`; `ā` nilpotent, nonzero in reduced `A/𝔪A`: contradiction | holds | none |
| `exists_unique_frobeniusLift_of_etale` | `R=0`; `A=𝔽_p`; `ℤ_p→W(𝔽_{p²})` | unique trivially; `φ=Frob`; Witt Frobenius is the unique lift | holds | none |
| `fracPow_inter_spa` | `q=0`; `q=1/2`; unit `g` | `{v(f)≤1}=R({f,1}/1)`; `v(f²)≤v(g)`; `v(gᵃ)≠0` forces `v(fᵇ)≠0` | holds | none |
| `laurent_exact_of_finite` | `f=1`; `f=0`; `f=T` | `0→M→M²→M→0`; `B₂=B₁₂=0`; previous row | holds | none |
| `GlueingSquare`, `projective_sections` | exactness; KL15 Prop. 2.7.5 | `(r,r)↦0` forces commutativity; condition (c) = consequence of Cor. 2.3.5 used in 2.7.5 | holds | R02 |
| `GlueingSquare.of_simpleLaurent` | maximal ideal `m` of `R` | a point with support `m` lies in `U₁` or `U₂`, giving a prime of `R_i` over `m` | holds | none |
| `finite_sections_of_simpleLaurent` | DLLZ-A Lem. A.3, A.7, Thm A.8 | `R_i` noetherian, `R_i→R₁₂` flat with dense image: `M` finite, base change bijective | holds | none |
| `denseBanach_inverseSystem_exact` | `V_n=0`; constant `V`, `t=id` | trivial; `x_0=0`, `x_{n+1}=x_n−y_n` | holds | none |
| `isUniform_tfae` | `ℚ_p`; `ℚ_p[ε]` with `‖a+bε‖=|a|+|b|` | all hold, `c=1`; at `ε`: `‖ε²‖=0`, spectral 0, `ν(ε)=0`: all three fail | holds | none |
| `projectiveTrace_eq_categoricalTrace` | `R²`, `diag(a,d)`; `M=0`; `ℚ×0⊂ℚ×ℚ` | `a+d`; `0`; `(1,0)` against Mathlib trace `0` | holds | none |
| `Algebra.projectiveTrace_baseChange` | `ℤ→𝔽_p`, `B=ℤ[i]` | `Tr(1)=2 mod p`; one rewrite line from the pinned lemma | holds, padding | R04 |
| `projectiveTrace_eq_sum_geometricPoints` | `ℚ×ℚ(i)`, `(1,i)`; `k[x]/x²` | `1+i−i=1`, `#Hom=3=dim`; non-étale: one point, `Tr(1)=2` | holds | none |
| `projectiveTrace_trans` | `ℚ⊂ℚ(i)⊂ℚ(i,√2)`; `k⊂k×k⊂k×k[x]/x²` | `4=Tr(2)`; `3=Tr((1,2))` | holds | none |
| `etale_iff_projectiveTraceForm_bijective` | `𝔽₂×𝔽₂`; `𝔽₂[x]/x²`; `ℤ[i]/ℤ` | Gram `I₂`, étale; form 0, not étale; disc `−4` not a unit, not étale | holds | R05 |
| `GelfandSpectrum.compactSpace_nonempty` | `A=0`; `ℚ_p`; bound | empty, compact, T2; one point; `α(x)ⁿ≤C‖x‖ⁿ` gives `α≤‖·‖`, closed in `∏[0,‖x‖]` | holds | none |
| `smoothingFun_eq_sSup` | `ℚ_p`, `x=p`; `A=0` | `1/p=1/p`; `0=sSup ∅=0` | holds | none |
| *proper-cohomology-adic-completion* | `a=0`; `a=1`; `A⊕A/(T)`, `a=T` | `R_k=0` (k≥1); `R_k=M`; `aᵏF∩E=0` for `k≥1` | holds | none |
| *theorem-on-formal-functions* | `P¹_{k[t]}`, `O(−2)`, `p=1` | `H¹^∧=k⟦t⟧=lim k[t]/(t^{n+1})`; same isomorphism as SchemeAndStackFoundations §4.9 | holds, duplicated | R01 |
| *proper-formal-morphism*, completion clause | identity of `P¹_{ℤ_p}`, `X′` a closed point of `P¹_{𝔽_p}` | `ĝ: Spf ℤ_p⟦t⟧→Spf ℤ_p⟨t⟩`; `pℤ_p⟦t⟧` not `(p,t)`-open, so not adic, not proper | README right | none |

- Previous review at 096aff5: R01–R04, R06–R15, R17 and R18 are repaired; R18 states the open-in-preimage case, which corrects EGA III₁ 3.4.1 (see Source issues). R05 is partly repaired (R01 here). R16 is partly repaired: Check labels are now italic, and the remaining name problems are R07 here.
- The gate rerun at 6fcc928 shows every counter at 0 except `outside-folder=24`, which lists only the twelve sibling folders this pull request owns, so it is not a finding. The worker's gate, including `lake build TauCetiRoadmap.AdicSpacesPartIII.Suggested`, passed.
- Dependency check output: `depcheck: 229 roadmaps, 2070 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. RigidAnalyticGeometry at this head names Part III only as a consumer.
- Elaboration: a scratch copy with `#check @` for all 38 declarations gives 25 `sorry` warnings, no errors and no other warnings. Only `GlueingSquare` lost section binders (R02).
- One-tactic probe: `Algebra.projectiveTrace_baseChange` closes (R04). `fracPow_inter_spa` does not (`simp` leaves `0 <ᵥ g ^ q.num`), and neither does `projectiveTrace_eq_categoricalTrace` (`simp` fails).
- Source locators checked against the text: 54, all correct. They are EGA I 6, EGA III₁ 10, Kiehl-E 1, Conrad-MR 9, Conrad-AWS 2, Conrad-RA 6, KL15 9, DLLZ-A 8 and Stacks 3 (088E, 01EW, 0A42). They cover all 15 seeded targets and the `Suggested.lean` docstrings.
- Library declarations opened at the pins: 24. Examples are `TauCeti/RingTheory/AdicRing/CompletedAway.lean:311, 323, 526`, `TauCeti/RingTheory/Etale/Discriminant.lean:66, 122, 144`, `TauCeti/LinearAlgebra/Trace/Projective.lean:72, 158`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basic.lean:146`, Mathlib `RingTheory/Flat/TorsionFree.lean:93` and `RingTheory/Polynomial/ContentIdeal.lean:102, 174, 183`.
- Cross-roadmap citations resolved: 31. They are SchemeAndStackFoundations §§0.23a, 2.6, 2.19, 2.21, 4.7–4.14 and five names; DerivedModuleAlgebra §§1.T.1, 1.1, S.1 and four names; PivotalSpherical Layers 0–2 and 10; RigidAnalyticGeometry §§1.3 and 6.3 and PadicFunctionalAnalysis §§0.4, 1.2 and 2.1–2.4, both at this head; and AutomorphicBundles (R08). The overlap report lists none, and ownership greps of the open heads for 9 objects found no second owner.

## Not verifiable

- BL I (Math. Ann. 295) and BL II (manifest: uncertified): the R2 locators (BL I Prop. 1.1–1.3, Lem. 1.6, Cor. 4.6; BL II §§1–4) were not read. Neither text is in the sources cache.
- Huber94 (Math. Z. 217) and Huber96 (Vieweg) are not in the cache, and Huber96 is not freely available.
- Kiehl-AB (Invent. Math. 2, 256–273): I fetched GDZ article PDFs LOG_0027–LOG_0030 of the volume, and none yields its text (LOG_0029 has 65 pages and no text layer). Def. 2.1.2 and the "Satz 2.4.2" cited in the docstring of `denseBanach_inverseSystem_exact` are therefore unchecked.
- Berkovich (AMS 1990) is not freely available. KL15 Thm 2.3.4 and Thm 2.3.10 confirm the cited statements.

## Source issues

- **Error** in EGA-III-1 at 3.4.1, p. 119: the source says that the extension to completions of a proper `g` along a closed `Y′` with `g(Y′) ⊆ Z′` is proper; it should require `Y′` open in `g⁻¹(Z′)`, since otherwise the extension is not adic, hence not of finite type; affects nothing.
