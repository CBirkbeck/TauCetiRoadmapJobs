# Review of EtaleDualityAndPerverseSheaves (pull request #1040 at 54256cd)

**Verdict:** needs changes

Full review. Seven P3 findings, none blocking. The gate passes and no statement was found false.

## R01 (P3) — a supplier is named as a consumer

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md` line 7657: "LefschetzPencilsAndVanishingCycles uses the finite/integral Lefschetz and blow-up refinements."

**Claim:** LefschetzPencilsAndVanishingCycles consumes Layer 4 of this roadmap.

**Witness:** its README at the open head contains no occurrence of "EtaleDualityAndPerverseSheaves" (0 of 201 citing lines across all roadmaps); it is a supplier here (lines 13, 68) and precedes this roadmap in the merge order (70 against 109).

**Repair:** delete the sentence. If a later roadmap uses these refinements, name that roadmap and its section instead.

## R02 (P3) — five supplier declaration names exist in no roadmap and no pinned library

**Location:** `README.md` lines 3804 and 3855 "InvariantCycles.dualSupportAffineVanishing"; line 4165 "InvariantCycles.genericHyperplaneRestriction"; lines 4080 and 4620 "LefschetzPencil.veronese, `veronese_isClosedImmersion, veronese_hyperplane`".

**Claim:** LefschetzPencilsAndVanishingCycles §§3.4, 7b.7, 7b.9 declare these names.

**Witness:** `roadmaps grep --fixed` finds each of the five only in this README; the supplier's §7b.9 states an unnamed "Lemma (affine vanishing from a dual support bound)". Tau Ceti has only `Projectivization.veronese` (`LinearAlgebra/Projectivization/Veronese.lean:379`).

**Repair:** cite by section and statement title: "LefschetzPencilsAndVanishingCycles §7b.9, Lemma (affine vanishing from a dual support bound)"; "§7b.7"; "§3.4, Theorem (existence of Lefschetz pencils)". Drop the five names.

## R03 (P3) — a Check claims a Lean counterpart that does not exist

**Location:** `README.md` line 4668: "Further values of the hypersurface formula, checked in the suggested file: conic 0, cubic surface 6, quartic surface 21, quintic threefold `204 (b₃ = 204)`."

**Claim:** `Suggested.lean` checks these values.

**Witness:** `Suggested.lean` has eleven declarations, none about complete intersections; the values themselves are right: `(1−1)/2=0`, `(16+2)/3=6`, `(81+3)/4=21`, `(1024−4)/5=204`.

**Repair:** "Further values of the hypersurface formula: conic 0, cubic surface 6, quartic surface 21, quintic threefold 204."

## R04 (P3) — residue of the last two repairs: broken code spans and repeated Checks

**Location:** `README.md`, for example line 1454 "`K ∈ t₁.le 0, H⁰_{t₂}`(TK) `≅ pT(H⁰_{t₁}K)`"; line 1273 "`cl_X`(div `f`) `= 0`"; lines 1578 and 1584 (the same triangle on `𝔸¹` twice).

**Claim:** formulas are whole code spans, and each Check is stated once.

**Witness:** further broken spans at 1236, 1473, 1652, 1656, 1750, 2089, 2361, 2426, 2888, 3075, 3136, 3211, 3269, 3300, 3308, 3323, 3338, 3403, 3534, 3595, 3716, 3982, 4278, 4616, 5505, 6182, 6211, 6213, 6373, 7019, 7116, 7132–7136, 7218–7219; repeated Checks 1267/1277, 1269/1279; line 1580 carries a pasted supplier list.

**Repair:** line 1454: "`H⁰_{t₂}(TK) ≅ pT(H⁰_{t₁}K)` for `K ∈ t₁.le 0`"; line 1273: "`cl_X(div f) = 0`"; line 7116: "`NoTubularFixed(c,Z)`"; close the other spans likewise. Delete lines 1277, 1279, 1584; line 1580: "`j^*` is restriction along `U ⊂ X`". Cite or delete the reference entry [Dimca-2004].

## R05 (P3) — the letter `n` is both the invertible integer and the exponent of the coefficient ring

**Location:** `README.md` line 954: "`d, n` invertible on `S, Λ = O/πⁿ`"; likewise lines 220, 663, 703, 855, 1022, 1179; lines 891–896 write `O/πᵐ`, then `O/πⁿ`, then `O/πᵐ` for one ring.

**Claim:** the hypothesis makes the residue characteristic of `Λ` invertible.

**Witness:** `n = 1`, `Λ = O/π`: "1 invertible on `S`" holds for every `S`, including characteristic `ℓ`, where `R^{2d}f_!𝔽_ℓ(d) → 𝔽_ℓ` duality fails. Only the Conventions' standing "`ℓ` invertible" excludes it.

**Repair:** in the seven statements write "`ℓ` invertible on `S` (resp. in `k`), `Λ = O/πᵐ` with `m ≥ 1`"; in §0.7 use `O/πᵐ` throughout lines 890–898.

## R06 (P3) — one page range is off by one

**Location:** `README.md` line 5409: "Use [BBD-1982] Proposition 5.3.9, pp. 138–139, and Remarque 5.3.10, p. 140."

**Claim:** Proposition 5.3.9 and its proof are on pp. 138–139.

**Witness:** BBD-1982 line 5238: the statement begins on printed p. 139 (PDF page 140); its proof ends where Remarque 5.3.10 begins, BBD-1982 line 5276, p. 140. Page 138 holds Théorème 5.3.8 (line 5215).

**Repair:** "Proposition 5.3.9, pp. 139–140, and Remarque 5.3.10, p. 140."

## R07 (P3) — the description names a consumer the head contradicts and omits one open supplier from its order

**Location:** pull request description: "LefschetzPencilsAndVanishingCycles the finite and integral Lefschetz and blow-up refinements"; "The open pull requests that must merge first are in the merge order below."

**Claim:** the description states the consumers and every open supplier.

**Witness:** R01 for the first sentence. For the second: the README takes §5.2's affine formula from FourierDeligneTransform §2.7 (line 70; open, #2132), and neither the `depends-on` block nor the `merge-order` block lists #2132.

**Repair:** delete the LefschetzPencilsAndVanishingCycles clause from the summary block; add "#2132 FourierDeligneTransform" to the `depends-on` list and to the `merge-order` chain (after #873, before this pull request).

## Previous findings

- R01 (curve Euler–Poincaré owned twice) — repaired: line 4887 "For affine `U` over `k` of characteristic `p>0` this is FourierDeligneTransform §2.7 … imported and not proved again"; Scope line 13 and the `*Needs:*` line 4918 name it; the description names it (its generated blocks do not: R07).
- R02 (`bettiGrowthInEtaleTowers` unconsumed) — repaired: the target, its Checks and the Leray paragraph are gone; Scope: "The growth of cohomology in étale towers (BBD 4.5) enters only the proof of the affine weight criterion".
- R03 (flat trace translated) — repaired: lines 546–553 now define type `(∗)_d` first and list the four properties by content; compared again with SGA4-XVIII lines 2336–2345, no shared clause order.
- R04 (unnamed "separate extensions") — repaired: line 13 names LefschetzPencilsAndVanishingCycles §§0.10, 6.2, EtaleCohomologyFoundations §§F.5, 0.7, PurityForFlatCohomology Layer 8, EtaleDualityAndPerverseSheavesPartII §§5.1, 6.5 and GlobalShtukasAndFunctionFieldLanglands §1.4; all seven headings exist.
- R05 (slugs, broken spans) — partly: the slugs are gone; 40 lines still have broken spans (R04).
- R06 (25 repeated Checks) — partly: three pairs remain (R04). No definition fell below three Checks.
- R07 (`*Needs:*` lines) — repaired: the seven targets now carry them, for example line 2977 "*Needs:* the normalized systems of §3.1 above." and the Artin-vanishing target of §4.1 "EtaleCohomologyFoundations §§F.0.4, F.3, F.4.1–F.4.2, F.4.5".
- R08 (page range; Serre, Fulton) — repaired: "pp. 141–142"; both books have reference entries and chapter and section locators.
- R09 (two keys for one paper) — repaired: one key, [Varshavsky-LocalTerms-2023], with both versions in its entry.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.1 `uniformizerQuotient_selfInjective`, `finiteModule_eval_bijective` | `ℤ/4`, `M=ℤ/2`; `m=0`; pin | `M*=ℤ/2` via `1↦2`; `m=0` gives the zero ring, excluded by `0<m`; Tau Ceti has `ZMod` and principal-ideal divisibility only | hold; not at the pin |
| §0.7 `j_*` duality on a curve (sample) | puncture `s`, `Λ=O/πᵐ`, non-free `F` | `i_s^!j_*F=H¹(I,F)[−2]=F_I(−1)[−2]`; dual `(F^∨)^I(1)[2]`; `i_s^!` of the result has no `H⁰,H¹` | holds; Weil I (2.12), p.283 |
| §0.7 `Hom` order, relative duality (sample) | `G=F₁⊗F₂^∨`; `𝔸^d_S` | `G^∨=Hom(F₁,F₂)`, so `H²≅Hom_X(F₁,F₂)^∨(−1)`; `j=q−2d` gives `R^qf_*F=Hom(R^{2d−q}f_!F^∨,Λ)(−d)` | holds; letter clash R05 |
| §1.2 Chern classes (sample) | rank one; `T_{P^m}`; `O(1)²` | `ξ+c₁(L)=0`, `ξ=c₁(L^∨)`; Euler sequence `(1+h)^{m+1}`; `c₂=h²≠0` for `m≥2` | holds; Milne-LEC line 5385, p.140 |
| §2.1 `heart_abelian` | degenerate `t.le n=C`; pin | every `H^m_t=0` on a nonzero object; Mathlib `AbelianSubcategory.abelian` is the criterion, `Heart.lean` has no `Abelian` instance | genuine target |
| §2.2 exactness, recollement, gluing (sample) | `[±1]`; natural with natural; (f) both directions | `A[−1]∈le 0∩ge 1` forces `A=0`; `i^!K,j^*K≥0` gives `K≥0`; `i_*A`, `j_!B`, `j_*B` test nondegeneracy | holds; BBD 1.3.17 p.36, 1.4.10 p.48, 1.4.11 |
| §2.4 perverse `t`-structure (sample) | `𝔸²⊔𝔸¹`; `Λ_S[1]`; lisse costalk | `Λ_{𝔸¹}[2]` costalk degree `−2<−1`; `Λ_S[1]∈pD^{≥1}`; `ℋ^j(K)_x=0` for `j<−d−c` | holds; BBD (4.0.1) p.102, 4.2.9 p.112 |
| §2.7 smooth and affine morphisms (sample) | adjoints; `z↦z²`; `𝔸²∖0`; `𝔾_m⊂𝔸¹` | right adjoint `pH^{−d}Rf_*`, left `pH^dRf_!(d)`; `Hom` `0` against `Λ`; `R³j_*Λ` in degree 1; stalks `Λ`, `Λ(−1)` | holds; BBD 4.1.1 p.102, 4.1.10–12, 4.2.5 p.109 |
| §2.11 nonconstructible conditions (sample) | `⊕` skyscrapers; `j_!Λ[2]` on `𝔸²`; lowest `ℋ^b` | generic stalk 0, closed costalk degree 0; costalk `Λ[1]⊕Λ(−2)[−2]`; a section supported on `{x}^−` gives `ℋ^b(i_x^!K)≠0` | holds; BBD 2.1.2 p.56 |
| §3.3 coefficient extension (sample) | `K→λK→K⊗^LO/λ`; `E′/E` finite | perverse amplitude `[−1,0]`; `Hom⊗_EE′` by a basis | holds; BBD 6.1.2 (A″),(B″) p.149 |
| §3.9 diamond mates (sample) | `η_T` invertible, `φ:c^*T≅B`; zero category | `ε_B∘c^*R(φ)=φ∘ε_{c^*T}`, `ε_{c^*T}` invertible; counit `0→V` not invertible | holds; ECD-2026 lines 6784–6942, pp.163–167 |
| §5.2 curve Euler–Poincaré (sample) | Hurwitz; `g≠1` on `D`; Artin–Schreier `x^d` | `χ_c(V)=|G|(2−2g_C−#(C∖U))`; `Tr(g)=#Fix−#Fix=0`; `χ_c=1−d` | holds; SGA4half line 6371, p.189; Raynaud-1965 line 131, p.133 |
| §5.2 `Ext` vanishing, affine criterion (sample) | `Hom^i` sequence; `ℚ̄_ℓ[1]` on `𝔾_m`; `δ₁(1)` | invariants vanish `i≥1`, coinvariants `i−1≥1`, so `Hom^i=0` for `i≥2`; `H⁰` weight `2≥1`; weight `−2` | holds; BBD 5.1.15, 5.2.1 p.129 |
| §5.3 purity of `j_!*` (sample) | shift; split nodal cubic | `IC⁰[d]`: `w→w+d`, `H^i` weight `w+d+i`; `IH¹=H¹(ℙ¹)=0`, `H¹(X)` weight 0 | holds; BBD 5.3.2 p.135, 5.3.4 p.136 |
| §5.4 `exists_unique_torsion_subobject` | quiver `1→2`; direction | sub `S₂∈S⁺`, quotient `S₁∈S⁻` non-split; subobjects `0,S₂,P₁`, none works; Lean `P=S⁺`, as README | holds; BBD 5.3.6 p.137 |
| §5.5 semisimplicity, Jordan blocks (sample) | `E=ℚ_ℓ` on a point; `Spec 𝔽_{q²}` | `E[T]/(f)⊗E_n≅E[T]/(fⁿ)`; `π_*S₁`, `d=2` | holds; page of 5.3.9 is R06 |
| §5.6, §5.8 `decompositionTheorem`, `relativeHardLefschetzTheorem` | blow-up of `𝔸²`; nonsplit arithmetic class; weights | `ℚ̄_ℓ[2]⊕δ₀(−1)`, weight 2; `Hom¹(F,G)_F=ℚ̄_ℓ` inside `Hom²(F₀,G₀)`; `w+i−2i=w−i` | holds |
| §6.3 trace classes (sample) | `M^I`, `σ`; genus `g`; `[f]` proper | `(x_i)↦(u_i(x_{σ(i)}))`, trace `Σ_{σ(i)=i}Tr(u_i)`; `2−2g`; `Fix(c)` closed in `C×_BFix(b)` | holds; Varshavsky-LV-2007 lines 323–371, pp.9–10 |
| §6.5 `fujiwaraVarshavskyTraceFormula` | `Z=∅`; `k[ε]/ε²`; quantifiers | `n=1`; `I²=0⊂I³`, `n=2`; `d` before `F,n,u` as in the source | holds; Varshavsky-LV-2007 lines 749–762 |
| §7.1 tubular conditions (sample) | `x↦λx`; `x³+yz`, `g=(x,−y,−z)` | `tλv=v` only for `t=λ⁻¹`; tangent cone `yz=0` has the fixed `x`-line | holds; Varshavsky-LocalTerms-2023 lines 356–398 |
| §7.4 semisimple fixed subschemes (sample) | same surface; `g=(x,ty,t⁻¹z)`; `J` | `gr_IA=k[x]/(x³)[y,z]`, fixed part `Z`; bad set `{t,t⁻¹}`; `J=B₀·⊕_{χ≠0}B_χ+J²` has no trivial part | holds |
| §7.5 isolated local terms (sample) | translation on `ℙ¹`; involution | Lefschetz number 2 at one point, stalk trace 1; `1+1=2` | holds; Varshavsky-LocalTerms-2023 lines 407–425 |
| §8.1 `form_similitude_det_alt`, `_symm` | rank 1, `s=±a`; subtraction | `m_−=0`: `det=s`; `m_−=1`: `det=−(−a)=a`; `m_+≤b`, no truncation | hold |
| §8.2 `poincareReciprocityExport` | `ℙ¹`; genus `g`; swapped rulings; `d` odd | `1−qt=(−qt)(1−1/(qt))`; `Δ=q^{1−g}`; `det F₂=−q²`; `χ≡b_d≡0` | holds; Milne-LEC line 6063 agrees, sign `(−1)^{m_+}` |
| §4.7 hypersurface Betti numbers (R03) | `(m,d)=(1,2),(2,3),(2,4),(3,5)` | 0, 6, 21, 204 | values right, Lean claim wrong |
| §4.1, §4.2 supplier names (R02) | five names | 0 hits outside this README | names do not exist |

- Gate rerun at 54256cd: every scanner 0, `OK`; the worker's record adds `build=0`. Dependency check: `depcheck: 245 roadmaps, 2244 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. No change outside the folder.
- `lake env lean` on `Suggested.lean`: seven `sorry` warnings only. One-tactic probe on a scratch copy (`simp`, `rfl`, `infer_instance`, `constructor <;> simp`, `trivial`, `aesop`): closes none of the seven theorems. `#check` of all eleven: types match the README; `gradedDelta` drops `[FiniteDimensional]`, which its only use carries; the Lean datum does not require `H^i=0` outside `[0,2d]` and does not use those degrees.
- Headline theorems: biduality and flat trace (0), Chern classes and Chow descent (1), abelian heart, recollement, simple objects (2), adic comparison (3), refined Lefschetz (4), weight filtration, decomposition, relative hard Lefschetz (5), Fujiwara–Varshavsky (6), isolated local terms (7), graded reciprocity (8). The statable ones are stated; the docstring names the rest by layer and missing carrier. No padding.
- Source locators checked against the text: 71, in BBD-1982 (41), Varshavsky-LV-2007 (11), Varshavsky-LocalTerms-2023 arXiv v3 (6), ECD-2026 (7), Deligne-WeilI-1974 (3), Deligne-WeilII-1980 (2), Milne-LEC (3), SGA4-XVIII (2), SGA4half, Raynaud-1965, Yu-2023, Milne-AG-2017, Hansen-Kaletha-Weinstein-2022 (1 each); one off by a page (R06).
- Library declarations opened at the pins: Mathlib `AbelianSubcategory.abelian` (`AbelianSubcategory.lean:298`), `TStructure.heart` (`Heart.lean:44`), `isIso_counit_app_iff_mem_essImage` (`Adjunction/FullyFaithful.lean:195`), `IsReflexive` (`Dual/Defs.lean:203`), `iSup_maxGenEigenspace_eq_top`, `finrank_maxGenEigenspace_eq`, `trace_permutation`, `exists_finite_inj_algHom_of_fg`, `ModuleCat.projectiveResolution`, `IdealSheafData.comap`; Tau Ceti `Module.Baer.of_surjective_smul` (`Injective/PrincipalIdealRing.lean:38`), `Injective/SelfInjective.lean`.
- Cross-roadmap citations resolved: 61 section headings in 22 roadmaps, on main or at the open heads, and 38 supplier declaration names; five names missing (R02). Every other dotted name is in the cited supplier or the pinned libraries.
- Overlap check: read LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations (main and its open revision), DeligneWeightsAndPurity, FourierDeligneTransform, EtaleDualityAndPerverseSheavesPartII, SchemeAndStackFoundations. Curve Euler–Poincaré on affine curves in characteristic `p`: FourierDeligneTransform §2.7, cited. Curve case of the simple-object classification: FourierDeligneTransform §5.2; every dimension: §2.10 here. Lisse weight filtration: DeligneWeightsAndPurity §8.18; perverse: §5.4 here. Absolute purity: LefschetzPencilsAndVanishingCycles §0.10. Dimension functions and general perversities: Part II. Smooth and affine perverse exactness: §2.7 here; see the human reviewers' section. Ownership against open pull requests outside these lists was not checked.
- Source independence: 15 passages compared with 10 sources, none shared; largest share BBD-1982, 78 of 224 bracketed citations of non-roadmap sources; contents compared with BBD-1982: independent (Layer 2 draws on its chapters 1, 4, 2, 3 out of order and adds §§2.11–2.12; Layer 5 splits its §5.3 over three sections and inserts §5.7; its order is forced by the `*Needs:*` lines, for example §5.4 needs §§5.2–5.3 and §5.6 needs §§5.2, 5.4, 5.5).

## Not verifiable

- Jantzen-2003 (§7.4, exact character projections): no legal copy found by the sources service; cited by locator only.
- Varshavsky-LocalTerms-2023, journal pagination: the publisher's host is in no licence class of the sources service; the statements were read in arXiv v3 and the journal page numbers were not checked.
- Huber-1996, Dimca-2004, Liu–Tian–Xiao–Zhang–Zhu-2022, Serre-AlgLoc, Fulton-1998: paywalled, cited by locator only.
- Katz-ACT-1993, deCataldo-Migliorini-2009, Zhu-2017, Lu-Zheng-2022, Juteau-2009, Yun-Zhang-2019, Verdier-1983, Bhatt-Scholze-proetale-2015, SGA4-XIV, SGA4-XVII, the Stacks tags: not opened this round (none is the only support of a sampled target).
- Outside the fifteen sampled targets, every statement and Check was read and computed against the roadmap itself; steps their proof routes take from inside source proofs were not opened in the sources.

## Source issues

- **Error** in Varshavsky-LocalTerms-2023 at Lemma 5.1 and Corollary 5.6, arXiv v3 pp. 10–11: the source says fixed points of the normal cone equal the normal cone of the fixed loci, so a semisimple isolated fixed point has no nonzero fixed cone vector; it should be only a closed immersion: for `(x,−y,−z)` on `x³+yz=0` the cone `yz=0` has a fixed line; affects a stated result.
- **Misprint** in Yu-2023 at equations (6.1.1)–(6.1.2), arXiv v5 p. 42: the source says `H⁰` of `F₁⊗F₂^∨` is `Hom_X(F₁,F₂)` and `H²_c` is the dual of `Hom_X(F₂,F₁)`; it should be the two `Hom` spaces exchanged; affects nothing.

## For the human reviewers

- Scope: FourierDeligneTransform (#2132, README line 77) declares a gap asking EtaleCohomologyFoundations §F.8 for smooth and affine perverse `t`-exactness; §2.7 of this README (lines 2169–2247) states those theorems; §F.8 does not, on main or at #1891.
- Scope: `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4091` on main names this roadmap as owner of absolute purity and Brauer-group purity; this README (line 13) assigns them to LefschetzPencilsAndVanishingCycles §0.10 and PurityForFlatCohomology Layer 8.
- Licence: ECD-2026 is an author manuscript dated 14 April 2026 on the author's page, cited by manuscript pagination for §3.9 (`README.md` line 7673).
- Licence: SGA4-XIV, SGA4-XVII and SGA4-XVIII are cited from a retyped edition on a personal page (`README.md` lines 7703–7707); the sources service read it as an author page.
- Licence: Milne-AG-2017 is cited from the author's copy of a Cambridge University Press book (`README.md` line 7695).
