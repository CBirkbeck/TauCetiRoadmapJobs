# Review of PrismaticCohomology (pull request #1057 at ddcc1c2)

**Verdict:** needs changes

No P1 or P2 finding survived verification. The verdict is "needs changes" only because the push gate fails on the README's anchor tags (R01): the brief admits no acceptance while the gate fails. Everything else below is P3 and the author's to take or leave.

## R01 (P3) — Gate failure: 329 `<a id=…></a>` anchor lines in the README

Location: `TauCetiRoadmap/PrismaticCohomology/README.md` lines 19–20, 30–31, 44–45, … through the References (every section and every reference entry carries one or two `<a id="…"></a>` lines).

Claim: the gate's residue rule forbids `<a id=` anchor tags; the worker's gate reports `residue=329 … FAIL`, and `grep -c '<a id='` on the README returns exactly 329, so every residue hit is an anchor.

Witness: gate output line `gate PrismaticCohomology: … residue=329 … build=0 FAIL`; README line 19 `<a id="s0-59"></a>`.

Repair: delete every `<a id="…"></a>` line, and replace the intra-document links that target them (`[§0.6](#s0-6)` → `§0.6`, `[K1](#ref-k1)` → `K1`, `[§1.10](#s1-10)` in the supplier table → `§1.10`). Nothing mathematical changes. Tested: with the anchors removed and links flattened, every other gate counter is already 0 at this head (set_option, blob, latex, prnum, sorry-data, readme-ids-missing, depcheck, build all 0).

## R02 (P3) — Five supplier declaration names attributed to CrystallineCohomology do not exist

Location: README line 183 ("CrystallineCohomology §§CR.DDR.4.5, CR.DDR.5.18, CR.DDR.5.20–CR.DDR.5.22 supply `DerivedDeRham.derivedDeRhamWitt`, `qrspWittControl`, `qrspPdDerham`, `acrysStructure` and `regularFpCrystallineCech`") and line 3069 (§2.19, same five names).

Claim: the five backticked names are presented as declarations of the supplier.

Witness: none of the five strings occurs in CrystallineCohomology's README or `Suggested.lean` at the head of its open pull request, and `roadmaps grep` finds each of them only in this README (lines 183 and 3069). The cited sections do exist at that head (CR.DDR.4.5 "Derived de Rham–Witt with Nygaard filtration", CR.DDR.5.18, 5.20, 5.21, 5.22) and state the objects in prose, so the mathematics is owned; only the names are invented. There is no §CR.DDR.5.19 at that head, so the range "CR.DDR.5.18–CR.DDR.5.22" in the supplier table (line 170) should read "CR.DDR.5.18, CR.DDR.5.20–CR.DDR.5.22" as line 183 already does.

Repair: drop the five names at lines 183 and 3069 and cite the sections by content ("the derived de Rham–Witt functor of CR.DDR.4.5, the quasiregular semiperfect Witt control of CR.DDR.5.18, the PD identification of CR.DDR.5.20, the structure theorem of CR.DDR.5.21 and the regular crystalline Čech computation of CR.DDR.5.22"). All other supplier names were resolved: `DerivedDeRham.formalEtaleRealization`, `formalEtaleAffine`, `formalEtaleCoverDescent`, `formalEtalePullback`, `formalEtaleFiltered` (DerivedDeRhamCohomology §5.26), `AInf.Trace.tateFinite`, `AInf.Trace.tateDiagonal` (AInfCohomology §AI.7.2), the seven PerfectoidQuotients §0.0 names, `perfect_proper_pushforward`, `frobenius_zero_on_positive_homotopy`, `perfection_isDiscrete`, `moduleSpectra_equiv_derived`, `eilenbergMacLane` (EnhancedDerivedSheaves), `qcoh_fpqc_descent` (SchemeAndStackFoundations §1.1), the three `VanishingCycles.*` names (EtaleCohomologyFoundations).

## R03 (P3) — Two cited works are missing from References

Location: README line 2660 (§2.0, "Rydh, Submersions and effective descent of étale morphisms, Theorems 2.8, 3.12 and Remark 3.13", linked to arXiv 0710.2488) and line 3192 (§2.26, "Bhatt–Scholze, Projectivity of the Witt vector affine Grassmannian, Lemma 11.22").

Witness: neither "Rydh" nor "Grassmannian" occurs in the `## References` section (lines 3341–3417); every other cited work has an entry there.

Repair: add the two entries (Rydh, Ann. Sci. ÉNS 2010 / arXiv 0710.2488; Bhatt–Scholze, Invent. Math. 2017 / arXiv 1507.06490), with the locators used.

## R04 (P3) — `Delta.addCorrection` is declared in the Lean file but named nowhere in the README

Location: `TauCetiRoadmap/PrismaticCohomology/Suggested.lean` line 36 (`def addCorrection`); README §0.1 (line 315) and Conventions (line 126).

Witness: the README names `Delta.Structure`, `Delta.IsDeltaMap` and `Delta.associatedFrobenius` at line 126 but `grep -c addCorrection README.md` returns 0; the README's own rule is that every Lean name appears in the README.

Repair: one clause at §0.1 or in Conventions: "`Delta.addCorrection` is `C_p(x,y)` with the binomial coefficients divided in ℕ before the cast".

## R05 (P3) — Checks and prose targets carry backticked Lean-style identifiers that are declared nowhere

Location: throughout, e.g. README line 329 (`correction_dyadic`), line 2539 ("prove `SyntomicPrismatic.p_torsion_free`"), line 2545 (`CompleteFlat.p_torsion_free`), lines 2560–2565 (`SyntomicPrismatic.crystalline`, `CompleteFlat.shift_two_terms`, …), lines 3001–3005 (`DerivedPrismatic.derivedInput_survives_completion`, …).

Claim: the house style has Checks in prose that never name a Lean counterpart, and a backticked name of the roadmap's own is a claim that `Suggested.lean` declares it.

Witness: none of these namespaces (`SyntomicPrismatic`, `CompleteFlat`, `DerivedPrismatic`, `Prismatic`, `Arc`, `FormalArc`) exists in `Suggested.lean`; the gate's readme-ids check passes only because it inspects names whose namespace prefix exists in the Lean file. The README resolves 161 such names (the worker's citations list) that are declared nowhere.

Repair: either keep the labels as plain-text tags without backticks (the mathematics of each Check is already stated in prose), or reserve backticks for library and supplier declarations. The §1.24 sentence "prove `SyntomicPrismatic.p_torsion_free`" should read "prove that `H⁰((S/A)_Δ, O_Δ)` is p-torsion-free".

## R06 (P3) — §2.13's initiality "among all prisms over A" for a non-orientable base rests on a gluing sentence that a cited source flags as nontrivial

Location: README line 2932 (§2.13: "Δ discrete I-regular and initial among all prisms over A receiving R … These identifications glue, without choosing a global orientation"), with §2.12 line 2921 ("The prism category here includes unbounded prisms").

Claim: for a bounded prism `(A,I)` with `I` not principal, initiality is asserted against all (also unbounded) prisms, by local reduction to the orientable case.

Witness: K1 (cited at §0.93) footnote 8, p.13, records that the descent argument of BS22 Proposition 3.13 is nontrivial for maps into unbounded prisms when `(A,I)` is not orientable; BS22 Example 7.9 (p.59) reduces "locally on Spf(A)" with no further comment. The statement itself is supported elsewhere: KY Lemma 4.18 (p.40) states it in the "unbounded prismatic site" for any bounded prism, and BL22 Lemma 4.3.10 (p.87) with Definition 4.1.1 (p.78, the relative site there admits every prism `(B,IB)`) does too; §2.13a already cites these.

Repair: at §2.13 cite BL22 Remark 4.3.9 and Lemma 4.3.10 (or Corollary 4.3.14, p.89) for the unbounded-target initiality in place of the gluing sentence, or restrict §2.13's unbounded-target clause to orientable `(A,I)`, where §0.93 gives it directly, and keep bounded targets otherwise.

## Verified sound

**Principles.** No route-specific shortcut, no re-planned roadmap, no computational algorithm, no copied passage (every statement is restated), no sorry'd data, no `set_option`, no `lemma`, no `#eval`/`#print`; a single `import Mathlib`, no Tau Ceti import; the pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PrismaticCohomology'` is empty). Supply direction: `depcheck: 205 roadmaps, 1413 edges, 0 problem(s)`; no UPWARD or CYCLE line; PrismaticCohomology is at position 54 of the merge order, after all its suppliers (PerfectoidQuotients 20, DerivedDeRhamCohomology 18, CrystallineCohomology 19, AInfCohomology 53; PerfectoidSpaces, DerivedModuleAlgebra, EnhancedDerivedSheaves, SchemeAndStackFoundations, EtaleCohomologyFoundations, AlgebraicVectorBundles are on main). Declared gaps: none.

**Ownership against open work.** ArcTopologyAndDescent (open head, position 92) lists "PrismaticCohomology §2.0" in its own supplier table for the v- and arc-cover predicates, the p-adic formal arc site and its perfectoid basis, so §2.0 has one owner here and a downstream consumer there. `roadmaps grep` for "free δ-ring / cofree / Joyal" finds no other owner on main or in any open pull request; no other `Suggested.lean` declares `Delta.Structure`, `IsDeltaMap`, `IsOrientedPrism`, `addCorrection` or `witt_cofree`, and the namespace `TauCetiRoadmap.PrismaticCohomology` occurs only in this file. PerfectoidSpaces §P4.15.2 (main) owns the p-local δ-ring/prism objects (δ-rings, free δ-algebras, distinguished elements, rigidity, regular envelopes, perfection, perfect prisms ↔ perfectoid rings, the initial prism of a semiperfectoid quotient); the README imports exactly these (§§0.61, 0.72, 0.79, 0.83–0.86, 1.25, 2.11, 2.15) and keeps the integral variants and the general envelope with the differences stated (§§0.3, 0.55, 0.93). Open pull requests without files given in the brief were not checked.

**Build and Lean form.** `lake env lean` on `Suggested.lean` at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf): four `declaration uses sorry` warnings (lines 58, 70, 80, 129), nothing else. `#check @name` for all 13 declarations on a scratch copy: elaborated types agree with the README statements (free δ-ring on an arbitrary type `V` with faithfully flat Frobenius and universal δ-map, §0.55; cofree Witt δ-ring over every commutative `R` with Frobenius `WittVector.frobenius`, §0.56; Witt reconstruction of a classically p-complete perfect δ-ring, §0.65; general envelope over an oriented prism for arbitrary `J ∋ a d`, §0.93). No section binder is lost (`[Fact p.Prime]`, `IsAdicComplete`, `IsOrientedPrism` and `IsDeltaMap` hypotheses all appear in the elaborated types). `PerfectRing R p` at the pin is `class PerfectRing (R) (p) [Pow R ℕ]` (`Mathlib/FieldTheory/Perfect.lean:44`, bijectivity of `x ↦ x^p`, no `CharP` argument), so `PerfectRing (R ⧸ Ideal.span {↑p}) p` is the intended statement; `CharP (R ⧸ Ideal.span {(p:R)}) p` exists at `Mathlib/Algebra/CharP/Quotient.lean:31` for later use. `WittVector.frobenius : {p} → {R} → [Fact p.Prime] → [CommRing R] → 𝕎 R →+* 𝕎 R` and `RingHom.FaithfullyFlat` checked at the pin.

**Headlines and padding.** The README's headlines statable at the pins are the four theorems in the file; the module docstring names the cohomological headlines (§§1.14–1.23, 2.3–2.13a, 2.22–2.31) and the missing carriers (relative prismatic site and cohomology, bounded p-adic formal schemes, animated prismatic algebras, cotangent complexes, perfect prismatic and arc sites, almost-module interface). One-tactic probe on a scratch copy: `first | simp | rfl | infer_instance` (and `constructor; exact?` for the `Nonempty`) fails on all four theorems. The five definitions and one structure are each needed by a stated theorem; no API lemmas, no examples, no boundary theorems. Nothing is padding.

**Library-state claims checked at the pin.** §1.8's claim that the Grothendieck-abelian instance for presheaves of modules is stated over a small category only: `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/PresheafOfModules.lean:25` is `instance {C} [SmallCategory C] (R : Cᵒᵖ ⥤ RingCat) : IsGrothendieckAbelian (PresheafOfModules R)`, and `GrothendieckAxioms/FunctorCategory.lean` provides only AB-axiom instances for `J ⥤ A`, no `IsGrothendieckAbelian` for functor categories; the claim is accurate.

**Sources: the seeded sample (text read at the locator; all support the statement as written).**

| Target | Source and locator | Found |
| --- | --- | --- |
| 0.8–0.15 | BS22 Def 2.1 p.13; Remarks 2.2–2.5 pp.13–14; Example 2.6 p.14; Lemma 2.9 p.15 | all at the stated pages (BS22 lines 501–560, 587–590) |
| 0.55 | BS22 Lemma 2.11 pp.15–16, Cor 2.12 p.16 | lines 594–626; the source is one-generator over ℤ_(p); the integral extension's proof route (rank-p^n triangular bases, fibrewise flatness) is correct, see table |
| 0.56 | BS22 Remark 2.7 p.14, Remark 2.13 p.16; Hes10 Lemmas 1.1 (p.6), 1.18 (p.16) | lines 561–574, 627–634; Hes10 located |
| 0.57 | BS22 Remark 2.16 p.17 (and Lemma 2.15 p.16) | lines 639–662 |
| 0.73 | BS22 Def 3.2 pp.28–29, Def 1.4 p.3 | lines 1117–1135, 93 |
| 0.76 | BS22 Example 2.20(4) p.18; Example 3.3 p.29 | lines 721–725, 1136 |
| 1.5 | BS22 Construction 4.9 p.39; ALB23 Def 3.1.5 p.16 | lines 1564–1591; ALB23 line 669 |
| 1.8 | BS22 Construction 4.18 and footnote 10, p.42; Theorem 5.2 p.45 | lines 1706–1722, 1799 |
| 1.27 | BS22 Cor 3.12 p.33, Def 4.1 p.36 | lines 1328–1348, 1441–1453 |
| 2.1 | BS22 Construction 7.6 p.56; ALB23 Def 3.1.9 p.18 | lines 2197–2228; ALB23 line 723 |
| 2.5 | ALB23 Prop 3.2.1 p.18, Prop 3.1.11 p.18; BS22 Prop 4.15 p.41 | ALB23 lines 739–761; BS22 lines 1633–1657 |
| 2.13 | BS22 Example 7.9 p.59, Lemma 7.7 pp.57–58, Prop 3.13 pp.33–34 | lines 2232–2317, 1349–1381 |
| 2.13a | KY Prop 4.17 p.39, Lemma 4.18 p.40; BL22 Cor 4.1.17 p.81, Remark 4.1.20 p.82, Remark 4.3.9 and Lemma 4.3.10 p.87 | all located; KY Lemma 4.18 states exactly the unbounded-site initiality |
| 2.16 | BS22 Prop 7.11 p.60; ALB23 Prop 3.3.8 p.22 | lines 2344–2363; ALB23 line 893 |
| 2.21 | BS22 proof of Prop 7.10 pp.59–60; ALB23 Remark 3.4.3 p.25 | lines 2318–2342; ALB23 line 1023 |
| 2.25 | BS22 Prop 8.13 p.69 and proof p.70 | lines 2699–2709 |
| 2.27 | BS22 Cor 8.14 p.70 | lines 2710–2721 |
| 0.93 (headline) | K1 Prop 3.1 p.13; Lecture V Lemma 5.1 p.6 and the bounded convention p.1 | K1 lines 560–564; Lecture V lines 265–274, 16–17 |
| 0.65 (headline) | BS22 Def 2.26, Remark 2.27, Cor 2.31 p.20 | located |

Further locators opened while checking findings: BS22 Lemma 2.17 p.17, Remark 2.37 p.24, Lemma 2.38 p.24, Cor 2.39, Remark 2.40, Warning 2.41 p.25, Def 2.42 p.26, Lemma 3.5–3.6 p.29, Lemma 3.7 p.30, Remark 4.5 p.37, Lemma 4.10 p.39, Remark 4.14 p.40, Lemmas 4.20–4.21 p.43, Cor 5.5 p.49, Construction 6.1 p.51, Prop 6.2 pp.51–52, Thm 6.3 p.52, Thm 6.4 p.53, Prop 7.2 p.55, Lemma 8.6 p.66, Def 8.7–Prop 8.10 p.67, Thm 1.8 pp.4–5; ALB23 Remark 3.1.2 p.16, Remark 3.1.8 p.17, Prop 3.2.2 and Cor 3.2.3 p.20, Prop 3.4.1 p.24, Lemma 5.1.6 p.76, Lemma 2.1.7 p.13, Lemma 4.9.4 p.72, Example A.4 p.95, Prop A.3 p.94; BMS2 Lemmas 4.4–4.7, Def 4.20, Lemmas 4.28–4.34, Prop 8.12–Thm 8.14, Remark 8.15, Remark 10.4 at the stated pages; ARC Defs 1.1–1.2, Prop 2.1, Remark 2.2, Prop 2.8, Cor 2.9, Prop 5.2, Thms 5.4, 5.13, 6.4, 6.11, Defs 6.14, 6.19, Example 6.20, Cor 6.17 at the stated pages; Bha12 Lemma 8.3–Prop 8.5 p.32, Warning 8.9 p.33; K1 Lemma B.4 p.61; Mathew Def 7.1 p.27, Thm 7.8 p.28, Thm 5.8 p.18; CS Thm 5.3.5 p.59, Lemma 5.4.2 p.63; BL22 Prop F.4 p.237, Remark F.6 p.238.

**Adversarial table (values computed on each side).**

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 `C_p` | p=2: (x,y)=(3,5); p=3: (1,1); (1,0) | −(2/2)·15 = −15; −(3/3)(1+1) = −2; 0 — the Lean `addCorrection` gives the same three values by `decide` | holds | none |
| §0.3/0.8 δ on ℤ | p=2: δ(2), δ(4); product rule on 2·2 | (2−4)/2 = −1; (4−16)/2 = −6; 4(−1)+4(−1)+2·1 = −6 | holds | none |
| §0.8 | D_2(−1), D_3(2), D_p(−1) odd p | (−1−1)/2 = −1; (2−8)/3 = −2; (−1+1)/p = 0 | holds | none |
| §0.9 | (p) ⊂ ℤ | δ(p) = 1 − p^{p−1} ≡ 1 mod p, not in (p) | not δ-stable, as claimed | none |
| §0.10 second coordinate of C_p on B⊕F_p | general p, expand x^i y^{p−i} with central action | Σ(binom(p,i)/p)·i = binom(p−1,i−1), Σ(binom(p,i)/p)(p−i) = binom(p−1,i) give (ā^{p−1} − (ā+c̄)^{p−1})b + (c̄^{p−1} − (ā+c̄)^{p−1})d; p=2: −c̄b − ād | holds | none |
| §0.11 Witt product coordinate | ghost w_1 | (x_0y_0)^p + p(xy)_1 = (x_0^p+px_1)(y_0^p+py_1) ⇒ (xy)_1 = x_0^p y_1 + y_0^p x_1 + p x_1 y_1 (universal over ℤ) | holds | none |
| §0.13 | nonzero char p ring | δ(p·1)=δ(0)=0 vs cast of 1−p^{p−1} = 1 ⇒ 1=0 | no δ-structure, as claimed | none |
| §0.14 δ_λ on B⊕F_p | addition, product, Frobenius | addition: cross terms cancel via §0.10; product: needs ā^p = ā in F_p (Fermat); φ(a,b) = (φ_B a, 0) since p=0 on the second factor; δ_λ(ε)=λε, δ_λ(1+ε)=(λ−1)ε | holds | none |
| §0.15 | λ=0,1 at p=2 | δ_0(ε)=0 ≠ δ_1(ε)=ε; both φ send (a,b) ↦ (a,0); φ(ε)=ε²+2ε=0 | holds | none |
| §0.20 units of W_2 | (1,1) over ℤ, p=2 | inverse (a',b') needs b'(a^p+pb) = −a'^p b; a^p+pb = 3 not a unit ⇒ not a unit; general: b' = −a^{−p} b c^{−1} when c = a^p+pb unit | iff holds | none |
| §0.22/0.27 fraction formula | a = sz | δ(a) = φ(s)δ(z) + z^pδ(s) ⇒ s^pφ(s)δ(z) = s^pδ(a) − a^pδ(s); δ(1/3) at p=2 in ℚ = (1/3−1/9)/2 = 1/9 | holds | none |
| §0.25 | A=ℤ_(p)[X], φ(X)=X^p+p, S=⟨X⟩; s=(3,1) in ℤ⊕F_2ε | X^p+p not a unit of A[1/X]; φ(s)=(3,0), s²=(9,0)=(3,0)² | as claimed | none |
| §0.30 one-power loss | x=ab, a∈I, b∈I^n; sums via C_p ∈ I^{(n+1)p} | a^pδ(b) ∈ I^{n+p−1}, b^pδ(a) ∈ I^{pn}, pδ(a)δ(b) ∈ I·I^{n−1} | δ(I^{n+1}) ⊂ I^n without finite generation (sharper than BS22's I^{2n+1} ⊂ I^{2n}) | none |
| §0.32 q_n | p=2,I=(2): q_1(2), q_2(4); p=3: q_1(3); q_1(1+1) vs q_1(1)+q_1(1) | −1 mod 2 = 1; −6 mod 4 = 2; (3−27)/3 = −8 ≡ 1 mod 3; 1 ≠ 0 | holds | none |
| §0.35/0.39 completion | I=A; ℤ⊕F_2ε at (2); ℤ×ℚ at (p) | zero ring; ℤ_2⊕F_2ε with D(ε)=ε; ℚ/p^nℚ=0 so ℤ_p | holds | none |
| §0.40/0.41 radical units | p∈rad B | f(φx) = f(x)^p + p f(δx): unit ⇔ f(x) unit; (a,b)∈W_2 unit ⇔ a unit | holds | none |
| §0.44 | 9δ(1/3) at p=2 | 9·(1/9) = 1 | holds | none |
| §0.47/0.48 | generators; C_d((p)) | δ(as) = a^pδ(s)+s^pδ(a)+pδ(a)δ(s) ∈ J; 1 = δ(p) + p·p^{p−2} ∈ C_d((p)) | holds | none |
| §0.55 free δ-ring (headline) | V=∅; p=2, x_0↦2; A_n over φ(A_{n−1})[x_n]; δ(x_0²) | Free(∅)=ℤ; x_1↦−1; y_j=φ(x_j), x_n algebraically independent, monic triangular relations x_j^p = y_j − p x_{j+1} give a free module of rank p^n and the kernel of the presentation is torsion over a torsion-free module hence 0; δ(x_0²) = 2x_0²x_1 + 2x_1² | holds; faithful flatness of φ as a filtered colimit of polynomial-then-finite-free maps | none |
| §0.56 cofree Witt (headline) | A=ℤ, w(2); W(F_2), δ([1]), δ(V(1)); W(f) for f:ℤ→F_2 | w(2) = (2, δ(2)) = (2,−1), ghost 2²+2(−1)=2; δ([1])=0; δ(2) = −1 ∈ ℤ_2 has zeroth Witt coordinate 1 | holds | none |
| §0.57 | A=ℤ, p=2: S=⟨3⟩, S=⟨p⟩, S={1} | ℤ[1/3] localized along V(2) = ℤ_(2), 5 a unit; 1 + p(−1/p) = 0 inverted ⇒ 0; ℤ_(p) | holds | none |
| §0.58 | (p,0) and (1,0) in ℤ×ℤ | (p, −p^{p−1}) ↦ (p, p^p − p^p) = (p,0); (1,0) needs 0 ≡ 1 mod p | holds | none |
| §0.64 | px=0 integrally; ℤ_p[x]/(x^p−1), φ(x)=x^p; ℤ_p[x]/(x²), φ(x)=px | p^{p−1}φ(x) = φ(p^{p−2}·px) = 0 and δ(p)φ(x) = −p^pδ(x) = 0, so φ(x)=0; x^{p+1} = −(px)δ(x) = 0; reduced with φ(x−1)=0; φ injective, not reduced | holds without the ℤ_(p) hypothesis, examples separate the two | none |
| §0.65 (headline) | R=0; ℤ_p; ℤ_p[x^{1/p^∞}]^∧; ℚ with φ=id | zero ring: all vacuous; ℤ_p ≅ W(F_p), F=id; W(F_p[x^{1/p^∞}]); ℚ excluded since ℚ/pℚ = 0 so ℚ is not `IsAdicComplete` (not Hausdorff) | holds; hypotheses exactly exclude ℚ and non-perfect ℤ_p⟨x⟩ | none |
| §0.67 | ξ = p − [p^♭], p=2 and odd | coefficient of p in the Teichmüller expansion is 1 − p^♭ (p=2) or 1, a unit | holds | none |
| §0.68 | p=2, δ(x²/2) | (φ(x)²/2 − x⁴/4)/2 = x⁴/8 + x²δ(x) + δ(x)²; x⁴/8 = 3·x⁴/24 | holds | none |
| §0.69 Warning 2.41 | δ_1(x/p), δ_2(x/p) | BS22 p.25–26: δ_2 = δ_1 + 1/p | as cited | none |
| §0.73/0.74/0.79 prisms | (ℤ_p,(p)), (ℤ_p,(p²)), (ℤ,(p)), (F_p,(0)), (ℤ/p²,(p)); map q↦1 | p ∉ (p²,φ(p²)); ℤ not derived p-complete; (0) not invertible; p a zero divisor; [p]_q ↦ p but p ∉ ([p]_q) | as claimed | none |
| §0.76 Breuil–Kisin | E = u − p over ℤ_p | δ(E) = δ(u) + δ(−p) + C_p(u,−p) ≡ δ(−p) ≡ −1 mod (u,p): unit; u ∉ φ(A) = W[[u^p]] | holds | none |
| §0.77 q-de Rham | p ∈ ([p]_q, [p]_{q^p}) | in A/([p]_q) = ℤ_p[ζ_p], [p]_{q^p} ↦ 1+1+…+1 = p | holds | none |
| §0.78 | oriented, A ≠ 0, d a unit? | Δ_d(x)_n = x_n − d x_{n+1} has kernel (x_0, d^{−1}x_0, …) ≠ 0 unless A = 0 | generator not a unit | none |
| §0.88 | d=p, n=1 | z_1 = x^p/p^{p+1}; δ(x/p) = x^p/p² − x^p/p^{p+1} = p^{p−1}z_1 − z_1 | holds | none |
| §0.89 unbounded torsion model | M_i → (ℤ/p^{i+1})[f,f^{−1}], e_j ↦ p^j f^{−j} | relations p e_j ↦ p^{j+1}f^{−j} = f·p^{j+1}f^{−j−1}; p e_i ↦ 0; image is a direct sum of cyclic groups in distinct f-degrees of orders p^{i+1−j}, matching the orders in M_i ⇒ injective; x_{i,0} of exact order p^{i+1} | holds | none |
| §0.91 | p=2: δ(4), δ²(4) | −6 (valuation 1), δ(−6) = (−6−36)/2 = −21 odd | holds | none |
| §0.92 Joyal δ_n | p=2: δ_2(3), δ_2(2), δ_3(2) | 3 = 81 + 2·9 + 4δ_2 ⇒ −24; 2 = 16 + 2 + 4δ_2 ⇒ −4; 2 = 256 + 2 + 64 + 8δ_3 ⇒ −40; δ²(3) = δ(−3) = −6, δ²(2) = δ(−1) = −1 | all three Checks hold | none |
| §0.93 general envelope (headline) | telescope: Δ_0, Δ_1 on ℕ→ℤ, Δ_2(−1,−1,…); J=B; B=A, J=I; A=0 | Δ_0 = id; constants 0 and 1 in ker Δ_1; −1−2(−1) = 1 (addition: −3); 1 ∈ J ⇒ d unit ⇒ C = 0; identity envelope; zero ring | holds; `IsOrientedPrism` ⇔ oriented prism since bijectivity of (x_n) ↦ (x_n − f x_{n+1}) is Ext^{0,1}(A_f, −) = 0 (Stacks 091P form), p ∈ (d,φ(d)) is BS22 Def 3.2 | none |
| §0.93 solution-set route | closure under δ, d-quotients, inverse telescope coordinates over ω₁ stages | size ≤ κ^{ℵ₀}; products and kernels of derived complete modules are derived complete; uniqueness by transfinite induction since A-maps preserve unique telescope solutions and d-quotients | argument complete | none |
| §1.5 twist triangle | i=0, oriented (A,(d)) | Δ̄{1} → Δ ⊗^L I/I² → Δ̄ is the reduction of Δ →d Δ mod d²; I^i/I^{i+1} ≅ (I/I²)^{⊗i} for invertible I | matches BS22 Construction 4.9 | none |
| §1.7 Čech–Alexander | R = A/I⟨X⟩ | J_0 = IB_0 ⇒ C^0 = A{X}^∧ (envelope of IB is B); C^1 = A{X,Y}{(X−Y)/I}^∧; maps (C^0,IC^0) → (B,IB) ↔ elements of B | holds | none |
| §1.8 | empty presentation | weakly initial object (A,id,id) final, C^• constant A, Δ = A | holds | none |
| §1.10 helper | C=ℤ, J=(p), C'=F_p | Tor-amplitude [−1,0]; F_p ⊗^L_ℤ F_p keeps its degree −1 term | holds | none |
| §1.13a | p=2, G=ℤ | −1 = 2(−1)+1, so X^{−1} = X^{−2}·X; codegeneracy (1,1) ↦ 2 ∉ {0,1} | holds | none |
| §1.17 | α = can∘φ, d | α(d) = can(d)^p + p·can(δd) ∈ pB; can(d) ∉ pB when A/(p,d) ≠ 0 | holds (BS22 p.51 line 2018) | none |
| §1.24 negative control | A = T⊕M, T = ℤ_p[d,t]^∧, M = ∏J_n, J_n=(p,d^n) ⊂ ℤ_p[[d]] | φ_A ring map and Frobenius lift; δ_A(a,m) = (δ_T a, −a^{p−1}m), δ_A(d)=1; d regular on T and on each J_n; J_n/dJ_n = ℤ_p·p ⊕ F_p·d^n (p d^n = d·(p d^{n−1}) ∈ dJ_n, c·p ∈ dJ_n ⇒ c=0) so A/d has p-torsion killed by p; in J_n/pJ_n the class of p has exact d-torsion order n; e_n ↦ (t e_n)_{n+1} = d·p = d e_{n+1}; z_n = t^{1−n}e_n with d z_{n+1} = z_n, d^n z_n = 0, z_1 ≠ 0 (t^r e_1 has component d^r p ∉ pJ_{1+r}); B ⊗^L_A A/p = LΛ_d(R/p) since A/p is perfect over A and p is regular on R; H^{−1} = lim_n (R/p)[d^n] ∋ (z_n) ≠ 0 ⇒ B[p] ≠ 0 | the counterexample stands; ALB23 Lemma 5.1.6's proof (p.76 lines 3168–3174) infers p-complete flatness over ℤ_p from (p,I)-complete flatness over A, which is the invalid step | none (recorded under Source issues) |
| §1.26 (4) | k = F_{p²}, j ∉ F_p | j^p ≠ j so the curve is not isomorphic to its Frobenius twist | twist detected | none |
| §2.1/2.10/2.12 | R = A/I; R = A/I × A/I | Δ = A, φ = φ_A; A × A | holds | none |
| §2.2 | R = (A/I)/(f), f regular, R ≠ 0 | L_{R/(A/I)} = R[1] ⇒ gr_i = Γ^i(R){−i} = R{−i} ≠ 0 for every i ⇒ Fil_i ≠ Δ̄ | holds | none |
| §2.5/2.6 | R = A/I; R = (A/I)⟨x⟩; X = Spf(A/I) | both sides A/I; Fil_1 = τ^{≤1}Δ̄ = Δ̄ with split extension (lift A⟨x⟩); obstruction class in the zero group | holds | none |
| §2.13 nonprincipal Check | B = F_2[x,y]/(y²+xy+x³+1), P=(0,1), t=y+1, h=y+x² | partials (x, y+x²) vanish only at a point off the curve ⇒ smooth; Δ = −b_2²b_8 = −1 ≠ 0; P on the curve; t² = y²+1 = xy+x³ = xh; (x,t,h) = (1) since h(P)=1; N² = x(x,t,h) = (x); a generator would give a degree-one map E → P¹ | the example is correct; δ-formulas φ(d_1) = d_1² + 2X consistent with F(G) = G² and G²H = X | none |
| §2.13 ranks | r=0; r>0 | gr_0 = R; binom(r+i−1,i) copies of L_R^{−i} | holds | none |
| §2.13a | S = A/I; S = F_p[x]/(x²) over (ℤ_p⟨x⟩,(p)); S = F_p[x] over F_p (nonsurjective) | prism A; cotangent complex over F_p[x] free of rank one shifted, envelope adjoins x²/p; L has a degree-0 generator dx so H^1(Δ̄) ≠ 0 and discreteness fails | holds; matches KY Lemma 4.18 | none |
| §2.14 (4) | (ℤ_p,(p)), R = F_p ⊗̂^L_{F_p[x]} F_p | Künneth + Bha12 base change: dR of ℤ_p over ℤ_p[x] (x↦0) is P̂ = Γ(ℤ_p u)^∧, base change along x ↦ 0 gives [P̂ →u P̂]; u·u^{[n]} = (n+1)u^{[n+1]} injective; coker has [u^{[p]}] ≠ 0 (coefficient of u^{[p]} in u·P̂ lies in pℤ_p) with p·[u^{[p]}] = [u·u^{[p−1]}] = 0 | discrete with p-torsion, as claimed | none |
| §2.14 (1)–(2) | L_{R/B} | base change of L_{B/B⟨x⟩} = B[1] gives R[1]; gr_i = Γ^i(R){−i} = R{−i} | holds | none |
| §2.18 | B = R⟨x,y⟩/(xy) | L_{B/R} = [B → B²], 1 ↦ (y,x); ∧^i L[−i] for i ≥ 2 has terms Γ^i, Γ^{i−1}⊗B², Γ^{i−2}⊗∧²B² in degrees 0,1,2 = Kos(B;y,x); H⁰ = 0 (b with xb = yb = 0 is 0), H² = B/(x,y) = R, H¹ ∋ class of (x,−y) ≠ 0 | holds | none |
| §2.19 example | dR of F_p over ℤ_p | [P → P] with e_n ↦ (n+1)e_{n+1} − p e_n; t = e_p − e_{p−1} is killed by p and is not a relation (coefficient 1/p forced) ⇒ p-torsion in H⁰ | holds (Bha12 Warning 8.9) | none |
| §2.22 | (A,(p)) perfect crystalline, S = (A/p)[x] | S_perfd = (A/p)[x^{1/p^∞}] discrete; can not an iso since Δ̄_S has H¹ ≠ 0 | holds | none |
| §2.25 | S_3 = R; perfectoid S_1,S_2,S_3 | completed tensor of perfectoids is perfectoid (Tor-independence §0.85) | consistent with BS22 Prop 8.13 | none |
| §2.27 non-connective example | S = O_C⟨x⟩ | ζ_{p^n}-twists of t^{1/p^n} fix t, invariants of O_C⟨t^{1/p^∞}⟩ are O_C⟨t⟩; x is a p-th power mod p in any perfectoid U, t is not in (O_C/p)[t] | no universal perfectoid S-algebra, so S_perfd is not connective by Cor 8.14 | none |
| §2.0 arc checks | Spec F_p → Spec F_p[ε]/ε²; ℤ_p → ℚ_p; ℤ_p → F_p; ℤ_p[ε]/(pε,ε²) → ℤ_p | every map to a valuation ring kills ε; p must stay a pseudouniformizer in the test ring; p-torsion dies in valuation rings | as claimed | none |
| Lean `generalEnvelope_exists` universe | all rings in `Type u`, product taken in a larger universe in the route | the envelope has cardinality ≤ κ^{ℵ₀} with κ = max(ℵ₀,|A|,|B|), realisable in `Type u` | statable as written | none |
| Lean `Delta.Structure` for non-prime p | p = 4 | `p.choose i / p` is junk division; every theorem carries `p.Prime` or `Fact p.Prime` | harmless | none |

**Cross-roadmap citations resolved** (on main or at the open head named in the brief): PerfectoidSpaces §§P1.16–P1.18 (lines 4525–4652), P1.24–P1.25 (5049–5101), P4.15.1–P4.15.5 (10959–11173); DerivedModuleAlgebra §§0.K.1 (516), 0.1–0.17 (581–1268), 0.25 (1303), 1.1–1.9 (1573–2028), 1.E.1 (2200); EnhancedDerivedSheaves Layers E0, 0, E1, E2, E3, E5:abstract, E5:presentability, E5:descent, E5:spectra-comparison, E5:animation (lines 183–2031) with §§E0.4, 0.1–0.3, E1.1–E1.4, E1.9, E5:animation.1/2/4, E5:presentability.2; SchemeAndStackFoundations §§1.1 (2071), 2.1–2.6 (3265–3437), 4.7–4.8 (5339–5383); EtaleCohomologyFoundations §§0.5–0.6, F.0.4, F.1, F.2.1; AlgebraicVectorBundles L0A–L0B; PerfectoidQuotients §§0.0, 0.1, 0.3 at its head; AInfCohomology §§AI.1.7, AI.7.2 at its head; DerivedDeRhamCohomology §§PD.6–PD.7, 1.10, 1.23, 2.7, 2.26, 3.1–3.6, 5.1–5.8, 5.17, 5.23, 5.26, 6.20 at its head; CrystallineCohomology §§CR.1.1–CR.1.3, CR.2.1–CR.2.3, CR.DDR.4.5, CR.DDR.5.18, 5.20–5.22 at its head (no 5.19: see R02).

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (with a library table), How to read the build, three layers in build order each ending with Examples and Dependencies, Downstream consumers, References; every target has hypotheses in the sentence, a locator in parentheses and a `*Needs:*` line; definitions have API bullets and at least three Checks; no LaTeX, no pull-request numbers, no process words (the gate's other counters are 0). `metadata.toml` has `topic = "math.AG"`.

## Not verifiable

- Stacks Project tags cited in §§0.93, 1.0, 2.28 (091P, 091Q, 091S, 0AIF, 0D4B) and the Rydh paper of §2.0 were not fetched; the telescope criterion of §0.93 was checked directly instead.
- The Lean 4 repository "AC" (daddeziomath/affine-crystalline, cited at §§1.7–1.8 for `CechNerveData`, `rightDerivedLimIsoCech`, `hasEnoughInjectivesFunctorCategory`) was not fetched; the README's claims about it are reported, not checked.
- The published numbering of ALB23, KY and BL22 was not compared with the arXiv versions read; the README cites the arXiv numbering and gives published numbers in parentheses where it knows them.
- Ownership against open pull requests whose files the brief does not provide was not checked.

## Source issues

- **Misprint** in BS22 at Remark 2.37, printed page 24: the source writes the divided-power envelope as D_(x)(ℤ_(p)) where the ring adjoined to is ℤ_(p){x}; it should be D_(x)(ℤ_(p){x}); affects nothing.
- **Misprint** in BS22 at proof of Proposition 6.2, printed page 52: the source writes Ω¹ relative to A/d for a general bounded prism; it should be Ω¹ relative to A/I; affects nothing.
- **Error** in BS22 at Lemma 3.7(2), printed page 30: the source asserts every (p,I)-completely flat A-complex is discrete and classically complete, without derived completeness; it should assume M derived (p,I)-complete, as its proof uses (ℚ_p over ℤ_p is a witness); affects a stated result.
- **Gap** in BS22 at Construction 6.1, printed page 51: the source requires Frobenius on A/p flat and says the universal oriented prism has it by Example 3.4; Example 3.4 proves only d-complete flatness, and the construction uses only faithful flatness of A/(p,d) → A/(p,d^p); affects the proof.
- **Gap** in BS22 at Corollary 5.5, printed page 49, with Lemma 4.10 (p.39) and Proposition 6.2 (p.52): for p = 2 the comparison map of Theorem 4.11 needs Lemma 4.10, proved through Proposition 6.2, whose proof invokes Corollary 5.5; it should use only η⁰ and η¹, which need no Lemma 4.10; affects the proof.
- **Gap** in BS22 at Theorem 1.8(5), printed page 4: the base-change isomorphism for RΓ_Δ(X/A) is stated for every smooth formal X; it should require X quasi-compact and quasi-separated (Corollary 4.12 is the sheaf statement); affects a stated result.
- **Gap** in BS22 at Lemma 8.6, printed page 66: after base change to A/(p,φ^{−1}(d)) the source says the base is a perfect ring of characteristic p; it is only semiperfect, and the argument uses only the F_p-algebra structure; affects nothing.
- **Gap** in BS22 at Proposition 3.13, printed pages 33–35: the reduction to the orientable case by faithfully flat descent is not justified for the universal property toward unbounded prisms when I is not principal (pointed out in K1, footnote 8, p.13); affects the proof.
- **Error** in ALB23 at Lemma 5.1.6, printed page 76: the proof infers p-complete flatness over ℤ_p from (p,I)-complete flatness over A, so the lemma fails for an étale algebra over a p-torsion-free bounded prism whose A/p has unbounded I-torsion; it should add that A/p has bounded I-power torsion (true for perfect, crystalline, transversal and noetherian prisms, which covers its use in Theorem 5.1.4); affects a stated result.
