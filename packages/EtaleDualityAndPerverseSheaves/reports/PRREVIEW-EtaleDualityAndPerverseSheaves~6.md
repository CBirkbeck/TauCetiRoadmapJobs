# Review of EtaleDualityAndPerverseSheaves (pull request #1040 at 40031fa)

**Verdict:** needs changes

Full review. One P2 and four P3 findings. The gate passes and no statement was found false.

## R01 (P2) — §1.2 states étale Chern classes on every scheme; its supplier gives the projective-bundle formula on qcqs schemes only

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md` lines 1079 and 1087–1089: "Let `X` be a scheme with `n` invertible … Quasi-compactness is needed only for the assertion that the total Chern class is a unit; individual Chern classes and the Whitney identity do not need it."

**Claim:** the classes `c_r(E)` and the Whitney formula are obtained on an arbitrary scheme from EtaleCohomologyFoundations §§0.9, F.7; the coefficient ring `Λ` of the statement is not named.

**Witness:** `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` line 1122 on main (line 1816 at its open head): "For `n>0` invertible on a qcqs scheme `X`, provide … the étale projective bundle formula". Line 4284 of this README keeps "quasi-compact quasi-separated" and finite `Λ`.

**Repair:** line 1079: "Let `X` be a quasi-compact quasi-separated scheme, `n` invertible on `X` and `Λ` a finite ring killed by `n` (in applications `X` is smooth over a perfect field)." Lines 1087–1089: "`X` quasi-compact quasi-separated and `n` invertible, the range of the projective-bundle formula of EtaleCohomologyFoundations §0.9; `E` locally free of finite rank." Line 1096: "It is a unit: a finite trivializing cover bounds …". Delete the last sentence of the paragraph at lines 1119–1122.

## R02 (P3) — two sentences defer work to an unnamed "Part II"

**Location:** `README.md` line 5611: "The perfect-space transport remains a Part II input."; line 7422: "The perfect-scheme transport is a separate Part II target."

**Claim:** another roadmap owns the transport of the decomposition theorem and of local terms to perfect schemes.

**Witness:** no roadmap or section is named. EtaleDualityAndPerverseSheavesPartII (open) has Layers 0–8 on alterations, uniformization, Gabber finiteness, dualizing complexes and tilting; none states a perfect-scheme decomposition or local-term theorem.

**Repair:** delete both sentences; the two statements are complete without them. If an owner is meant, name it once in Scope and ownership by roadmap and section.

## R03 (P3) — code spans around words, source names and layer letters

**Location:** `README.md` lines 384–385: "(Var `1`) `Tr_f` is natural in `F`"; line 386: "of constant `rank r`"; line 274: "(used for Weil `I` 2.12)"; line 66: "JacobianChallenge Layers `A, D` and `F` supply".

**Claim:** a code span holds a formula.

**Witness:** same defect at lines 856, 890, 908, 921, 4068, 7565 (Weil `I`); 842, 908, 914 ((2.14) `A`/`E`); 4155, 7395 (Part `I`); 457, 493, 524, 535, 989, 4076 (Layer `A`/`D`); 850, 1080, 1087, 4287, 4296, 4305, 4306, 4372, 4485, 4530, 4621 (`rank …`); 5141, 5213 (`length`).

**Repair:** take the word out of the span. Line 384: "(Var 1) `Tr_f` is natural"; 386: "of constant rank `r`"; 274: "Weil I 2.12"; 66: "Layers A, D and F supply"; 842: "(2.14) A)"; 1080: "of rank `m + 1`"; 4621: "of rank `b_m^0 = dim H^m(X, ℚ_ℓ)_0`"; 5141: "of finite length". The other lines likewise.

## R04 (P3) — three Checks compute nothing

**Location:** `README.md` line 921: "Used in Weil `I` (3.9) and Weil II (3.3.5) to turn upper weight bounds into lower bounds"; line 5609: "The finite-type proper models and resolutions … are instances, with the purity of their inputs established by the consumer."

**Claim:** each Check is a test of the statement above it.

**Witness:** neither bullet states a value, a degenerate case or a non-example; both hold for any statement in their place. Line 5611 mixes one computed fact (`π_*ℚ̄_ℓ[d] = IC_μ ⊕ C`) with a remark on a source's misprint.

**Repair:** line 921: keep "The pairing is on `j_*F`, not on `j_!F`: for `j : 𝔾_m → ℙ¹` and `F = Λ ≠ 0`, `H⁰(ℙ¹, j_!Λ) = 0` while `H²(ℙ¹, j_!Λ(1)) = H²_c(𝔾_m, Λ(1)) = Λ`, so no perfect pairing." Move the uses named in lines 921 and 5609 to Downstream consumers. Line 5611: keep the first sentence and the shift `[d]`; drop the rest.

## R05 (P3) — §7.5 (b) carries a smoothness hypothesis that (d) shows is not needed

**Location:** `README.md` lines 7417–7418: "(b) If `X` is smooth at an isolated fixed point `x` of a semisimple element `g` … the same equality follows"; line 7433: "Only (b) requires smoothness at `x`."

**Claim:** part (b) needs `X` smooth at `x`.

**Witness:** part (d), lines 7422–7425, states the same equality "even for singular nonnormal `X`"; the Check at line 7405 computes it on the singular `Spec k[x,y,z]/(x³+yz)` with `g=(x,−y,−z)`.

**Repair:** delete part (b), the sentence "Only (b) requires smoothness at `x`" and the proof step "(b) Apply semisimpleIsolatedFixedSubschemeNormalCone …"; relabel (c), (d) as (b), (c) and write "in (b) as well as (d)" at line 7434 as "in (c)".

## Previous findings

- R01 (spans joining a variable to the next formula) — repaired: line 620 "field `k`, `n` invertible in `k`, `Λ = ℤ/n`"; line 4622 "of degree `d`, `b_m^0 = …`"; no span of that shape remains (what remains is R03, a different defect).
- R02 (`E` for divisor, bundle and field) — repaired: line 4387 "`D = π^{−1}(Z)` the exceptional divisor with `j : D → X̃`", line 4485 "`P(V) → X`".
- R03 (page range) — repaired: line 6191 "Varshavsky Lemma 1.5.4, pp. 15–16".
- R04 (stale `n`) — repaired: line 671 "`ℓ` invertible in `k` (for general `Λ`, the integer killing `Λ` invertible in `k`)"; line 745 "`ℓ` invertible on `S`".

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.3 quasi-finite flat and curve traces (sample) | `t↦t²` on `𝔸¹_ℂ`, `F=i_*𝔽₂`; Frobenius over `𝔽̄₂`, `Λ=𝔽₃`; double line, `n=2`; `𝔾_m` | `Tr=2=0`, no unit exists; `2ε₀` with `2⁻¹η₀`; `Tr=×2=0`; `H¹_c=Λ` dual to `O^×/n=Λ` | holds; SGA4-XVII lines 4498–4530, 4690; SGA4-XVIII lines 100–112, 243, 314, 2122 |
| §0.4 general flat trace (sample) | `X=∅`; `ℙ¹⊔ℙ¹`; `k[x,y,z]/(z²)`; `𝔸^d⊔𝔸^{d−1}` | source 0, not iso for `n≥2`; `(a,b)↦a+b`; `×2`; `H^{2d}_c=Λ` | holds; SGA4-XVIII lines 2336–2390, 2528–2534, 2573–2586 |
| §0.6 integral duality, extreme degrees (sample) | indices of the `Ext¹` sequence; Enriques, `ℓ=2`; `ℤ/4`, monodromy `−1` | `j=i−2d` gives `Ext¹(H^{2d−i+1}_c)`; `H³=ℤ/2` feeds `H²`; coinvariants `ℤ/4/(2)=ℤ/2` | holds; Deligne-WeilI-1974 lines 363, 385 (pp. 282–283) |
| §0.7 curve `j_*` duality, relative duality (sample) | costalk of `j_*F` at a puncture; `F₁=F₂`; `𝔸^d_S`, `F=Λ` | `F_I(−1)[−2]`; `H²=Hom(F₁,F₂)^∨(−1)`; `Hom(Λ(−d),Λ)(−d)=Λ` in degree 0 | holds; Deligne-WeilI-1974 line 377; Yu-2023 lines 2278–2280 (ordering, see Source issues) |
| §1.2 Chern classes (sample; R01) | rank one; `T_{ℙ^m}`; `O⊕O(1)`; non-quasi-compact `X` | `ξ+c₁(L)=0`; `(1+h)^{m+1}`; `1+h`; supplier formula stated for qcqs only | true; generality exceeds the supplier |
| §1.3 Chow classes (sample) | axes; `y=0`, `y=x²`; disjoint lines; elliptic curve; line in `ℙ²` | lengths 1, 2, empty sum; `cl([p]−[q])=0`; `Tr(cl(L)²)=1` | holds; SGA4half [Cycle] 2.3.1–2.3.9 (lines 5056–5254, pp. 144–150); Stacks 0AZR, 0B08, 00OE |
| §2.4 perverse `t`-structure, Noetherian `Λ` (sample) | `Λ_C`; `𝔸²⊔𝔸¹`; `Λ_S[1]`; nodal cubic; `i_x^!Λ_{𝔸²}` | in `pD^{≥1}`; costalk degree `−2<−1`; `pH¹=Λ_S[2]`; `0→i_*ε→Λ_X[1]→ν_*Λ[1]→0`; `Λ(−2)[−4]` | holds; BBD-1982 lines 3887–3891 (p. 102), 2215–2226, 2691–2757, 4247–4276 |
| §2.9 Deligne truncation (sample) | `𝔾_m⊂𝔸¹`; skyscraper at 1; `𝔸²∖0`; nodal cubic | `τ_{≤−1}Rj_*Λ[1]=Λ_{𝔸¹}[1]`; natural truncation 0; iso `q≤1`, `H³(U)=Λ(−2)`; `H¹(ℙ¹)=0↪Λ(−1)` | holds; BBD-1982 lines 2635–2650 (p. 68), 2316–2324 |
| §2.11 nonconstructible conditions (sample) | `⊕ i_{x*}Λ`; `j_!Λ[2]` on `𝔸²` | generic stalk 0, closed costalk degree 0; costalk `Λ[1]⊕Λ(−2)[−2]`, degree `−1<0` | holds; BBD-1982 line 2182 (p. 56) |
| §3.8 analytic trace (sample) | `ℙ¹_k`; closed disc | `c₁(O(1))↦1` on both sides; disc is not `(𝔸¹)^an` | statement consistent with its suppliers; Huber locators not read |
| §4.5 blow-up splitting (sample) | `c=1,2,3`; `j^*j_*`; `π_*j_*(ζ^{a−1}p^*z)`; `χ` | empty sum; columns `−ζ^a`; `z·p_*ζ^{a−1}=0` for `a<c`; `χ(X)+(c−1)χ(Z)` | holds; Milne-LEC line 7507 (pp. 193–194); Deligne-WeilI-1974 line 980 (p. 299) |
| §5.6 perverse cohomology, decomposition (sample; R04) | `𝔸¹`, `ℚ̄_ℓ[1]`; `G₀=ℚ̄_ℓ[1]`, `F₀=δ₀(−1)`; blow-up of `𝔸²` | `pH¹=ℚ̄_ℓ(−1)`, weight 2; `Ext²_{X₀}=ℚ̄_ℓ`, splits only geometrically; `ℚ̄_ℓ[2]⊕δ₀(−1)` | holds; BBD-1982 lines 5304–5353 (pp. 141–142); deCataldo-Migliorini-2009 lines 2257–2302 |
| §5.8 universal hyperplane, relative hard Lefschetz (sample) | index shift in (ii); `ℙ¹×Y₀`; trivial bundle | iso for `i+1<d`, injective at `d−1`; `pH^{∓1}=ℚ̄_ℓ[dim Y]`, `ℚ̄_ℓ(−1)[dim Y]`; `η=0` | holds; BBD-1982 lines 5412–5525 (pp. 144–147); deCataldo-Migliorini-2009 line 1547 |
| §7.1 punctured tubular conditions (sample) | `x↦λx`; identity; `x³+yz`, `g=(x,−y,−z)`, `Z={0}` | bad set `{λ⁻¹}`; fails; `N_0X=k[x,y,z]/(yz)`, fixed `x`-line | holds; Varshavsky-LocalTerms-2023 lines 130–137, 356–360, 383–400 |
| §7.3 tame fixed subschemes (sample) | same surface, `Z=Fix(g)`; involution on `𝔸¹`; `t↦t+1` at `∞` | `gr_I A=(k[x]/(x³))[y,z]`, fixed part `k[x]/(x³)`; bad scalar `−1`; local term 2, stalk trace 1 | holds; `I∩A₁=ΣA_μA_{μ⁻¹}⊂I²` |
| §7.5 isolated local terms (R05) | (b) against (d) on the singular surface | (d) and line 7405 give `LT_0=Tr(u_0)` with `X` singular | holds; (b) redundant |
| §0.1 `uniformizerQuotient_selfInjective`, `finiteModule_eval_bijective` | `ℤ/4`, `M=ℤ/2`; `m=0`; pin | dual `ℤ/2` via `1↦2`; excluded by `0<m`; Tau Ceti has `zmod_self` and Frobenius-form criterion only | hold; not at the pin |
| §2.1 `heart_abelian` | pin | Mathlib `TStructure/Heart.lean:23` lists the abelian heart as not done; `AbelianSubcategory.lean:298` is the criterion | genuine target |
| §5.4 `exists_unique_torsion_subobject` | quiver `1→2`; `F=0`; uniqueness | `P₁` has subobjects `0,S₂,P₁`, none works; `W=⊥`; image of `W` in `F/W′` is 0 | holds; Lean `P=S⁺` as README |
| §6.5 Fujiwara–Varshavsky | quantifier order; `U=X` | `d` depends on `c,U` only, then all `F,n,u`; Deligne's conjecture | holds; Varshavsky-LV-2007 lines 749–762 |
| §8.1 `form_similitude_det_alt`, `_symm` | rank 1, `φ=−s`; characteristic 2, `b=1` | `m_−=1`, `det=−s`; `b−m_+−m_−=−1` odd, excluded by `2≠0` | hold |
| §8.2 `poincareReciprocityExport` | `ℙ¹`; genus `g`; swapped rulings; `d=0`; sign of functional equation | `1−qt=(−qt)(1−1/(qt))`; `Δ=q^{1−g}`; `det F₂=−q²`; `Δ²=1`; `(−1)^{χ+m_−}=(−1)^{m_+}` | holds; agrees with Milne-LEC line 6063 |

- Gate at 40031fa: every scanner 0, `build=0`, `OK`. Dependency check: `depcheck: 245 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No change outside the folder.
- `lake env lean` on `Suggested.lean`: seven `sorry` warnings only. One-tactic probe on a scratch copy (`rfl`, `simp`, `infer_instance`, `⟨inferInstance⟩`, `trivial`, `simp_all`, `constructor <;> simp`, `aesop`): closes none of the seven theorems. Elaborated types of the eleven declarations compared with the README: they agree; the Lean of §8.2 does not require `H^i=0` outside `[0,2d]` and uses no such degree.
- Headline theorems: biduality and flat trace (0), Chern classes and Chow descent (1), abelian heart, recollement, simple objects (2), adic comparison (3), refined Lefschetz (4), weight filtration, decomposition, relative hard Lefschetz (5), Fujiwara–Varshavsky (6), isolated local terms (7), graded reciprocity (8). The statable ones are stated; the docstring names the rest by layer and missing carrier. No padding.
- Source locators checked against the text: about 100, in BBD-1982 (34), SGA4-XVIII (14), Varshavsky-LocalTerms-2023 (11, arXiv v3), Milne-LEC (9), Deligne-WeilI-1974 (8), deCataldo-Migliorini-2009 (6), Stacks (5), SGA4half (4), Varshavsky-LV-2007 (4), Zhu-2017 (4), SGA4-XVII (2), Yun-Zhang-2019 (2), Deligne-WeilII-1980, Yu-2023, Liu-Tian-Xiao-Zhang-Zhu-2022 (1 each); none wrong.
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, as the manifest): Tau Ceti `Module.Baer.zmod_self` (`Algebra/Module/ZMod/Injective.lean:50`), `IsAlt.even_finrank` (`LinearAlgebra/BilinearForm/SymplecticBasis.lean`), `trace_pi` (`LinearAlgebra/Trace/Pi.lean:42`), `det_eq_of_compl₁₂_self_eq_smul`, `det_sq_mul_det_toMatrix_self` (`LinearAlgebra/BilinearForm/Isometry.lean:370`), `IsInvolutiveDual`, `Function.Bijective.moduleInjective_self` (`Algebra/Module/Injective/SelfInjective.lean:202`); Mathlib `AbelianSubcategory.abelian`, `RightTExact.mk` (`TExact.lean:68`), `iSup_maxGenEigenspace_eq_top`, `finrank_maxGenEigenspace_eq`, `exists_finite_inj_algHom_of_fg`.
- Cross-roadmap citations: the resolver finds every cited section and every backticked name (main and 474 open heads); read myself: EtaleCohomologyFoundations §§0.9–0.11, F.6–F.8 on main, EtaleDualityAndPerverseSheavesPartII scope and layers, FourierDeligneTransform contracts. LefschetzStructures (open) cites §5.7 here as owner of graded Lefschetz objects.
- Overlap check: read LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations (main and its open revision), DeligneWeightsAndPurity, FourierDeligneTransform, EtaleDualityAndPerverseSheavesPartII, SchemeAndStackFoundations. Field perverse `t`-structure with finite coefficients, abelian heart, open `j_!*`, absolute affine vanishing: EtaleCohomologyFoundations §F.8; Noetherian coefficients and the relative statements: §§2.4–2.7 here. Regular-immersion cycle classes: EtaleCohomologyFoundations §0.9; classes of singular cycles: §1.1 here. Curve Euler–Poincaré in characteristic `p`: FourierDeligneTransform §2.7. Absolute purity: LefschetzPencilsAndVanishingCycles §0.10. General bases and perversities: Part II §§5.1, 6.5. Lisse weight filtration: DeligneWeightsAndPurity; perverse: §5.4 here. Ownership against open pull requests outside these lists was checked only through the search for the eleven Lean names and for "abelian heart".
- Source independence: 10 passages compared with 8 sources (SGA4-XVII, SGA4-XVIII, BBD-1982, Milne-LEC, Varshavsky-LV-2007, Varshavsky-LocalTerms-2023, Yu-2023, Liu-Tian-Xiao-Zhang-Zhu-2022), none shared (longest common run six words, at Varshavsky-LocalTerms-2023 line 412, a theorem statement); largest share BBD-1982, 78 of about 230 bracketed citations of non-roadmap sources; contents compared with BBD-1982: independent (Layer 2 draws on its chapters 1, 4, 2 out of order and adds §§2.11–2.12; Layer 5 splits its §5.3 over §§5.3–5.5 and its §5.4 over §§5.6 and 5.8 with §5.7 inserted; the order §5.2 → §5.3 → §5.4 → §5.5 → §5.6 → §5.8 is forced by their `*Needs:*` lines).

## Not verifiable

- Read in full this round: Scope, Conventions, supplier contracts, Layer 0, Layer 1, §§2.4, 2.9, 2.11, 3.8, 4.5, 5.6–5.8, Layer 7, Layer 8, and the statements of §§5.4 and 6.5. The other sections were scanned for the defects of R01–R05 and for citations, not recomputed.
- Huber-1996 (§3.8: Theorems 3.7.2, 3.8.1, 5.7.2, 5.7.5, 7.3.4, 7.5.3, Lemma 7.5.4), Fulton-1998, Serre-AlgLoc, Jantzen-2003: no legal copy read; cited by locator only.
- Varshavsky-LocalTerms-2023: the statement numbers were checked in arXiv v3; the journal page numbers the README cites (pp. 987–1004) were not, the service returned the preprint for the DOI.
- Liu-Tian-Xiao-Zhang-Zhu-2022 Lemma 5.11.3(2)–(5): read in arXiv v3 (lines 4731–4773); the published pages 251–252 were not.
- SGA4-XVIII Proposition 3.1.8, p. 571: the statement (line 2960) lies between the margin marks 570 and 572; the mark 571 is missing from the extraction.
- Hansen-Kaletha-Weinstein-2022, Lu-Zheng-2022, Katz-ACT-1993, Verdier-1983, Juteau-2009, Angeniol-1976, Bhatt-Scholze-proetale-2015, Raynaud-1965: not opened this round.

## Source issues

- **Error** in Varshavsky-LocalTerms-2023 at Lemma 5.1 (arXiv v3, p. 10): the source says that for a diagonalizable group acting and any invariant closed subscheme the fixed-point normal cone maps isomorphically onto the fixed points of the normal cone; it should be restricted, for instance to the full fixed subscheme: for `μ₂` on `x³+yz=0` and the reduced origin the source is `Spec k[x]/(x³)` and the target a line; affects a stated result.
- **Misprint** in Yu-2023 at equations (6.1.1)–(6.1.2), p. 42 (arXiv v5): the source says the global sections of `F₁⊗F₂^∨` are the homomorphisms from `F₁` to `F₂`, and dually for `H²_c`; it should be from `F₂` to `F₁`, and the dual of those from `F₁` to `F₂`; affects nothing.
- **Misprint** in Zhu-2017 at Appendix A.3.1, p. 55 (arXiv v3): the source says the intersection complex restricts on a smooth open to the constant sheaf shifted by twice the dimension and twisted by the dimension; it should be shifted by the dimension, as in its §2.1.1; affects nothing.

## For the human reviewers

- Scope: FourierDeligneTransform (open, its README line 76) declares `gap:perverse-exactness-affine-smooth` asking EtaleCohomologyFoundations §F.8 for smooth and affine perverse `t`-exactness; §2.7 of this README states those theorems; §F.8 does not, on main or in its open revision.
- Scope: `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4091` on main names this roadmap as owner of étale supports, `f^!`, absolute purity and Brauer-group purity; this README (line 13) assigns them to EtaleCohomologyFoundations, LefschetzPencilsAndVanishingCycles §0.10 and PurityForFlatCohomology Layer 8.
- Scope: §§7.3–7.5 rest on the README's own correction of a published lemma (Varshavsky-LocalTerms-2023 Lemma 5.1, see Source issues); the corrected route uses the full fixed subscheme and Theorem 4.10(b).
- Licence: ECD-2026 is an author manuscript dated 14 April 2026 on the author's page, cited by manuscript pagination (`README.md` line 7662).
- Licence: SGA4-XIV, SGA4-XVII and SGA4-XVIII are cited from a retyped edition on a personal page (`README.md` lines 7692–7696); this review read them as an author page.
- Licence: Milne-AG-2017 is cited from the author's copy of a Cambridge University Press book (`README.md` line 7684).
