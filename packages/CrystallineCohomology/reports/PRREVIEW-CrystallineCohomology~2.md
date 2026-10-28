# Review of CrystallineCohomology (pull request #857 at a4d676d)

**Verdict:** needs changes

One P2 finding and six P3 findings. The finite-Witt comparison omits its positive-length hypothesis. The recorded push gate also fails its `tex` rule. No pull-request file was changed.

Previous findings, checked first against this head and the suppliers again:

- **Previous R01: not repaired.** README:433 still attributes “Serre duality with `ω = Ω¹`” to JacobianChallenge Layer B. See R02 below.
- **Previous R02: partly sustained, not repaired.** README:546–548 still assigns “extension by zero” and “faithfully flat descent” to SchemeAndStackFoundations Layer 2; README:8409 still says “§1.18”. See R03. The remaining allegation is withdrawn: EnhancedDerivedSheaves §E2.2 explicitly re-exports `IsReplete.derived_limits`, so citing that export is legitimate.
- **Previous R03: not established as a defect.** The Kato course-page link remains. Failure of the source service to certify it does not prove that the copy is unlawful or that no legal copy exists. I do not repeat that assertion. Its unread locators remain under Not verifiable.
- **Previous R04: not repaired.** README:10238 still gives “pp.240–244” for material beginning on p.238. See R04.
- **Previous R05: not repaired.** The eight uncited bibliography entries and two duplicate works remain. See R05.
- **Previous R06: not repaired.** README:330–332 still says names “do not assert declarations in `Suggested.lean`”. That exception conflicts with the prescribed form. See R06.

The previous report’s gate verdict was not reused. No supplied repair report marks a finding settled as non-actionable.

## R01 (P2) — Require positive Witt length in the evaluation equivalence

**Location:** `TauCetiRoadmap/CrystallineCohomology/README.md:1553`–1569: “W_n=W/pⁿ” and “Then (Z,Z_n,γ) is an object of Cris(Z/Spec W_n).” Neither these hypotheses nor the Witt conventions at line 262 restrict n.

**Claim:** Evaluation on this object defines the equivalence and reduction of its coefficient module to k for every indexed n.

**Witness:** Take k=F₂, Z=Spec k, and its formal lift Spf Z₂. For n=0, W₀=0 and Z₀=∅. There is no immersion Z→Z₀ and no unital map W₀→k. EsnaultGroechenig line 572 explicitly requires n>0.

**Exact repair:** Declare n≥1 in the statement and hypotheses, and index the compatible system by positive n. Add a negative-control Check excluding n=0. At n=1 the example has Z₁=Z, structure coefficient k, and the evaluation/reduction maps are identities; at n=2 it has the valid thickening Spec F₂→Spec Z/4. This repairs the failed instance without reducing the source's scope.

## R02 (P3) — Resolve the missing dualizing-sheaf identification in the curve contract

**Location:** `TauCetiRoadmap/CrystallineCohomology/README.md:433`–436: “dim H⁰(Ω¹) = g” and “Serre duality with `ω = Ω¹`”.

**Claim:** JacobianChallenge Layer B supplies these Hodge-number statements directly.

**Witness:** `TauCetiRoadmap/JacobianChallenge/README.md:139`–141 supplies genus, Riemann–Roch and duality with ω. `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4350` supplies `relativeDualizingModule_smooth`, identifying ω with the top exterior power of Ω.

**Exact repair:** Attribute genus and duality to JacobianChallenge and the smooth identification to SchemeAndStackFoundations §2.20; derive the Hodge numbers from them. For g=1 the corrected route gives h¹(O)=h⁰(Ω¹)=1 and dim H¹_dR=2. No new mathematical target is needed.

## R03 (P3) — Point three supplier locators to the actual sections

**Location:** `TauCetiRoadmap/CrystallineCohomology/README.md:546`–548 assigns “extension by zero `F_!`” and “faithfully flat descent of quasi-coherent modules” to Layer 2; line 8409 cites PerfectoidSpaces “§1.18”.

**Claim:** These are the locations supplying the consumed operations.

**Witness:** SchemeAndStackFoundations:2052 places fpqc descent in §1.1; its line 4185 uses extension by zero as an input. EtaleCohomologyFoundations:441 constructs it in §0.7. PerfectoidSpaces:4652 labels the θ-kernel section P1.18.

**Exact repair:** Cite SchemeAndStackFoundations §1.1, EtaleCohomologyFoundations §0.7 for the étale extension-by-zero interface, and PerfectoidSpaces §P1.18. For j:G_m→A¹, the corrected `j_!` has the original stalks on G_m and zero stalk at 0. These suppliers are available earlier; no ownership move is needed. EnhancedDerivedSheaves §E2.2 is a valid re-export and should not be reported missing.

## R04 (P3) — Include the first two pages of the Hyodo–Kato locator

**Location:** `TauCetiRoadmap/CrystallineCohomology/README.md:10238`: “§3.2–3.4, pp.240–244”, following §2.22–2.24.

**Claim:** The page interval covers all the named inputs to finiteness and Frobenius isogeny.

**Witness:** HyodoKato line 567 starts Lemma 2.22 on printed p.238; line 597 starts Proposition 2.23 on p.239. The current interval omits both starts.

**Exact repair:** Write pp.238–244. The proper Cartier-type log-point test still gives W_n of finite length n and rational Frobenius σ; only the locator changes.

## R05 (P3) — Remove uncited bibliography entries and merge duplicate works

**Location:** `TauCetiRoadmap/CrystallineCohomology/README.md:11668`–11682, and the duplicate Bhatt12/BMS19 entries at 11598, 11603, 11689–11698.

**Claim:** These references belong to claims made in the roadmap.

**Witness:** Panny–Robert–Sferlazza, Swan, Demazure, BBM, Serre, Berthelot, Scholze–Weinstein and Illusie's Pisa lecture each occur only in the bibliography. Bhatt12 and BMS19 each have two bibliography entries for the same work.

**Exact repair:** Delete the eight uncited entries unless an actual target needs and cites them; merge each duplicate while preserving its reference key. In particular, retaining the BMS19 key leaves the references to §8 and its equations unchanged. An uncited algorithm paper is not evidence that the roadmap itself plans an algorithm.

## R06 (P3) — Make API bullets and Checks prose rather than undeclared Lean catalogues

**Location:** `TauCetiRoadmap/CrystallineCohomology/README.md:330`–335, especially “they do not assert declarations in `Suggested.lean`”; examples at 993–997 and 4648–4664.

**Claim:** An opt-out allows backticked proposed declaration names throughout the API lists and named Checks.

**Witness:** The README contains 520 distinct backticked qualified `Crystalline.*`, `LogCrystalline.*` and `DerivedDeRham.*` names. Suggested.lean has two headline theorems and one structure. For example, `Crystalline.Crystal.tensor_eval` is absent from it.

**Exact repair:** Remove the opt-out and express this roadmap's undeclared API entries and Checks in prose. Preserve actual supplier names and the names of the three declarations that are present. Do not expand Suggested.lean to contain this catalogue. For the tensor example, retain the mathematical equality `(E⊗F)_T=E_T⊗F_T`; only the unsupported declaration claim is removed.

## R07 (P3) — Fix all six TeX-style gate failures

**Location:** `TauCetiRoadmap/CrystallineCohomology/README.md:1243`, 1732, 1757, 1759 (two occurrences), and 1788: examples are `D_{P,γ}`, `ξ^{[k]}`, `ξ^{[k−1]}` and `w^{p−1}` outside code spans.

**Claim:** The file satisfies the Unicode/code-span mathematics form.

**Witness:** The worker's gate for a4d676d reports `tex=6` and `FAIL`; every other gate counter, including build and dependency check, is zero.

**Exact repair:** Put the six expressions in code spans or use Unicode mathematical text, retaining their content. For example the antiderivative relation d(ξ^[k])=ξ^[k−1]dξ is unchanged. Re-run the gate; this head cannot be accepted while it fails.

## Verified sound

**Build, form and signatures.** HEAD and the clean worktree were checked. The diff outside this roadmap folder is empty. The supplied gate reports `build=0`, `depcheck=0`, `stray-files=0`, and the six style failures in R07. A fresh `lake env lean` elaboration of Suggested.lean exited 0 with only its two `sorry` warnings. A scratch copy with `#check @` for all three declarations also elaborated. The block-basis theorem retains primality, field, characteristic-p, perfectness, algebraic closure, isocrystal and finite-dimensionality binders. `PhiNModule` retains the isocrystal and scalar data; its nilpotence theorem additionally retains finite-dimensionality. No binder changed. The structure's monodromy relation refers to an invertible semilinear Frobenius, not an arbitrary endomorphism.

Both sorried theorems were tested on a scratch copy with single-tactic alternatives `rfl`, `simp`, `infer_instance`, and `exact?`; neither closed. No padding finding. There is one `import Mathlib`, no extra imports, no `set_option`, no sorry'd data, and no admitted examples. The layer comments and exact module-title form also need the prescribed formatting.

**Headline coverage.** The four explicit end theorems in the opening are crystalline–de Rham comparison/PD Poincaré, crystalline de Rham–Witt comparison, crystalline Poincaré duality, and Hyodo–Kato comparison. The layer endpoints additionally include crystal–connection equivalence, base change and perfectness, Künneth, Frobenius isogeny, Dieudonné–Manin, strict completion/décalage fixed points, Nygaard comparison, log Cartier and Abhyankar, derived/log crystalline lci comparisons, monodromy nilpotence, convergent/log-rigid comparisons, and relative Gauss–Manin/base change. The two native-isocrystal headlines are in Suggested.lean. Its docstring identifies the missing geometric or complex carriers for the others. No weakened replacement is used. Canonical slope summands over a general perfect field are separately named there as requiring the scalar-extension/descent construction.

**Pins and ownership.** At Mathlib 6b7abb3 and Tau Ceti a91d3aa, I opened these declarations rather than relying on remembered APIs:

- `Mathlib/RingTheory/DividedPowers/Basic.lean:77`: total `DividedPowers`, with `dpow_null` outside the ideal and `dpow_comp` requiring nonzero inner index; the zero-ideal structure follows at line 96.
- `Mathlib/RingTheory/WittVector/Isocrystal.lean:113`: `Isocrystal` bundles a module and invertible semilinear `frob`; it does **not** impose finite dimension. `Isocrystal.frobenius` is at 125, `IsocrystalHom` at 132, `IsocrystalEquiv` at 138, `StandardOneDimIsocrystal` at 157, its Frobenius formula at 172, and `isocrystal_classification` at 180. The last has finrank exactly one and does not duplicate the new all-rank theorem.
- `Mathlib/RingTheory/Teichmuller.lean:131`, 155, 170: `Perfection.teichmuller₀`, its uniqueness specification and its reduction; this is the general perfect-residue-field input, distinct from finite-residue units.
- `TauCeti/RingTheory/Henselian/Teichmuller.lean:92`, 117: `teichmuller` and `residue_teichmuller`, for a Henselian local ring with finite residue field. `TauCeti/RingTheory/Nilpotent/Exp.lean:125`: `nilpotentExpUnit`, with a real exponential body and nilpotence hypothesis.
- `TauCeti/RingTheory/WittVector/Complete.lean:197`, 215 and `Frobenius.lean:43`, 49, 65, 79: the stated completeness, Teichmüller and continuity interfaces. Their hypotheses on perfect characteristic-p coefficients and adic completeness are retained in the supplier contract.

Object searches across the pins did not find the missing crystalline-site, PD-envelope, log-structure or Dieudonné-complex constructions. Searches through `roadmaps grep`, the supplied sibling heads, main and package material distinguish the existing PD foundations in DerivedDeRhamCohomology and DerivedModuleAlgebra from the crystalline applications here. CrystallineCohomology itself is absent on main c994070; this is not a re-plan of an existing main-branch folder. The equal-characteristic block theorem in VectorBundlesAndIsocrystals uses a Laurent/Hahn-series carrier, not this mixed-characteristic Witt carrier. Filtered (φ,N)-modules elsewhere carry a filtration and coefficient-field data; they are not another declaration of this minimal structure. A precise Lean-name search found no second declaration of either theorem or either namespace's structure. Broad search results were narrowed where the tool truncated them; they are not a claim to have proved every negative ownership assertion in the repository.

**Supplier audit.** The fresh requested check printed exactly:

```text
depcheck: 163 roadmaps, 1189 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Main-branch suppliers were checked on main c994070, not substituted by revision pull requests. The named open suppliers were read through `roadmaps show`. Representative resolved contracts, including the ones the sampled proof routes use, are:

| Supplier | Resolved section/declaration and evidence |
| --- | --- |
| DerivedDeRhamCohomology | §§PD.1–PD.2, PD.4–PD.7 for envelopes and compatibility; §§2.21–2.28 for de Rham, derived realizations and products; §3.11 gives the explicit square-zero cotangent calculation; §§5.8–5.8.1 distinguish raw realization from Hodge completion; §§6.20–6.21 provide the shared prelog, cotangent, de Rham and period maps. |
| DerivedModuleAlgebra | README:105 §0.DP.2; 239 §0.DP.3 augmentation; 516 §0.K.1; §0.1 and §§0.4–0.17 for resolutions/cotangent operations; 1403 §1.T.1; 2316 §S.1 spectral sequence. |
| SchemeAndStackFoundations | README:1090 §0.15; 1640 §0.26 (perfect-scheme Witt construction, positive length); 1825 §0.29 Frobenius; 3867 §2.15; 3924 §2.17; 4275 §2.20; 5291 §4.6; 5339 §4.7. R02/R03 distinguish the inaccurate attributions. |
| EnhancedDerivedSheaves | README:689 §E1.6 Kunz; 925 §E1.9 proper perfect pushforward; 1296 coherent tower limit; 2083–2095 §E2.2 replete limits and Milnor, expressly re-exporting the foundational theorem. No repleteness of arbitrary crystalline/Zariski topoi was assumed. |
| EtaleCohomologyFoundations | README:441 §0.7 extension by zero; §§F.4.1–F.4.4 adic systems and realization; §F.7, at 1252, weak Lefschetz with invertible coefficient prime. Its use with ℓ=p is on the characteristic-zero generic fibre. |
| AdicSpacesPartIII | README:1310 F0.3 formal schemes; 2729 F0.6 coherent systems; 3272 F0.7 existence; 3525 F0.8 algebraization; 4356, 4615, 4986 R2.2–R2.4 generic fibres/tubes. |
| AdicSpacesPartIV; AdicEtaleGeometry | README:583/613 R4.1–R4.2, 3766 F1.5, 4238 F1.7, 5594 F1.11; AdicEtaleGeometry:3259 A1.6. Finiteness is consumed with its hypotheses. |
| PerfectoidSpaces | README:4611 P1.17, 4652 P1.18, 5049 P1.24, 5101 P1.25: θ, primitive kernel, integral-perfectoid predicate and Tate-pair transition. |
| DiamondsAndVStacks | D6.9, including `IsSeminormalRing`, `IsSubintegral`, the subintegral lifting/bijectivity theorems and seminormalization reflection. The residue calculation uses that reflection, not a second carrier. |
| PadicPeriodRings | §2 `PadicFieldCompletion`; §3 `periodPDEnvelope` and ordinary p-adic A_cris completion; §4.1 Frobenius and period structures. |
| LocalPurity; PurityOfBranchLocus; AbhyankarLemma | LocalPurity §§2.1–2.2; PurityOfBranchLocus §§0.1,2.1–2.2; AbhyankarLemma §§0.1–0.3,1.1,3.3–3.4. Their regular-divisor/DVR results do not themselves assert the multi-branch log Abhyankar theorem planned here. |
| JacobianChallenge; EllipticCurves | Layers B/C and Layers 1/3 respectively; genus/duality versus Ω identification separated in R02, elliptic point count and trace used for the Frobenius examples. |
| DGAInfinity; PadicFunctionalAnalysis | Layer 1 DG models and §4.5 exponential/logarithm; these supply the algebraic and convergent operations, not crystalline comparison theorems. |

**Seeded source sample.** All source retrieval used the sources service. Twelve of the fifteen targets have readable supporting text (the first needs R01); three Kato-primary targets are not text-certified. There were no README locators explicitly flagged “unverified”. Source keys below identify the service's line-numbered extractions; the numbering refers to the versions read, not an assumed newer edition.

| Sampled target | Text opened and result |
| --- | --- |
| Finite-Witt evaluation and formal coefficient comparison | EsnaultGroechenig lines 565–615, §2.6, manuscript pp.14–15; n>0 at 572, quasi-nilpotent evaluation at 595–597, formal limit at 607–615. StacksCrys lines 1585 ff., Lemma 60.17.5, and 2337–2354, Remark 60.24.11. Positive length omitted: R01. |
| Linearization in a smooth ambient scheme | LeStumQuiros lines 316–369, Definition 3.3 and Proposition 3.8, pp.10–11, level m=0. BhattDeJong lines 203–208 (Remark 2.9, p.4), 325–334 (Remark 2.18, p.7). Smooth ambient and quasi-coherent coefficients are essential and present. |
| De Rham computation in a smooth ambient embedding | LeStumQuiros lines 390–400, Corollaries 3.10–3.11, p.12; BhattDeJong lines 215–217, Theorem 2.12, p.4, and 376–421, Theorem 3.6, pp.8–9. The general PD-base case uses the former; the latter alone is a Z_p-base result. |
| Morphisms commute with Verschiebung | BLM lines 494–518, Definition 2.2.1, Remark 2.2.3 and Proposition 2.2.4, v3 p.14. Injectivity of F and FV=p force fV=Vf; no extra V-compatibility hypothesis is needed. |
| FdV=d | BLM lines 509–518, Proposition 2.2.4 and proof, v3 p.14. Cancel p in p·dx=p·FdVx, justified by saturation. |
| Derived p-décalage and completion | BLM lines 3278–3346, Proposition 7.2.1, Corollaries 7.2.2–7.2.3, Proposition 7.2.4 and Lemma 7.2.5, v3 pp.84–85. This gives an endofunctor, not an exact functor. Source typo recorded below. |
| Saturation by iterated décalage | BLM lines 546–555, Proposition 2.3.1/Corollary 2.3.2, v3 p.15; first quotient all p-power torsion, then iterate décalage. |
| Projection to the finite quotient | BLM lines 675–709, Construction 2.5.1 and Remarks 2.5.2–2.5.3, v3 pp.19–20. Quotient is by im V^r+im dV^r, without closure; r=0 gives zero. |
| Degree filtration and slope spectral sequence | Illusie lines 3995–4133: II.2.13 p.613; II.3.1–3.5 pp.614–616. Proper smooth/perfect-field hypotheses, rational E₁ degeneration and intervals [a,a+1) agree. The integral finite-generation/degeneration overclaim is explicitly avoided. |
| Exact morphisms | Kato §4.1: primary text unavailable. The Cartesian monoid condition was tested directly in row 7868. |
| Log smooth morphisms | Kato §3.1 and Theorem 3.5: primary text unavailable. Root-chart and node calculations below distinguish the intended notion, but do not certify the printed locator. |
| Log de Rham complexes | Kato §§1.7–1.9: primary text unavailable. The actual shared constructors resolve to DerivedDeRhamCohomology §6.20; the differential and odd-square examples were recomputed. |
| Morphisms of Cartier type | HyodoKato lines 348–367, §2.12, pp.231–232, confirms integrality and exact relative Frobenius. Kato's parallel locator remains unread. |
| Integral free-resolution envelopes | Bhatt12 lines 1450–1469, Proposition 7.18, p.30; Beilinson lines 147–258, §1.3 pp.4–6 and §1.4(i) p.6, and §§1.8–1.9 pp.11–13. The latter supports arbitrary integral quasi-coherent charts and source preservation when base powers extend; zero base ideal meets that condition. |
| Change of uniformizer | HyodoKato lines 1406–1465, §5.5, pp.265–266; comparison Theorem 5.1 at 1321–1342, pp.262–263. Positive exponential sign and unit logarithm agree. |

**Computed adversarial pass.** The 48 retained target rows cover all fifteen seeded targets, the headline results, and supporting examples; convention, Lean and finding witnesses follow. The remaining per-target ledger is omitted for comment length. Each row records values or modules. “Pass” means the displayed instances agree, not that finite examples prove the theorem. README line numbers identify the statements.

| Statement (README line; abridged title) | Instances and computed values on the two sides | Result / change |
| --- | --- | --- |
| 1473: Crystals,… | θe₂=e₁, θe₁=0: Taylor(e₂)=e₂+ξe₁; composing ξ and η gives e₂+(ξ+η)e₁. | Pass |
| 1553: Finite-Witt evaluation and formal coefficient comparison | n=1, Z=Spec F₂: W₁=F₂ and E₁=F₂. n=0: W₀=0, Z₀=∅, and no Z→Z₀ exists. R01. | Fails at n=0; R01 |
| 1714: The relative PD… | k⟨ξ⟩: dξ^[m+1]=ξ^[m]dξ; contraction of ξ^[m]dξ returns ξ^[m+1], so H=(k,0). | Pass |
| 1970: Linearization in a smooth ambient scheme | X=P=G_m: L(O)=k[x,x⁻¹]⟨ξ⟩; (x+ξ)⁻¹=x⁻¹Σ_(j<p)(−ξ/x)^j since ξ^p=0. | Pass |
| 2026: Independence of the… | Point embedded in A⁰ and A¹: complexes k and k⟨ξ⟩→k⟨ξ⟩dξ both have H=(k,0); projection fixes 1. | Pass |
| 2083: De Rham computation in a smooth ambient embedding | Same point embedding: h(dξ)=ξ, dh(dξ)=dξ; comparison sends 1 to 1 and positive cohomology to 0. | Pass |
| 2734: Derived crystalline… | X=Spec F_p, A=Z/p², B=F_p: RΓ=A[0], A⊗^L_A B=B[0]=RΓ after base change. | Pass |
| 2812: Proper smooth… | P¹/F_p: K=W[0]⊕W[−2]; Tor amplitude [0,2], finite-level reductions W_n in degrees 0,2. | Pass |
| 3164: Proper smooth… | Two disjoint points × three points: W²⊗W³=W⁶, all Tor₁ terms 0; product has six points. | Pass |
| 3260: Vanishing of the top… | Elliptic curve: h¹(O)=h⁰(Ω¹)=1, top differential 0, dim H¹_dR=2; ω≅Ω¹ needs the additional supplier. | Pass; R02 |
| 3592: Rational crystalline… | P¹: F on H² is pσ, not integrally onto; after inverting p, inverse is p⁻¹σ⁻¹. | Pass |
| 3693: Dieudonné complexes | T=[Z --id→ Z], F⁰=p,F¹=id: dF(x)=px=pFd(x); F=id in both degrees fails for x=1. | Pass |
| 3963: Morphisms commute with Verschiebung | Z[0],F=id,V=p, f=a: fV(x)=apx=Vf(x), for p=2 and p=3. | Pass |
| 4000: FdV=d | For T, FdV(1)=F¹d(1)=1=d(1), for p=2,3; replacing V⁰ by p gives p instead. | Pass |
| 4061: Derived p-décalage and completion | [Z --p²→ Z] degrees −1,0: H⁰η=Z/p=H⁰/H⁰[p]; completion gives the same Z/p. | Pass |
| 4095: Saturation by iterated décalage | Z[0],F=p: saturation=Z[1/p]; F=id gives Z; F=0 gives 0; p-torsion input Z/p gives 0. | Pass |
| 4462: Projection to the finite quotient | Z[0]: π_r(1)=1 mod p^r, π_r(p^r)=0, dπ_r=π_rd=0; π₀=0. | Pass |
| 4648: Finite Verschiebung… | Z[0]: V₁F₂([p+1])=[p] mod p²=p[p+1]. | Pass |
| 5057: Strict completion and… | Z[0]→Z_p[0]: completion mod p^r is Z/p^r on both sides; a continuous map is fixed by its value on 1. | Pass |
| 5107: Strict Dieudonné… | Z_p[0]: η_p fixes Z_p[0] and F=id gives the fixed-point equivalence; reduction is F_p. | Pass |
| 6518: Finite and infinite… | P¹: crystalline and hypercohomology of WΩ both W in degrees 0,2; reduction gives W_n in those degrees. | Pass |
| 6627: Slope decomposition on… | Rank 0: empty blocks; slope −1: F(e)=p⁻¹e; slope 3/2: F(e₀)=e₁,F(e₁)=p³e₀. | Pass |
| 6707: Degree filtration and the slope spectral sequence | P¹: E₁^(0,0)=K,E₁^(1,1)=K; slopes 0,1 and all differentials 0, matching degrees 0,2. | Pass |
| 6758: Nygaard filtration and… | Perfect field: N^iW=p^iW (i≥0); φ_i(p^ia)=σ(a), while φ_i on p^(i+1)a gives pσ(a). | Pass |
| 7210: Proper smooth… | P²: h²=−ω and ε₂=−1, so normalized trace(h²)=(−1)(−1)=1; trace on P⁰ sends 1↦1. | Pass |
| 7342: Derived crystalline… | P¹: pairing H⁰×H²→W has matrix (1); torsion Ext¹ shifts the partner to 2d−i+1, not 2d−i. | Pass |
| 7868: Exact morphisms | N --×2→N is exact: preimage_N under Z --×2→Z is N; sum N²→N is not: (−1,1) maps to 0. | Pass |
| 7977: Log smooth morphisms | Root chart ×n: Ω_log=B/nB; n prime to p gives 0, n=p over F_p gives B and is not log étale. | Pass |
| 8133: Log smoothness over log… | Semistable xy=π over a log DVR: total ring dimension 2; at the node dim(O/(x,y))+rank N²=0+2. | Pass |
| 8258: Logarithmic Abhyankar… | SNC xy=0, tame roots x=u^n,y=v^m: residual inertia killed by indices n,m; p-th roots are excluded as wild. | Pass |
| 8521: Log de Rham complexes | Log torus: dlog t=t⁻¹dt is closed and non-exact; derivative of t^m has exponent m−1, with m=0 coefficient 0. | Pass |
| 8637: Morphisms of Cartier type | p=3, root index 2 log point: Frobenius pushout image <2,3>⊂N misses 1, hence relative Frobenius not exact. | Pass |
| 8666: Logarithmic Cartier… | Free log line: inverse Cartier(dlog x)=[dlog x]; ordinary dy maps to [y^(p−1)dy], also p=2. | Pass |
| 9678: Integral free-resolution envelopes | Free one-log-generator resolution: ambient M⊕N remains cancellative; empty generators give identity; Q_≥0 identity envelope retains Q_≥0. | Pass |
| 10210: Frobenius–monodromy… | φ(e₀)=e₀,φ(e₁)=pe₁,N(e₁)=e₀: Nφ(e₁)=pe₀=pφN(e₁). | Pass |
| 10227: Finiteness and… | Cartier log point gives finite W-module rank 1 and invertible rational φ; root index 2 at p=3 lacks Cartier type. | Pass |
| 10247: Nilpotence of… | Rank 0: N⁰=id=0 in End(0); rank 2 example N²=0; coefficient valuations force every lower characteristic coefficient 0. | Pass |
| 10560: Hyodo–Kato comparison… | Good reduction point: HK⊗K=K₀⊗K=K=H⁰_dR; higher degrees 0; comparison sends 1↦1. | Pass |
| 10577: Change of uniformizer | N(e₁)=e₀,N²=0: exp(LN)e₁=e₁+Le₀; successive changes add L+M, with positive sign. | Pass |
| 11014: Convergent and log de… | Point: convergent and log Witt rational complexes K₀[0], comparison of 1 equals 1. | Pass |
| 11131: Log rigid Hyodo–Kato… | Good reduction point: log rigid HK=K₀, φ=σ,N=0; extension to K gives K. | Pass |
| 11213: Proper log rigid and… | Proper smooth P¹: rigid and crystalline HK ranks 1,0,1, with F factors 1,p and N=0. | Pass |
| 11377: Proper smooth… | Point over W: derived base change W⊗^L_W W_n=W_n; for rank r coefficient both sides W_n^r. | Pass |
| 11414: Relative crystalline… | f=id and V=Spec F_p,T=Spec Z/p²: K_T=F_T; no T→V exists, so X_V cannot be replaced by X×_V T. | Pass |
| 11458: Relative Gauss–Manin… | Trivial P¹-family: Gauss–Manin on coefficients is d, ∇(a·1)=da,∇(a·h)=da·h; curvature 0. | Pass |
| 11499: Horizontal Gauss–Manin… | Identity base change: pulled-back connection d equals d; constant scalar extension sends da to d(a⊗1). | Pass |
| 2276: CR.DDR.4.3 | k[t]→k: both sides k⟨t⟩, γ_p(t)≠0 but t^p=0; I=0 gives A. | Pass |
| 9805: CR.DDR.6.14 | Strict regular quotient k[t]→k: both complexes k⟨t⟩; non-lci square-zero quotient has negative source cohomology k versus target 0. | Pass |

Additional convention, Lean and finding witnesses:

| Statement | Instances and computed values | Result / change |
| --- | --- | --- |
| Total divided powers; inner index zero | On Z with I=0: γ₀(γ₀(0))=γ₀(1)=0, whereas `uniformBell 0 0`γ₀(0)=1. | Inner-index exclusion is necessary and present. |
| Uniform Bell normalization | m=2,n=0: `uniformBell 2 0`=1 but the naive factorial expression is 1/2. | Do not extend the factorial formula to this boundary. |
| Canonical PD powers at p=2 | γ_(2^a)(2) has v₂=2^a−v₂((2^a)!)=1; modulo 4 it is 2, not 0. | Checks correctly reject PD-nilpotence of (2). |
| Čech orientation | d=0,1,2: ε_d=1,1,−1; h²=−ω and normalized trace(h²)=1. | Same convention in Chern, trace and duality rows. |
| Shift sign in monodromy | ι¹(x)=xθ, ι²(dx)=−dx∧θ; dι¹(x)=dx∧θ=ι²(−dx). | Signed inclusion is a chain map; unsigned right wedge fails. |
| Tate twist | r=−1: φ on W(−1)=pσ; r=1 gives p⁻¹σ, matching the P¹ class convention. | Pass. |
| Lean block theorem at rank one | Standard slope m=−1,0,1 gives F(e)=p⁻¹e,e,pe; rational denominators are all 1. | Agrees with the pinned standard one-dimensional construction. |
| Lean nilpotence, general coefficient check | In dimension d, coefficient c_i of χ_N satisfies v(c_i)=(d−i)v(p)+v(c_i). For i<d a nonzero finite valuation is impossible; χ_N=T^d and N^d=0. | Uses finite dimension, invertible semilinear φ and valuation preservation, all present. |
| Nilpotence negative controls | φ=0,N=id satisfies Nφ=pφN but N^r=id≠0. On a bilateral basis e_i, φe_i=p^ie_i, Ne_i=e_(i−1) satisfies the relation but N^r e_i=e_(i−r)≠0. | Excluded by invertibility and finite dimension respectively. |
| R02 curve attribution | g=1: h¹(O)=1; ω≅Ω¹ gives h⁰(Ω¹)=1; H¹_dR dimension 1+1=2. | Correct statement, repair supplier attribution. |
| R03 extension by zero | Stalk of j_!Λ for j:G_m→A¹ is Λ on G_m and 0 at 0; identity open gives Λ everywhere. | Correct interface at EtaleCohomologyFoundations §0.7. |
| R04 finite length | Standard log point: length_(W_n)(W_n)=n, rational rank=1, φ=σ bijective. | Mathematics unchanged by page repair. |
| R05 bibliography duplication | Two entries each identify Bhatt12 and BMS19; merging each gives one key for the same work, with all in-text key resolutions unchanged. | Bibliographic repair. |
| R06 declaration claim | `tensor_eval` has zero declarations in Suggested.lean; two free rank-one coefficients evaluate to W⊗W=W. | Keep the law in prose; do not add padding. |
| R07 notation | At k=2, d(ξ^[2])=ξ dξ before and after putting the expression in a code span. | Six scanner occurrences need formatting only. |

The displayed tests include zero modules, rank zero, p=2 and p=3, negative slopes, nonreduced thickenings, boundary indices and identity maps. They do not replace source verification or prove the general statements.

## Not verifiable

- **Kato, Logarithmic structures of Fontaine–Illusie.** The supplied course-page URL was tried through the sources service, which could not certify its licence class. I did not bypass that decision. The exact-morphism, log-smooth and log-de-Rham primary locators in the sample, and other Kato-only locators in the roadmap, are not text-certified. HyodoKato §2.12 independently verifies the Cartier-type condition; Beilinson §§1.3–1.9 independently supports the integral quasi-coherent envelope/comparison range. This is not an allegation that the course copy is unlawful.
- **Berthelot–Ogus, Notes on crystalline cohomology.** Bibliographic retrieval through the service found no legal full text. The author-hosted B2 erratum was readable; its correction was checked. Other print-only locators in the book are not independently certified here.
- **Olsson, The logarithmic cotangent complex (Ols05).** The DOI resolves to a paywalled publisher; the service classified it `uncertified`. No new missing-source request is made for this settled status. KY and Bhatt12 provide readable secondary support, but not a verification of the original printed numbering.
- **D'Addezio formalisation.** The Zenodo DOI and linked GitHub landing page were tried through the service; no readable source extraction was obtained. Thus the claimed old-pin declarations, their precise hypotheses and the portability claims at README:1866–1878 and 2063–2077 are not independently verified. No code was downloaded or executed to bridge this gap.
- **Uncited print references.** BBM, Messing, Demazure, Serre and Berthelot were returned as `uncertified`; Swan retrieval found no legal text. The eight unused entries of R05 supply no reviewed target, so removing them avoids an unnecessary verification obligation. Legal author copies of the unused Illusie, Scholze–Weinstein and Panny–Robert–Sferlazza items were retrievable; their presence is still unexplained by an in-text claim.
- Sources outside the seeded sample were fetched where cited and used for specific checks above; retrieval alone is not a claim that every unsampled theorem/page locator in this 11,726-line README was independently certified. In particular, the table's identity/boundary tests are limited evidence for the analytic comparison targets, not independent proofs of their general analytic hypotheses.

The review is finished with these limitations recorded; no request for a missing text is a reason to postpone the verdict. The unresolved-source list preserves the existing Kato entry and records the additional unavailable works under their existing keys. No roadmap source manifest was edited.

## Source issues

- **Misprint** in BLM at Proposition 7.2.4, arXiv v3 p.84: the source says N is the derived p-completion of N; it should be the derived p-completion of M; affects a stated result.
- **Error** in Bhatt12 at Definition 7.20 and Theorem 7.22, p.31: the source allows any strict effective epimorphism in the factorization; it should require the regular-quotient condition used by the invoked comparison theorem; affects a stated result.
- **Error** in KY at Theorem 2.11, second displayed base-change formula, p.15: the source tensors derived de Rham over the target ring S₁; it should keep the base-ring tensor, since its differential is generally only base-linear; affects a stated result.
- **Misprint** in Kato at §5.5.2, p.216, as documented by DuMoonShimizu Theorem 2.1 footnote 2, p.5: the source puts extension of the base powers on the ambient Y; it should put it on the original source X; affects a stated result.
- **Error** in BerthelotOgus at Appendix B, (B2.1), p.B.2, documented by BOErratum lines 7–30: the source asserts an unrestricted termwise-surjective projective replacement; it should assert an isomorphism in the derived category, or assume surjective input transitions for the stronger replacement; affects a stated result; corrected in print at BOErratum (B2.1)–(B2.1a), p.1.
- **Error** in Illusie at I.3.21, p.579, documented by IllusieErrata lines 50–52: the source gives an invalid proof of the infinite de Rham–Witt identities; it should use the corrected argument of Illusie–Raynaud II.1.3; affects the proof; corrected in print at IllusieRaynaud II.1.3, p.125.

The roadmap already accounts for the latter five corrections in its mathematical statements or proof routes. For Bhatt12 the negative control is the non-lci square-zero quotient: its derived de Rham has negative cohomology, while the ordinary crystalline target does not. For KY, d(t·1)=dt≠t·d1 witnesses the invalid target-ring linearity. The BLM wording slip has not been copied into the roadmap's completion theorem.
