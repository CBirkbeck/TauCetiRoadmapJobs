# Review of AnabelianGeometryAndNonabelianChabauty (pull request #3027 at 8d0b573)

**Verdict:** accepted

**Summary.** Accepted: no finding. The new §2.0a states Radford's theorem correctly for every field of characteristic zero and every linearly ordered alphabet. Its reduction to Hoffman's Theorem 2.2 and both of its Checks were recomputed and hold, and the sampled sections of Layers 0, 2, 3, 6 and 7 hold on the instances computed below. There are three small corrections: three locators point to the wrong subsection, tag or page; the hypothesis line of §0.31 cannot be parsed; and the scope and Layer 2 dependency paragraphs do not record §2.0a. There are no format notes. One fact about where §2.0a sits is left to the human reviewers.

## C01 — Three locators in the sampled sections point to the wrong subsection, tag or page

A reader who follows these locators lands next to the cited material, not on it.

- **§6.3, "Twisted height module" (line 7983).** The README cites the Balakrishnan–Dogra II manuscript, §3.1, pp. 12–14, for the twisting construction of `A_Z(b,x)`. In that manuscript §3.1 is "Mixed extensions" (pp. 10–12). The twisting construction is §3.2, "Twisting and mixed extensions", pp. 12–13 (bdii line 551).
- **§7.3 (line 8654).** The README writes "Lemma 59.97.9 (Tag 0F13)". Tag 0F13 is Section 59.97 of the Stacks project; Lemma 59.97.9 is Tag 0F1P (stacks lines 237490 and 237893). Line 4139 already gives it correctly as "Section 59.97, Tag 0F13".
- **§0.31 (line 2730).** The README cites Kim 2005, "twisting and nonabelian exactness, printed pp. 4–6". Those pages contain the cocycle definitions and the start of twisting (kim2005 line 285, p. 6). The exact sequence of pointed sets for a subgroup is on p. 9 (kim2005 lines 403–412).

The fixes are "§3.2, pp. 12–13", "Lemma 59.97.9 (Tag 0F1P)" and "printed pp. 4–6 and 9".

## C02 — The hypothesis line of §0.31 cannot be parsed

Line 2722 reads "Parent action, orbit-fibre equivalence and kernel homeomorphisms embedded i retains its given topology f surjective." A reader cannot tell which standing hypotheses apply. Every other target of Layer 0 names its set. One possible rewording: "Standing hypotheses (H22) for the named kernel and (H25) for an embedded kernel i, which keeps its given topology; f is surjective."

## C03 — The scope and Layer 2 dependency paragraphs do not record §2.0a

BaseChangeAndGaloisRepresentationsForUnitaryGroups names this roadmap as the owner of Radford's theorem: its §13.0a is a corollary of §2.0a (lines 728 and 1362 at this head). Here, however:

- "Scope and ownership" (line 8960) lists what this roadmap owns but omits the shuffle algebra, Lyndon words and Radford's theorem.
- The `### Dependencies` paragraph of Layer 2 (line 5387) omits Mathlib's `FreeMonoid`, `MvPolynomial` and `Algebra.TensorProduct`, which §2.0a's *Needs:* line names.

Adding one clause to each paragraph would record them.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §2.0a Radford's theorem, `𝔄={a}` | characteristic 0 and characteristic p | `a^⧢n=n!·aⁿ`; char 0: `Sh={k[a]}`; char p: `a^⧢p=p!·a^p=0`, a nonzero nilpotent, so the algebra is not a domain | Holds; the characteristic hypothesis is needed |
| §2.0a, `𝔄={a<b}` count | Lyndon words of length ≤3; monomials of weight 2 and 3 | Lyndon words a, b, ab, aab, abb (`(2³−2)/3=2` of length 3); 4 monomials of weight 2 for 4 words, 8 of weight 3 for 8 words; `ba=a⧢b−ab` | Holds |
| §2.0a order and Lyndon condition | aa, ba, aab against their proper right factors | `a<aa` (not Lyndon); `a<ba` (not Lyndon); `aab<ab` and `aab<b` (Lyndon) | Agrees with hoffman lines 114–117 and with Mathlib's list order |
| §2.0a reduction to Hoffman | k⊂ℂ and `A_n` finite (hoffman lines 82–84); uncountable alphabet; k=ℚ_p(t) | Finite 𝔅 in degree 1 is locally finite; relations and generation involve finitely many letters; ℚ⊆k, `Sh_k=k⊗Sh_ℚ` | Holds |
| §0.1 cocycles and H¹ | C₂ acting trivially on S₃; profinite `∏C₂` acting on C₂ | `#Z¹=4`, `#H¹=2`, the wrong relation gives 4 classes; continuous `Z¹` is countable versus `2^𝔠` abstract homomorphisms | Holds; kim2005 p. 6 (lines 240–243) matches |
| §0.12 neutral fibre after twisting | c trivial; C₂ trivial on S₃, sign map f, c a transposition | `T_c=id`, criterion reduces to `f_*a=1`; `f_*T_c(1)=[f∘c]` and `(f_c)_*1=1` | Holds |
| §0.14 functoriality | C₃ acting trivially, inclusion `C₃→S₃` | 3 classes map to 2: id and inverse are conjugate by a transposition | Holds; kim2009 p. 127 restriction paragraph (line 1431) |
| §0.22 kernel of an inclusion | `b=u⁻¹` | `u(g•u)⁻¹=b⁻¹(g•b)`; `g•(bA)=b·i(c(g))A=bA`, so left cosets | Holds; kim2005 p. 9 (lines 403–409), kim2009 pp. 118–119 (lines 1126–1152) |
| §0.24 named kernel | S=ker f with witness hS | e is the identity on values; inverse and product by subtype equality | Holds; kim2005 pp. 5–9 |
| §0.29 kernel gauge | f(u) fixed, and f(u) not fixed | `f(u c(g)(g•u)⁻¹)=f(u)(g•f(u))⁻¹`: equals 1 if fixed, ≠1 otherwise | Fixedness is needed; holds |
| §0.31 orbit transport | neutral kernel class; locator | the neutral orbit maps to [c], which may be nontrivial; exactness is on kim2005 p. 9, not pp. 4–6 | Statement holds; C01, C02 |
| §0.35 inflation–restriction | discrete S₃ with ConjAct, x=(01)(12) | `x⁻¹·c=1`; `(x·c)((01))=x²·(x⁻¹)⁻²=x⁴=x≠1`; the common kernel of all coordinate characters of `∏C₂` is not open | Holds; Mathlib `exist_openNormalSubgroup_sub_clopen_nhds_of_one` needs compactness, present in (H16) |
| §2.1 neutral reconstruction | μ₂/ℚ with the cocycle σ↦σ(√2)/√2; GL₂ with a, b | torsor `Spec ℚ(√2)` with no rational point; `ab=[[2,1],[1,1]]≠ba=[[1,1],[1,2]]` | Holds; deligne-milne Thm 2.11 p. 21, Prop 2.21 p. 26, Thm 3.2 p. 31, Rem 3.3 p. 32 |
| §2.2 unipotent length and paths | 𝔾_a standard representation V; de Rham category of 𝔾_m | `V⊗V⊇Sym²V` has length 2=1+1; `U_dR(𝔾_m)=𝔾_a` | Holds; bdmtv Def A.1 p. 934, cls Props 2.3.2 and 2.3.5 pp. 93–94 |
| §2.5 Frobenius and transport | `d−N dt` with `N²=0`; 𝔾_m over 𝔽_q; φ=a·id; `φ(z)=az+c` | transport `1+(y−x)N`; Frobenius eigenvalues q on H¹, q⁻¹ on the dual; Lang map `(a−1)`; fixed point `c/(1−a)`, which is −c at a=2 | Holds; besser Thm 3.1 p. 8, bdmtv (37)–(42) pp. 919–921 |
| §3.3 finite-field reconstruction | t97 pages (offset 134); P¹ marked 0, 1, ∞ | Prop 2.8 p. 151, Cor 2.10 p. 154, Prop 3.3 p. 156, Lemma 4.1 p. 163, Lemma 4.7 p. 167; the affine map ax+b is recovered | Locators hold; bound on ♯S₁ listed under Not verifiable |
| §6.3 height module | `A=T=ℚ`, `q=0`; `i:ℚ→ℚ²`; total dimension | `ℚ/ℚ=0`; `ℚ²/(0×ℚ)≠0`; `1+2g+1=2g+2` | Holds; bdmtv §3.4 p. 906 (line 874); bdii twisting in §3.2 (C01) |
| §6.6 local terms and correction set | `h=h_p+Σh_v`, sets {2} and {1},{2} | `θ−h=−Σ_{v≠p}h_v`; {−2}; {−3}; bdmtv (19) prints `+Σ` (lines 909–915) | README sign correct; source error recorded |
| §7.3 open curves and characters | P¹∖{0,1,∞}; D={±√2}; X² with g; quadratic `Res P¹`; free Lie algebra on m=2; surface group g=2; c=−1 | dim 2; boundary ε; `1+4g²+1`; dim `H⁰` 1 versus dim Ind 2; Lie dims 2,1,2; 4 and 5; odd trace = −dim | Holds; stacks Tag 03RR (line 233102); C01 |
| Headline: Isom theorem (`anabelian_isom`) | X=Y=P¹ (genus 0); X=Y of genus 2 with e=id | genus 0: every f∈PGL₂(K) works, so `∃!` fails; genus 2: only f=id, since Aut acts faithfully on outer π₁ | Genus ≥2 needed and present; `f.inv:Y⟶X` matches `e.functor` |
| Headline: Kim's finiteness criterion | statability at the pins | needs represented Selmer varieties and a period morphism; neither is at the pins | Docstring names it |
| Headline: thrice-punctured line, Soulé | statability; S-unit owner | no `G_{ℚ,S}` with ℚ_p(k) coefficients at the pins; S-unit finiteness is DiophantineApproximationAndTranscendence §4.5 (main line 2815) | Docstring names both |
| Headline: quadratic Chabauty rank criterion; section-map injectivity | statability | need Chabauty–Kim loci and Nekovář heights, and Galois section classes; neither is at the pins | Docstring names both |

- Source locators checked against the text: 66, across hoffman-quasi-shuffle, kim2005, kim2009, poonen-rational-points, deligne-milne, besser, bdmtv, cls, t97, bd1, bdii, kt and stacks.
- Library declarations opened at the pins: Mathlib `IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one` (`Topology/Algebra/ClopenNhdofOne.lean:31`, which needs `CompactSpace`) and `isClopen_iInter_of_finite` (`Topology/Clopen.lean:81`). Searches of the pinned Mathlib and Tau Ceti for Lyndon words and shuffle algebras found only unrelated hits (Lyndon's exact sequence, simplicial shuffles), so §2.0a duplicates nothing at the pins.
- Cross-roadmap citations resolved: 9. These are BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.0a and its scope paragraph (main and head), ColemanIntegration L1.12, FiniteFlatGroupsAndIntegralPadicHodgeTheory (`GaloisRep.deRhamSupplierEquiv`, line 1156), HeightsRationalPointsAndObstructions (`SmoothGroup.formalIdentityChart`, line 875), EtaleCohomologyFoundations §F.2.6 (`VanishingCycles.etaleKunneth`), AlgebraicVectorBundles (its labels L0A–L0C map to Layers 1–3), DiophantineApproximationAndTranscendence §4.5, SelmerLengthBoundsAndLocalLifting's citation of §4.6, which exists at line 6698, and GaloisSectionsPadicPeriodMaps' citations of §7.1.
- Automatic checks: all passed on this head. My own gate run reported zero on every counter except outside-folder, which listed only the other roadmap folders this pull request changes. `git diff --name-only` shows no file outside `TauCetiRoadmap/`. Dependency check: `depcheck: 132 roadmaps, 1490 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gave `sorry` (61:8) as its only warning. A probe file with `#check @name` for all three declarations returned the same elaborated types as before; every binder of `anabelian_isom` is present, including `hfg` and both genus bounds. Nothing changed.
- Record: the merge base has the same 8 layers and only 29 insertions follow, with no deletion, so no layer or item is removed or renumbered. `Suggested.lean` is unchanged. The pull request text says 50 general roadmaps receive published sections that mention neither the family nor the formal proof, and that this `Suggested.lean` is unchanged; §2.0a agrees with both.
- Previous review (accepted, at c71ec32): it left no open finding. Its two verified repairs still stand: `finiteEtale` and its base-change instance are present (lines 47 and 53).
- Padding probe: `anabelian_isom` is the Isom theorem and cannot close in one tactic. `finiteEtale` and the instance are needed for its statement to elaborate. Radford's theorem is not one of this roadmap's headlines, so its absence from `Suggested.lean` is correct.

Overlap check: I read FunctionFieldArithmeticPartII, NeronModelsAndSemistableAbelianVarieties, GaloisSectionsPadicPeriodMaps, MordellLawrenceVenkateshPartII and CrystallineCohomology (open, closest by vocabulary), and PadicDifferentialEquationsAndRigidCohomology, EffectiveDiophantineMethods and InverseGaloisAndArithmeticFundamentalGroups (on main, closest by vocabulary); the list by results is empty. For the objects of §2.0a I also read CombinatoricsOfWords and BaseChangeAndGaloisRepresentationsForUnitaryGroups. Three objects are shared:

- Lyndon words: also defined in the open CombinatoricsOfWords, Layer 2.1 (README lines 19–23), with the same order. This roadmap is on main and is therefore the owner; CombinatoricsOfWords is the one to cite it.
- Radford's theorem: owned here and cited as a corollary by BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.0a.
- Section classes: owned here (§7.1) and cited by GaloisSectionsPadicPeriodMaps.

Nothing else is shared. CrystallineCohomology's shuffle products are on cochains, a different object.

Source independence: 14 passages compared with 8 sources (hoffman-quasi-shuffle, kim2005, kim2009, deligne-milne, bdmtv, besser, t97, stacks). Nothing beyond forced wording is shared: the order and Lyndon condition of §2.0a share at most six consecutive words with hoffman-quasi-shuffle lines 114–117, and these are a formula-level definition. The largest share of locators is kim2005, with 136 of 522 linked locators. Its contents (§1 torsor spaces, §2 the p-adic KZ equation, §3 the nonabelian method of Chabauty) were compared with Layers 0–7: independent. 111 of its locators fall in Layer 0, and no layer maps onto its §2 or §3.

Research link: Layers 2 and 4–6 develop the unipotent path torsors, Selmer varieties and quadratic Chabauty equations of Kim (2005, 2009), Balakrishnan–Dogra (2018) and Balakrishnan–Dogra–Müller–Tuitman–Vonk (2019). Layer 3 is the Isom theorems of Tamagawa (1997) and Mochizuki (1996, 1999). §2.0a is Radford's 1979 theorem as stated by Hoffman (2000). This line rests on the README and the sources read.

## Not verifiable

- Radford, J. Algebra 58 (1979): the sources service classed the DOI as paywalled. §2.0a credits Radford without a locator, so only Hoffman's statement of the theorem (Theorem 2.2) was compared.
- Tamagawa 1997, Lemma 4.7(c), p. 168 (t97 line 5907): elsewhere in the extracted text the same inequality glyph stands for both > and ≥, so §3.3's "at least three points" could not be checked against the printed sign. Lemma 4.13 (line 6322) needs more than two points, which is consistent with three.
- Labute 1967, Théorème 2 (cited in §7.3): the cached text is the GDZ catalogue page only.
- The unverifiable items of earlier rounds still stand for passages outside this sample: Huber–Wildeshaus, Hadian's thesis, Serre Chapter V, Stix 2013 and Olsson.

## Source issues

- **Misprint** in bdmtv at Definition A.1, p. 934: the source says a category is unipotent when every object receives a nonzero morphism from the unit; it should be every nonzero object, since the zero object receives none; affects nothing.
- **Error** in bdmtv at equation (19), p. 907: the source defines Υ as the set of sums of the away-from-p local heights; it should be the set of their negatives, since θ − h is minus that sum (Lemma 3.7); affects a stated result.

## For the human reviewers

- §2.0a (the definition of Lyndon words and Radford's theorem) is used by no other section of this roadmap. It is the general statement that BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.0a cites. The open CombinatoricsOfWords (Layer 2.1) also defines Lyndon words.
