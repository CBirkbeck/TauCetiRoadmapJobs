# Review of EtaleDualityAndPerverseSheaves (pull request #1040 at 3546ffe)

**Verdict:** needs changes

Full review. Four P3 findings, none blocking. The gate passes and no statement was found false.

## R01 (P3) — one code span still joins a variable to the next formula on about sixty lines

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md` line 620: "over an algebraically closed field `k, n` invertible in `k, Λ = ℤ/n`"; line 4622: "degree `d, b_m^0 = ((d − 1)^{m+2} + (−1)^m(d − 1))/d`".

**Claim:** each code span is one formula.

**Witness:** same defect at lines 387, 410, 437, 468, 504, 555, 621, 623, 772, 817, 908, 995, 1038, 1052, 1138, 1438, 1442, 2042, 2200, 2250, 2254, 2373, 2403, 2462, 2469, 2510, 2566, 2688, 2727, 2760, 3868, 4088, 4187, 4394, 4603, 4605, 4866, 4947, 5042, 5098, 5233, 5414, 5492, 5572, 5613, 5848, 5931, 6101, 6179, 6248, 6517, 6519, 6683, 6762, 6764, 6912, 7352, 7591, 7630, 7634.

**Repair:** close the span at the comma. Line 620: "field `k`, `n` invertible in `k`, `Λ = ℤ/n`". Line 4622: "degree `d`, `b_m^0 = ((d − 1)^{m+2} + (−1)^m(d − 1))/d`". Line 995: "a perfect field `k`, `n` invertible, and". The other lines likewise.

## R02 (P3) — `E` names the exceptional divisor, a vector bundle and the coefficient field in one statement

**Location:** `README.md` lines 4387–4390: "`E = π^{−1}(Z)` the exceptional divisor … `ζ := c₁(O_E(1))` … `Λ` is a finite ring whose annihilator is invertible in `k, O_E` or `E`"; lines 4485–4486: "`P(E) → X` … `O_E` or `E, σ^*`".

**Claim:** `O_E` and `E` are the coefficient ring and field of the Conventions.

**Witness:** in line 4387 `O_E(1)` is a line bundle on the divisor `E`; three lines later `O_E` is a ring of integers. In line 4485 `E` is a vector bundle and in 4486 a field.

**Repair:** in §4.5 write the exceptional divisor `D` (`D = π^{−1}(Z)`, `j : D → X̃`, `ζ := c₁(O_D(1))`, `D ≅ P(N_{Z/X})`, `[D]² = −1`) and the bundle `V` (`P(V)`, `Fl(V)`, as line 4292 already does); keep `O_E`, `E` for coefficients.

## R03 (P3) — one page range is off by one

**Location:** `README.md` line 6191: "this is the construction in Varshavsky Lemma 1.5.4, pp.14–15."

**Claim:** Lemma 1.5.4 and its proof are on pp. 14–15 of arXiv v2.

**Witness:** Varshavsky-LV-2007 line 569: the statement is on p. 15 (page header at line 549); the proof ends at line 592, on p. 16 (header at line 587). Page 14 holds 1.5.1–1.5.3.

**Repair:** "Varshavsky Lemma 1.5.4, pp. 15–16."

## R04 (P3) — two hypothesis lines keep an integer `n` their statements no longer name

**Location:** `README.md` line 671: "`X` separated of finite type over a field `k`; `n` invertible in `k`."; line 745: "`f` smooth proper with geometrically connected fibres, `n` invertible on `S`."

**Claim:** the hypothesis line restates the statement's hypotheses.

**Witness:** the statements (lines 663, 703, 740) now read "`ℓ` invertible in `k`, `Λ = O/πᵐ` with `m ≥ 1` (or self-injective and killed by an integer invertible in `k`)"; no `n` is introduced.

**Repair:** line 671: "`ℓ` invertible in `k` (for general `Λ`, the integer killing `Λ` invertible in `k`)". Line 745: "`ℓ` invertible on `S`".

## Previous findings

- R01 (supplier named as consumer) — repaired: line 7646 no longer names LefschetzPencilsAndVanishingCycles; it reads "WeilConjectures uses the complete-intersection results of §§4.3 and 4.7 … ExponentialSumsAndCircleMethodPartII uses §§4.1, 4.3 and 4.6–4.7", and both consumers cite those sections.
- R02 (five names found nowhere) — repaired: none of the five occurs; the citations read "§7b.9 (Lemma (affine vanishing from a dual support bound)", "§7b.7, Theorem (generic noncharacteristic hyperplane restriction)", "§3.4, Theorem (existence of Lefschetz pencils)", and the three titles are in the supplier at its open head.
- R03 (Check claiming a Lean counterpart) — repaired: line 4661 "Further values of the hypersurface formula: conic `0`, cubic surface `6`, quartic surface `21`, quintic threefold `204`".
- R04 (broken spans, repeated Checks) — partly: the forty listed lines and the three repeated Checks are repaired, [Dimca-2004] is cited; the same span defect remains elsewhere (R01).
- R05 (`n` as integer and exponent) — partly: the seven statements read "`ℓ` invertible … `Λ = O/πᵐ` with `m ≥ 1`"; two hypothesis lines were left (R04).
- R06 (page range) — repaired: "Proposition 5.3.9, pp. 139–140".
- R07 (description) — repaired: the consumer clause is gone and the prose reads "those in the merge order below and FourierDeligneTransform, whose §2.7 the README imports in §5.2".

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.1 `uniformizerQuotient_selfInjective`, `finiteModule_eval_bijective` (sample) | `ℤ/4`, `M=ℤ/2`; `m=0`; zero ring; pin | dual `ℤ/2` via `1↦2`; `m=0` excluded by `0<m`; Tau Ceti has `Module.Baer.zmod_self` and divisible modules over principal rings only | hold; not at the pin |
| §0.2 biduality, recollement (sample) | `Λ=𝔽_ℓ[ε,η]/(ε,η)²`; closed point of a curve | socle dimension 2, not self-injective; `i^!Λ=D(Λ(1)[2])=Λ(−1)[−2]` | holds; SGA4half Dualité 1.3–1.4, Th. finitude 4.3–4.7 |
| §0.4 flat trace (sample) | `k[x,y,z]/(z²)`; `P¹⊔P¹`; `F=0` | trace `×2` on `H⁴_c≅Λ`; `Tr(a,b)=a+b`, surjective, not injective; criterion not an iff for `F=0` | holds; SGA4-XVIII lines 2336–2390, 2530 |
| §0.5 relative and Poincaré duality (sample) | `Spec 𝔽_q`, `K=Λ`; `𝔾_m`; non-free `F` | `RΓ` in degrees 0, 1 against dual in 0, −1; `H¹_c≅Λ` dual to `H¹(Λ(1))`; `Ext^q(M,Λ)=0` gives degreewise form | holds; SGA4-XVIII line 3448, p.586 |
| §1.1 semi-purity, supported classes (sample) | `xy=0` in `𝔸²`, `Λ=ℤ/3`; degree `2c+1` | `ℋ²_Z` stalk `Λ²` against `Λ_Z` stalk `Λ`; `H^{2c+1}_Y=0` gives injectivity | holds; Milne-LEC line 5324, p.138 |
| §1.2 Chern classes (sample) | rank one; `T_{P^m}`; `O⊕O(1)` | `ξ+c₁(L)=0` with `O(−1)=L`; `(1+h)^{m+1}`; `1+h` | holds; Milne-LEC lines 5377–5393, p.140 |
| §1.3 Chow classes (sample) | `y=0`, `y=x²`; elliptic curve; line in `P²` | length 2 in every characteristic; `cl([p]−[q])=0`; `Tr(cl(L)²)=1=deg N` | holds; SGA4half Cycle 2.3.1–2.3.10, pp.144–150 |
| §2.3 intermediate extension, tilting (sample) | `𝔾_m⊂𝔸¹`; `T=0`; `F=0`; `D^b_fg(ℤ_ℓ)` | sub `i_*Λ_0` of `j_!Λ[1]`; `t⁺=t`; `t⁺.le 0=t.le 1`; `ℤ/ℓ[−1]` in the heart, `ℤ/ℓ[0]` not | holds; BBD lines 2112–2156, pp.54–55; Juteau lines 1603–1657 |
| §2.5 perverse duality (sample) | `Λ_C[1]`; `ℤ_ℓ`, `ℤ/ℓ[0]` | `Λ_C(1)[1]`; dual `ℤ/ℓ[−1]`, not perverse | holds; BBD 2.2.8 p.69, 4.0 p.102 |
| §2.11 nonconstructible conditions (sample) | `⊕` skyscrapers; `j_!Λ[2]` on `𝔸²` | generic stalk 0, closed costalk degree 0; costalk `Λ[1]⊕Λ(−2)[−2]`, degree `−1<0` | holds; BBD line 2182, p.56 |
| §4.5 blow-up splitting (sample; R02) | `c=1,2,3`; `j^*j_*`; Euler characteristic | empty sum; `−ζ` columns from `O(−E)|_E=O(1)`; `χ(X̃)=χ(X)+(c−1)χ(Z)`; `[E]²=−1` | holds; notation R02 |
| §4.7 hypersurface Betti numbers (sample; R01) | `(m,d)=(1,3),(2,2),(1,2),(2,3),(2,4),(3,5)`; `d=1` | 2, 1, 0, 6, 21, 204; 0 | holds; Milne-LEC line 4305, p.110 |
| §5.4 `exists_unique_torsion_subobject` | quiver `1→2`; uniqueness | `0→S₂→P₁→S₁→0` non-split, no `W`; image of `W` in `F/W′` has constituents in both classes, so 0 | holds; Lean `P=S⁺` as README |
| §5.5 semisimplicity, Jordan blocks (sample) | `E₂` on `Spec 𝔽_q`; `Spec 𝔽_{q²}`; `Rj_*ℚ̄_ℓ[1]` | geometrically split, arithmetically not; `π_*S₁`, `d=2`; `i^!=0`, `pH⁰i^*=ℚ̄_ℓ(−1)` | holds; BBD lines 5215–5282, pp.138–140 |
| §6.1 compactification (R03) | page of Lemma 1.5.4 | statement p.15, proof ends p.16 | locator off by one |
| §6.2 correspondences (sample) | graphs of `g`, `h`; legs reversed; fold of two points; translation on `𝔸¹` | support `X`, legs `g∘h`, `id`; `F→g^!F`; pushforward `a+b`; `g(0)=1∉{0}` | holds; Varshavsky-LV-2007 lines 223–314, 528–547 |
| §8.1 `form_similitude_det_alt`, `_symm` (sample) | rank 1, `φ=−s`; characteristic 2; truncation | `m_−=1`, `det=−s`; `s=−s` breaks parity, excluded by `2≠0`; `m_+≤b` | hold |
| §8.2 `poincareReciprocityExport` | `ℙ¹`; genus `g`; swapped rulings; `d=0`; `d` odd | `1−qt=(−qt)(1−1/(qt))`; `Δ=q^{1−g}`; `det F₂=−q²`; `det²=1`; `χ≡b_d≡0` | holds; Weil I line 331, pp.281–282 |
| §2.1 `heart_abelian` | pin | `Heart.lean:44` defines `heart`, lists the abelian structure as not done; `AbelianSubcategory.abelian` (`:298`) is the criterion | genuine target |
| §0.5 hypothesis lines (R04) | lines 671, 745 against 663, 703 | statements name `ℓ`, `m`; hypothesis lines name `n` | stale letter |

- Gate at 3546ffe: every scanner 0, `build=0`, `OK`. Dependency check: `depcheck: 245 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No change outside the folder.
- `lake env lean` on `Suggested.lean`: seven `sorry` warnings only. One-tactic probe on a scratch copy (`simp`, `rfl`, `infer_instance`, `trivial`, `constructor <;> simp`, `simp_all`, `⟨inferInstance⟩`): closes none of the seven theorems. Elaborated types of all eleven declarations compared with the README: they agree; `gradedDelta` does not use `[FiniteDimensional]`, which its only use carries.
- Headline theorems: biduality and flat trace (0), Chern classes and Chow descent (1), abelian heart, recollement, simple objects (2), adic comparison (3), refined Lefschetz (4), weight filtration, decomposition, relative hard Lefschetz (5), Fujiwara–Varshavsky (6), isolated local terms (7), graded reciprocity (8). The statable ones are stated; the docstring names the rest by layer and missing carrier. No padding.
- Source locators checked against the text: 50, in BBD-1982 (13), Milne-LEC (10), SGA4-XVIII (9), Varshavsky-LV-2007 (8), SGA4half (4), Deligne-WeilI-1974 (3), Juteau-2009 (2), Stacks-MoreEtale (1); one off by a page (R03).
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, as the manifest): Tau Ceti `Module.Baer.zmod_self` (`Algebra/Module/ZMod/Injective.lean:50`), `IsAlt.even_finrank` (`LinearAlgebra/BilinearForm/SymplecticBasis.lean:365`), `LinearMap.trace_pi` (`LinearAlgebra/Trace/Pi.lean:42`), `det_eq_of_compl₁₂_self_eq_smul` (`LinearAlgebra/Determinant/Basic.lean:246`), `IsIsometry.det_sq_mul_det_toMatrix_self` (`LinearAlgebra/BilinearForm/Isometry.lean:370`), `IsInvolutiveDual`, `dualityEquivalence` (`CategoryTheory/InvolutiveDual.lean:50, 65`), `Algebra/Module/Injective/SelfInjective.lean`; Mathlib `AbelianSubcategory.abelian`, `TStructure.heart`, `LeftTExact.mk`, `RightTExact.mk`, `iSup_maxGenEigenspace_eq_top`, `finrank_maxGenEigenspace_eq`, `exists_finite_inj_algHom_of_fg`, `ellAdicSheaf`, `AlgebraicCycle`.
- Cross-roadmap citations resolved: the ten names the resolver listed are in their suppliers (`Chow.gysin`, `Chow.graphPullback` in SchemeAndStackFoundations §§5.5–5.6; `ClassicalAlgebraic.*`, `VanishingCycles.etaleFiniteness` in EtaleCohomologyFoundations; `ClassicalDerived.functorCoherence` in EnhancedDerivedSheaves §0.4; the three trace-formula names in InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4; `Conductor.swanConductor` in ArithmeticGaloisRepresentations §3.1); twelve supplier headings of LefschetzPencilsAndVanishingCycles and the five consumers' section citations also resolve.
- Overlap check: read LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations (main and its open revision), DeligneWeightsAndPurity, FourierDeligneTransform, EtaleDualityAndPerverseSheavesPartII, SchemeAndStackFoundations. Euler–Poincaré on affine curves in characteristic `p`: FourierDeligneTransform §2.7, cited. Curve case of simple perverse sheaves: FourierDeligneTransform §5.2; every dimension: §2.10 here. Absolute purity: LefschetzPencilsAndVanishingCycles §0.10. Dimension functions, general perversities: Part II §§5.1, 6.5. Lisse weight filtration: DeligneWeightsAndPurity; perverse: §5.4 here. Smooth and affine perverse exactness: §2.7 here (see the human reviewers' section). Ownership against open pull requests outside these lists was not checked.
- Source independence: 11 passages compared with 5 sources (SGA4-XVIII, Milne-LEC, Juteau-2009, Varshavsky-LV-2007, Deligne-WeilI-1974), none shared (longest common run five words, at Varshavsky-LV-2007 line 269); largest share BBD-1982, 78 of 231 bracketed citations of non-roadmap sources; contents compared with BBD-1982: independent (Layer 2 draws on its chapters 1, 3, 4, 2 out of order and adds §§2.11–2.12; Layer 5 splits its §5.3 over §§5.3–5.5 and inserts §§5.7–5.8; the order §5.2 → §5.4 → §5.6 is forced by their `*Needs:*` lines).

## Not verifiable

- This round read in full: Scope, Conventions, the supplier contracts, §§0.1–0.2, 0.4–0.5, Layer 1, §§2.3, 2.5, 2.11, 4.5–4.7, 5.5, 6.1–6.2, Layer 8, the statements of §§2.1 and 5.4, and every line the change set touches. The other sections were scanned for the defects of R01–R04 and for citations, not recomputed.
- Fulton-1998, Serre-AlgLoc (§1.3), Liu–Tian–Xiao–Zhang–Zhu-2022 (§4.5), Jantzen-2003, Huber-1996: no legal copy read; cited by locator only.
- SGA4-XVIII Proposition 3.1.8, p. 571: the statement (line 2960) lies between the margin marks 570 and 572; the mark 571 is missing from the extraction.
- Milne-LEC Summary 27.14: Remark 27.13 is on p. 159 (line 6063); the Summary's heading was not found in the extraction.
- Stacks tags 00OE, 0AZR, 0B08, 03SI, 0EKE, Lu-Zheng-2022 Construction 2.6, Deligne-WeilII-1980 (3.4.1)(iii) and §4.3, Angeniol-1976, Varshavsky-LocalTerms-2023: not opened this round.

## Source issues

- none

## For the human reviewers

- Scope: FourierDeligneTransform (its README line 77, open) declares a gap asking EtaleCohomologyFoundations §F.8 for smooth and affine perverse `t`-exactness; §2.7 of this README states those theorems; §F.8 does not, on main or in its open revision.
- Scope: `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4091` on main names this roadmap as owner of purity for the Brauer group; this README (line 13) assigns it to PurityForFlatCohomology Layer 8 and absolute purity to LefschetzPencilsAndVanishingCycles §0.10.
- Licence: ECD-2026 is an author manuscript dated 14 April 2026 on the author's page, cited by manuscript pagination for §3.9 (`README.md` line 7662).
- Licence: SGA4-XIV, SGA4-XVII and SGA4-XVIII are cited from a retyped edition on a personal page (`README.md` lines 7692–7696); the sources service read it as an author page.
- Licence: Milne-AG-2017 is cited from the author's copy of a Cambridge University Press book (`README.md` line 7684).
