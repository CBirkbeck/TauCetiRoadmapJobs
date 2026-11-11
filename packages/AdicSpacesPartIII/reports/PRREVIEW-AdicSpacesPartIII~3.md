# Review of AdicSpacesPartIII (pull request #1807 at 4722dba)

**Verdict:** needs changes

## R01 (P2) — F0.7–F0.9 plan again theorems of SchemeAndStackFoundations Layer 4, and attribute to §4.10 statements it does not make

**Location:** `TauCetiRoadmap/AdicSpacesPartIII/README.md` lines 756–762: "its §4.10 … owns … *existence-projective-case*, *existence-modification*, *existence-devissage*, *closed-subscheme-algebraization* and *formal-morphism-full-faithfulness* … The §4.10 targets are adapters … Layer 4's statement read through *pow-quotient-formal-module-comparison*". Also lines 2990–3002, 3198–3225 and 3593–3597.

**Claim:**
- Two of these targets are §4.10 theorems planned a second time, each with its own route:
  - *formal-morphism-full-faithfulness* is `Formal.algebraize_hom`;
  - *existence-projective-case* is the projective case of `Formal.grothendieck_existence`.

  Neither target's *Needs:* line names §4.10 or either comparison.
- *existence-modification*, *existence-devissage* and *closed-subscheme-algebraization* are not §4.10 statements, so they are not adapters of it.
- `AlgebraicGeometry.chowModification` restates §4.12's `chow_lemma` under a second name.

This is the pattern of the previous review's R01, which this head repaired for F0.6.

**Witness:** SchemeAndStackFoundations README on main, §4.10 (lines 6762–6820), exports only `grothendieck_existence`, its full-faithfulness clause and `algebraize_hom`. Stacks 0885, 088A, 088B and 0899 occur there only as sources. Line 3220's *Needs:* starts "*completion-morphism-germ*; *closed-fibre-neighbourhood*".

**Repair:**
- Reduce *formal-morphism-full-faithfulness* to a citation sentence: "*formal-morphism-full-faithfulness* is SchemeAndStackFoundations §4.10's `Formal.algebraize_hom`, read on completions through *morphisms-as-compatible-systems* and *formal-scheme-carrier-comparison*; it is not proved again."
- Reduce *existence-projective-case* the same way, citing `Formal.grothendieck_existence` (a projective `X` is proper).
- Delete both targets' routes, examples and *Needs:* lines.
- In *existence-proper-support-reduction* (line 3088), replace *existence-projective-case* with "SchemeAndStackFoundations §4.10".
- Delete "This target is an adapter of SchemeAndStackFoundations §4.10, …" at lines 3016–3017, 3072–3073 and 3148–3149.
- At lines 48–51, 449–450, 462 and 759–760, list *existence-modification*, *existence-devissage* and *closed-subscheme-algebraization* as F0's own targets, and drop "closed subschemes" from §4.10's ownership.
- Replace lines 3593–3597 with "F0 uses `chow_lemma` as SchemeAndStackFoundations §4.12 states it."

## R02 (P3) — Five supplier references do not resolve where they are cited

**Location:**
- README lines 8900, 8959, 9483, 9925 and 12230: `TauCeti.ValuationSpectrum.exists_span_eq_top_forall_rationalSubset_subset_of_isTateRing`.
- Line 8898: `Huber.IsTateRing.isStrictMap_of_isClosed_range`.
- Line 460: `Formal.Scheme.formalCompletion` and `Formal.Scheme.completionFunctor`, located in "`TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean`".
- Lines 7816 and 8032: "p. 7 of the author version", "p. 15 of the author version".

**Claim:**
- Neither Tau Ceti name exists at the pin.
- The two SchemeAndStackFoundations names are targets in its README only, not declarations of its `Suggested.lean`.
- The BHW pages are those of a version that the reference entry does not name.

**Witness:**
- The pin has `exists_span_eq_top_forall_rationalSubset_subset` and `…_of_isOpen_of_iUnion_eq_univ` (`Spa/RationalSubset/Refinement.lean:151, :184`).
- It also has `LinearMap.isStrictMap_of_isClosed_range_of_isTateRing` (`RingTheory/Huber/OpenMapping.lean:130`).
- In arXiv:1902.03985v4, BHW Def. 4.1 is on p. 15 and §2.1 on p. 7.

**Repair:**
- Cite the two pinned Refinement lemmas in place of the `_of_isTateRing` name.
- Cite `LinearMap.isStrictMap_of_isClosed_range_of_isTateRing` at line 8898.
- In row 460, give `TauCetiRoadmap/SchemeAndStackFoundations/README.md` §4.8 as the location of those two names.
- Add to the [BHW] entry: "author version arXiv:1902.03985v4, cited for page numbers marked 'author version'".

## R03 (P3) — `isUniform_tfae` assumes a Tate ring, which neither KL15 Def. 2.8.1 nor the proof needs

**Location:** `Suggested.lean` line 426: "`theorem isUniform_tfae {A : Type*} [NormedCommRing A] [CompleteSpace A] [IsTateRing A]`". README lines 9986–9987: "let `A` be a complete Tate ring metrised by a submultiplicative norm".

**Claim:** (a), (b) and (c) are equivalent for every complete normed commutative ring. The Lean statement is therefore narrower than its source.

**Witness:**
- KL15 p. 59 states Def. 2.8.1 for any Banach ring.
- Iterating `c|x|² ≤ |x²|` gives `|x^{2^k}| ≥ c^{2^k−1}|x|^{2^k}`, so the spectral seminorm is at least `c|x|`.
- `ν(x²) = ν(x)²` gives (c).

Neither step uses a topologically nilpotent unit.

**Repair:**
- Delete `[IsTateRing A]` from `isUniform_tfae`, and begin its docstring "For a complete normed commutative ring with a submultiplicative norm".
- In (i) of *uniform-iff-power-bound*, write "(i) holds for every Banach ring (KL15 Def. 2.8.1); (ii)–(iii) assume `A` Tate".

## R04 (P3) — Padding: `fracPow_inter_spa` restates the definitions

**Location:** `Suggested.lean` lines 197–221 (`fracPowLE`, `fracPowGE`, `fracPow_inter_spa`). README lines 7800–7801: "`fracPowLE f g q` differs from Tau Ceti's `basicOpenFinset {f^b} (g^a)` only by the condition `v(g^a) ≠ 0`, which is automatic for a unit `g`".

**Claim:** Both sides unfold to `v ∈ spa A⁺` and `v(f^b) ≤ v(g^a)`, together with `v(g^a) ≠ 0`. This is an API lemma, not a headline theorem. The two definitions are in the file only to state it.

**Witness:** On a scratch copy, `simp [Set.ext_iff, fracPowLE, fracPowGE, mem_rationalSubset_iff, …]` leaves only `0 <ᵥ g ^ q.num` (and its mirror), which holds because `g` is a unit.

**Repair:**
- Delete the three declarations from `Suggested.lean`.
- Delete the R2.10 row of the table at line 716, and "fractional valuation bounds" from line 696 and from the module docstring.
- At lines 7823–7825, replace the `Lean:` sentence with "This target is specified in this README only."

## R05 (P3) — The module docstring omits headline theorems that are not statable

**Location:** `Suggested.lean`, module docstring, the list after "Headline theorems that are not statable at the pins" (line 34, four bullets).

**Claim:** The list omits these headline theorems, which the README Summary and layer table name:
- Kiehl glueing of vector bundles on sheafy Tate affinoids (R3.5);
- the good-reduction comparison `φ` and residue discs (R2.8–R2.9);
- formal models of Hasse domains (R2.10);
- the analytic classification of generalised elliptic curves and its Hasse loci (R3.7a).

**Witness:** These are README *sheafy-tate-acyclicity-and-kiehl-gluing* (line 9903, KL15 Thm 2.7.7) and *formal-completion-and-algebraic-comparison* (line 7103). No module under `TauCeti/AlgebraicGeometry/AdicSpace/` defines sheaves of modules.

**Repair:** Add the bullet: "* Kiehl glueing of vector bundles on sheafy Tate affinoids (R3.5), the good-reduction comparison and residue discs (R2.8–R2.9), formal models of Hasse domains (R2.10), and the analytic classification of generalised elliptic curves with its Hasse loci (R3.7a): sheaves of modules on `TauCeti.AdicSpace` and admissible formal schemes."

## R06 (P3) — Checks labelled with backticked Lean-style names

**Location:** README lines 5693–5695: "The constructor itself has three computed Checks: `liftedBasis_test_rankOne` lifts the residue basis `1` …". The same occurs at lines 4804, 4810, 5289, 5808, 6142, 6171, 7750, 7752, 8776, 10876, 10877, 11124 and 11877.

**Claim:** Convention 13 (lines 199–200) and the house rule give Checks italic labels and never name a Lean declaration. These labels read as declarations of `Suggested.lean`.

**Witness:** `liftedBasis_test_rankOne`, `tube_test_torsion_empty_geometric`, `openPolydisc.coeff_one` and `finiteTrace_test_split` occur nowhere in `Suggested.lean`.

**Repair:** At every listed line, write the label in italics, for example *liftedBasis_test_rankOne* in place of `liftedBasis_test_rankOne`.

## R07 (P3) — The text says the plan follows a source's arrangement

**Location:**
- Line 4: "builds noetherian formal geometry after EGA I §10 and EGA III §§4–5".
- Lines 11 and 3706: "flattening after Bosch–Lütkebohmert".
- Lines 5624–5625: "proves the flattening theorem of Bosch–Lütkebohmert II by breaking it into the lemmas of their §§1–4".
- Lines 7103–7116: "(1.9.4) … (1.9.5) … Prove Proposition 1.9.6".

**Claim:** The organisation must be the roadmap's own, and a roadmap does not say that it follows a source. Locators go in parentheses at each claim, not as the structure of a statement.

**Witness:** R2.8's target is laid out by Huber96's paragraph numbers 1.9.4, 1.9.5 and 1.9.6. R2.7 is introduced as BL II's lemma sequence.

**Repair:**
- Line 4: "builds noetherian formal geometry (EGA I §10, EGA III §§4–5) over".
- Lines 11 and 3706: "flattening by admissible blow-up (BL II; RG)".
- Lines 5624–5625: "This subsection proves the flattening theorem through: lifting generators …".
- In R2.8, delete the prefixes "(1.9.4)" and "(1.9.5)" and write "Prove that (i) `φ` is a local isomorphism …", keeping "(Huber96 §1.9.4–1.9.5, Prop. 1.9.6, p. 98)" at the end of the statement.

## R08 (P3) — AdicSpacesPartII's noetherian-type lemmas concern AdicSpacesPartII's own class

**Location:** README rows 561 and 569: `TauCetiRoadmap.AdicSpacesPartII.Huber.IsNoetherianType.completion` and `TauCetiRoadmap.AdicSpacesPartII.Huber.IsNoetherianType.isStablySheafy`. Row 562 makes `TauCeti.Huber.IsNoetherianType` the class R3 uses.

**Claim:** Both supplied lemmas are about a separate class. `laurent_exact_of_finite` and R3 use Tau Ceti's class, and no bridge between the two is stated.

**Witness:** AdicSpacesPartII's `Suggested.lean` on main defines its own `class IsNoetherianType` (line 245, `mk_iff isNoetherianType_iff`), and its lines 339 and 358 state the two lemmas for it. Tau Ceti's class is defined at `NoetherianType/Basic.lean:38`.

**Repair:** Append to row 562: "AdicSpacesPartII's own `Huber.IsNoetherianType` (rows 561, 569) has the same defining disjunction; R2–R3 read its lemmas through the two `isNoetherianType_iff` lemmas."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| *completed-tensor-product-adic* | `ℤ_p⟦S⟧ ⊗̂ ℤ_p⟦T⟧`; EGA I 10.7.4 | maps not adic, so the fibre product is a limit of thickenings; EGA p. 194: product need not be locally noetherian | holds | none |
| *ideal-of-definition* | `∐ Spec ℤ/2^{n+1}`, section `2`; `Spf O_C` | `2` vanishes in every `𝔽₂` but is not nilpotent in `∏ℤ/2^{n+1}`; `𝔪_C² = 𝔪_C`, so there is no largest ideal | holds | none |
| *theorem-on-formal-functions* | citation | SchemeAndStackFoundations §4.9 on main exports `formalFunctionsIso`, `_mittagLeffler`, `_local` | holds | none |
| *closed-fibre-neighbourhood* | `Spec ℚ_p → Spec ℤ_p`; `P¹_{ℤ_p}` | image `{(0)}` not closed, `X′ = ∅ ≠ X`; `𝔞 + I = A`, `I ⊆ Jac`, so `𝔞 = A` | holds | none |
| *formal-morphism-full-faithfulness* | `A¹_{ℤ_p}`; `Aut P¹` | `ℤ_p[x] ⊊ ℤ_p⟨x⟩`; `PGL₂(ℤ_p) = lim PGL₂(ℤ/p^{n+1})`; same theorem as `Formal.algebraize_hom` | true, duplicated | R01 |
| *existence-projective-case* | `P^r_{ℤ_p}` | compatible `O(d)` systems algebraise; the projective case is a case of proper `grothendieck_existence` | true, duplicated | R01 |
| *affine-nilpotent-thickening* | `k[ε]/ε²`; `P¹_k`, `𝒥 = 0` | both affine; neither affine | holds | none |
| *chow-lemma-devissage* | `Spec ℤ/4`, P = free | 2-of-3 exact; `O` has nonzero generic stalk but is not killed by `𝔪`; `ℤ/2` not free, so annihilation is needed | holds | R01 (`chowModification`) |
| *topological-basis-lifting* | `O_K/ϖ`, `E = {1}`; `O_K⟨ζ⟩` | basis mod `ϖ`, `O_K → O_K/ϖ` not injective; `{ζ^i}` a topological basis | holds | none |
| *nonvanishing-on-fibres-nonzerodivisor* | `A = O_K⟨a,b⟩/(ab)`, `f = a`; `ζ − a` | `a·b = 0` in `B_λ`; `ζ − a` a nonzerodivisor | holds | none |
| *module-flattening-by-blow-up* | `ℳ = O_K/ϖ` on `Spf O_K` | `ℳ_K = 0` rig-flat; strict transform `0` flat; pull-back not flat | holds | none |
| *formal-completion-and-algebraic-comparison* | `A¹_{O_K} → Spec O_K` | `d(X̂)` = closed disc: open immersion, injective, not surjective (not universally closed) | holds | R07 (wording) |
| *frobenius-lift-etale-over-torus* | `W⟨T^{±1},(T−1)⁻¹⟩`; `pR = 0` | `φ((T−1)⁻¹) = (T^p−1)⁻¹`, `T^p−1 ≡ (T−1)^p` a unit; flat over `W/p²` and killed by `p` forces `0` | holds | none |
| *residue-disc* | `T² = 2` over `𝔽_p`, `p` odd non-square; `T³ − 2`, residue field `ℝ` | no `ℚ_p`-point, two discs over `ℚ_{p²}`; two components | holds | none |
| *section-domain-formal-model* | `f = p²`, `c = p³`; change of lift | `R/R[p] = P/(pt)` has torsion `t`, `R/R[p^∞] ≅ ℤ_p`; `u′s′ = (c + c′ut)/(1 + (c′/c)ut) = c` | holds | none |
| *sheafy-tate-acyclicity-and-kiehl-gluing* | KL15 Thm 2.7.7; `K⟨T⟩` | sheafy, so Tate sheaf property and Kiehl glueing hold; PID, so line bundles are trivial | holds | R05 (docstring) |
| `IsCompleteRankOneBase` | `(ℤ_p, p)`; `ϖ = 0`; unit `ϖ` | all fields hold; `ne_zero` fails; `not_isUnit` fails | discriminating | none |
| `iff_of_surjective`, `…_of_flat` | `O⟨ξ⟩ → O`, `ξ ↦ 0`; `O⟨T⟩/(ϖT)` | kernel `(ξ)` finitely generated; `T` is `ϖ`-torsion, so no claim | holds | none |
| `isAdmissibleAlgebra_iff_flat` | `a·x = 0`, `a ≠ 0` | rank one gives `ϖⁿ ∈ aO`, so `ϖⁿx = 0`; `simp` reduces it to `ϖ`-torsion ⇔ torsion | holds | none |
| `finitePresentation_of_fg`, `isAdicComplete` | `J = (ϖ)`; `O⟨T⟩`, `O[T]` | `J ≅ O`; `O⟨T⟩` complete, `O[T]` not tfp | holds | none |
| `completedAway_flat` | `f = 0`; `f = 1` | `B = 0`; `B = A` | holds | none |
| `ringKrullDim_genericFibre_le`/`_eq` | `O⟨T⟩/(ϖT)`; `O⟨S,T⟩/(ST−ϖ)`; `A = 0` | `0 ≤ 1`; `1 = 1`; `⊥ = ⊥` | holds | none |
| `isReduced_isPureDimensional_genericFibre` | `A/𝔪A = 0` | `1 = ma`, `|m| < 1`, so `ϖ` is a unit in complete `A`, hence `A = 0`: both sides empty | holds | none |
| `exists_unique_frobeniusLift_of_etale` | `pA = 0`; `ℤ_p → W(𝔽_{p²})` | the only lift is absolute Frobenius; the Witt Frobenius | holds | none |
| `fracPow_inter_spa` | `q = 0`; unit `g` | `{v(f) ≤ 1} = R({f,1}/1)`; `simp` leaves only `0 <ᵥ g^a` | holds, padding | R04 |
| `laurent_exact_of_finite` | `f = 1`; `f = 0` | `0 → M → M² → M → 0` exact; `B₂ = B₁₂ = 0` | holds | none |
| `GlueingSquare`, `projective_sections` | KL15 Prop. 2.7.5 proof | condition (c) is used only to lift maximal ideals, which is the field `exists_prime_comap_eq` | holds | none |
| `of_simpleLaurent`, `finite_sections_of_simpleLaurent` | maximal `m`; `M_i = R_i` | `R/m` complete and nonzero, so a point with support `m` lies in `U₁` or `U₂`; sections are `R` by exactness | holds | none |
| `denseBanach_inverseSystem_exact` | `V_n = 0`; constant `V`, `t = id` | trivial; `x₀ = 0`, `x_{n+1} = x_n − y_n` | holds | none |
| `isUniform_tfae` | `ℚ_p[ε]`, `‖a+bε‖ = |a|+|b|`; no Tate | `ε` fails all three; the `(c) ⇒ (b)` iteration never uses Tate | holds, narrower than source | R03 |
| `projectiveTrace_eq_categoricalTrace` | `ℚ×0 ⊂ ℚ×ℚ`; `R²`, `diag(a,d)` | `(1,0)`, while the Mathlib trace is `0`; `a + d` | holds | none |
| `Algebra.projectiveTrace`, `…Form` | `R×R`; `k[x]/x²`; `𝔽₂[x]/(x²−1)` | dot product; `Tr(1) = 2`; form `0`, not étale | holds | none |
| `projectiveTrace_eq_sum_geometricPoints` | `ℚ×ℚ(i)`, `(1,i)`; `B = 0` | `1 + i − i = 1`; `card 0 = finrank 0` | holds | none |
| `projectiveTrace_trans` | `k ⊂ k×k ⊂ k×k[x]/x²` | `Tr_{C/k}(1) = 3 = Tr_{B/k}((1,2))` | holds | none |
| `etale_iff_projectiveTraceForm_bijective` | `ℚ(√2)`; `ℤ[i]/ℤ` | Gram `diag(2,4)`, étale; discriminant `−4` not a unit, not étale | holds | none |
| `GelfandSpectrum.compactSpace_nonempty` | `A = 0`; `ℚ_p` | empty and compact; one point `|·|_p` | holds | none |
| `smoothingFun_eq_sSup` | `ℚ_p`, `x = p`; `ℚ_p[ε]`, `ε` | `1/p = 1/p`; `0 = 0` | holds | none |
| *proper-cohomology-adic-completion* | Kiehl-E Def. 3.1, Thm 3.4 | a-good filtration and null systems match p. 206; `Q_{k+s} → Q_k` sends `a′ˢx` to `aˢx = 0` | holds | none |

- Previous review at 6fcc928. R01 is repaired: lines 2715–2719, 2791–2795 and 2797–2802 are single citations of §4.9. R02 is repaired at line 9224 and in the docstring, R03 at lines 3923–3925 and R04 at lines 11646–11648. R05 is repaired at lines 11672–11680 and row 366. R06 is repaired in rows 557 and 562 and at line 8923, and row 320 is deleted. R07 is repaired: no italic Check label is duplicated. R08 is repaired at lines 11731–11733. R09 is repaired: neither sentence occurs. R10 is repaired: the description has its own AdicSpacesPartIII paragraph.
- Gate rerun: every counter is 0 except `outside-folder=24`, all in the twelve sibling folders this pull request owns. The worker's gate, including `lake build`, passed. Nothing changed outside the pull request's folders.
- Dependency check: `depcheck: 205 roadmaps, 1904 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- Elaboration of a scratch copy with `#check @` for all 35 declarations: 23 `sorry` warnings, no errors, no other warning. `IsRationalCompletion` drops only `[IsUniformAddGroup A]`, which its body does not use. The one-tactic probe closes none of `isAdmissibleAlgebra_iff_flat`, `fracPow_inter_spa`, `isUniform_tfae` or `projectiveTrace_eq_categoricalTrace`.
- Source locators checked against the text: 44. They are EGA I 10, EGA III₁ 12, Kiehl-E 2, TT 1, GK02 1, Conrad-MR 1, Conrad-AWS 1, Scholze15 3, BHW 2, KL15 7 and Stacks 4 (0200, 01YI, 01YL, 06AD). All are correct except the BHW version (R02).
- Library declarations opened at the pins: 22. Examples are `AdicRing/CompletedTensorProduct.lean:93, 176, 352`, `CompletedTensorProduct/Noetherian.lean:93`, `Restricted.lean:183`, `NoetherianType/Basic.lean:38` and `Quotient.lean:104`. Also opened: `Etale/Discriminant.lean:66, 122`, `RationalSubset/Basic.lean:146, 159`, `Refinement.lean:151, 184`, `Huber/OpenMapping.lean:130, 226` and `Morphisms/Thickening.lean:69`, and Mathlib `MvPowerSeries/Restricted.lean:159`.
- Cross-roadmap citations resolved: 31. They are SchemeAndStackFoundations §§4.9, 4.10, 4.12 and eight `Suggested.lean` names, StableReduction Layer 2, RigidAnalyticGeometry §§1.3 and 6.3 and its §§7.1–8.4 map (this head), PadicFunctionalAnalysis §§0.4, 1.2, 2.1–2.4 (this head), CompactOperators §0.1, PivotalSpherical Layers 0–2 and 10, DerivedModuleAlgebra §§1.T.1, 1.1, S.1, ModularCurves 0E, AlgebraicVectorBundles L0A, L0B, L2A and AdicSpacesPartII. The dropped declarations cited by AdicSpacesPartIV and EtaleCohomologyFoundations are mapped at lines 405–406 and 11546–11548.
- Overlap check: read RigidAnalyticGeometry (this head), AdicSpacesPartV, ClassicalAdicEtaleCohomology, PerfectoidTowers and TropicalAndBerkovichArithmetic (open), and AdicSpacesPartII, AdicSpacesPartIV and AdicEtaleGeometry (main). The shared objects and their owners:
  - Kiehl's theorems, proper mapping and proper GAGA: Part III; RigidAnalyticGeometry maps its §§7.1–7.5 and 8.4 here.
  - Completed field extension and Kiehl properness: RigidAnalyticGeometry §§1.3 and 6.3.
  - The Gel'fand spectrum: Part III R3.9; TropicalAndBerkovichArithmetic and ClassicalAdicEtaleCohomology cite it.
  - Huber-pair tensor products and morphism classes: AdicSpacesPartII.
  - Formal functions and existence for proper schemes: SchemeAndStackFoundations §§4.9–4.10 (R01).

## Not verifiable

- BL II (manifest: uncertified): Lem. 1.3(b), p. 405, Lem. 2.5(b), p. 409, and Thm 4.1, p. 419, cited by the three sampled R2.7 targets, were not read.
- Huber96 is not freely available. For Huber94 (Math. Z. 217), GDZ returned only the volume landing page. So Huber96 §1.9.4–1.9.6, p. 98, and Huber94 Rem. 4.6(iv), p. 544, are unchecked.

## Source issues

- **Error** in Scholze15 at Lemma III.2.13, p. 38: the source says `X*(ε) → X*` is an admissible blow-up; it should say it is the open chart, where `H̃a` generates, of the admissible blow-up of `(H̃a, p^ε)`; affects nothing.
- **Error** in KL15 at Definition 2.8.1, p. 59: the source lists boundedness of `A°` as equivalent to (a)–(c); it should say that (a)–(c) imply it; affects a stated result; corrected in print at KL16, Appendix A.
