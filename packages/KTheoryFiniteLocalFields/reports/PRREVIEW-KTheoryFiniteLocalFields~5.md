# Review of KTheoryFiniteLocalFields (pull request #1281 at 6fe116e)

**Verdict:** needs changes

## R01 (P3) — HM03 section page ranges disagree with the version the README fixes

**Location:** `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md` line 1769, "§§2–3 pp.32–64; §§4.3–4.4 pp.65–74; §§5–6 pp.75–104"; line 775, "(HM03 §4.4 pp.68–71)"; line 826, "HM03 §5.1 pp.74–75".

**Claim:** In arXiv v2 of HM03, the version fixed under References, these sections sit on other pages. The numbered results cited in the body are on the pages given; only these section ranges are off.

**Witness:** HM03 line 1006: §2 begins p.28. Line 2132: §4.1 begins p.59. Line 2342: §4.3, p.64. Line 2537: §4.4, p.70. Lines 2665–2666: §5 and §5.1, p.73. Line 2714: §5.2, p.74. Line 3524: §6, p.96.

**Repair:** Line 1769: "§§2–3 pp.28–59; §§4.3–4.4 pp.64–73; §§5–6 pp.73–104". Line 775: "(HM03 Proposition 4.4.1 p.71 and Corollary 4.4.2 p.72)". Line 826: "HM03 §5.1 pp.73–74".

## R02 (P3) — Milne's *Class Field Theory* is cited without a References entry

**Location:** `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md` line 576, "(K-book Example III.6.2.3 p.233; Milne, *Class Field Theory*, III Remark 4.5 p.114)".

**Claim:** The work has no entry under References, so no version fixes "p.114". Its Hilbert symbol is also the transpose of this roadmap's, which is recorded for Sharifi but not for Milne.

**Witness:** "Milne" occurs once in the README (line 576). Remark 4.5 is on p.114 of v4.03 (6 August 2020). ClassicalArithmeticCompletion §1.14 on main: "(a, b)_Milne = (b, a)_{F,n}".

**Repair:** Add under References: "- **Milne:** J. S. Milne, *Class Field Theory*, course notes v4.03, 6 August 2020, [author PDF](https://www.jmilne.org/math/CourseNotes/CFT.pdf), Chapter III, Remark 4.5 p.114. His Hilbert symbol exchanges the two inputs relative to this roadmap's convention; the exponent-change identity is unaffected."

## Verified sound

Repairs of the previous review's findings at this head: R01 repaired (lines 229, 237, 295, 307, 357: rings only for moduli with no prime-power factor in {2,3,4,8}; the K(𝔽₃)/2 Check added). R02 repaired (`moore_normResidue`, `Suggested.lean` lines 92–104). R03 repaired (lines 79, 151, 183, 386). R04 repaired (line 849; the theorem is deleted). R05 repaired (0 occurrences of the 14 names). R06 repaired (own backticked names are the 8 declarations). R07 repaired (lines 674, 713, 1444, 1455). R08 repaired (line 1739). R09 repaired (description lists the 11 open suppliers).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| H1 `milnor_no_p_torsion` | n=0,1,2 over 𝔽_p, 𝔽_p(t) | n=0: ℤ, no relations; n=1: x^p=1 ⇒ x=1; n=2: adjacent relations are the Steinberg ideal in degree 2 | true; not closed by `simp`, `rfl`, `infer_instance`, `aesop` |
| H2 `moore_localK2` | ℚ₂, ℚ₃, 𝔽₂((t)) | w=2,2,1; U=wK₂=⋂mK₂; {−1,5}=0 in K₂(ℚ₂) since −1=2²−5·1² | true; probe closes nothing |
| H3 `moore_normResidue` | w=1 (𝔽₂((t))); ℚ₅, w=4; equal characteristic | w=1: ZMod 1, torsion 0; K₂/w ≅ H²(E,μ_w^⊗2) ≅ ℤ/w and torsion ≅ K₂/w; hwu holds since p∤q−1 | true; Steinberg descent is `localSymbol_kummerClass_eq_zero_of_add_eq_one` |
| H4 `localMilnor_uncountable` | n=1,2,≥3; k((t)) | n=1: E× uncountable; n=2: Moore kernel; n≥3: K-book VI.7.1 (KBOOK line 30922, p.507) | true |
| H5 `localMilnor_uniqueDivisible` | n=3; n=2 control; char p | Kₙᴹ/ℓ=Hⁿ=0 for n≥3; Kₙᴹ/p ⊂ Ωⁿ_E=0 for n≥2, no p-torsion; n=2 has μ(E)≠0 | true; hn needed |
| §0.4 localization, realization | Tₖ; Φₚ(Ω∞₀Hℤₚ) | π₀Tₖ=π₋₁Tₖ=ℤₚ (ψᵏ=1 in weight 0); Bousfield Theorems 2.1, 2.3 on printed p.3 | holds; DM not read |
| §1.1 coefficients, products | K(𝔽₃)/2; ℤ; 𝔽₅ | πₙ(K(𝔽₃)/2): 2·id=i(η·1)∘j, i[−1]≠0 in π₁=ℤ/2; K₂(ℤ;ℤ/2)=ℤ/4 (KBOOK line 16333) | holds |
| §1.2 Bott classes | ℤ, m=2; 𝔽₅, m=4 | 2β₋₁={−1,−1} (KBOOK lines 16544–16548, p.284); additivity unless m≡2 mod 4 (line 16361, p.281) | holds |
| §1.8 étale Chern maps | 𝔽₇, m=3; n=9 | κ(2)(Frob)=2²=4; reduction 2↦2≠0, inclusion 2↦2³=1; c₂₁=−c₁₁c₁₀ (WEIBELCHERN line 533); i(c(Nx)−Nc(x))=0 (line 979) | holds |
| §2.5 e-invariant | ℚ₃; 𝔽₂((t)) | K₁(ℚ₃){2}=ℤ/2, K₁(ℚ₃;ℤ₂)=ℤ₂⊕ℤ/2; W_i^(ℓ) order (q^i−1)_ℓ; KBOOK line 28322 (p.468) | holds |
| §3.1 norm-residue map | ℚ₅; ℚ₂; ℚ₂(ζ₃) | (5,2)₄=ω(2), (2,5)₄=ω(3); h{−1,−1}=−1, tame value 1; w=6: π₃h=(cubic)², 2·2≡1 mod 3 | holds; R02 |
| §3.2 tame coordinate | 𝔽₅: (r,s,u,v)=(0,1,2,1), (−1,1,2,3) | τ=2, swap 3; −1·2·3=−1; K-book ∂ᵥ{π,u}=ū (KBOOK line 13471), so ours is its inverse | holds |
| §3.4 divisibility | F=𝔽ₚ(y)⊂𝔽ₚ(x); 𝔽ₚ(s,t) | [E:Eᵖ]=p ⇒ Ω²_E=0 ⇒ K₂(E)/p=0; KBOOK lines 14614 (p.253), 13711 (p.238) | holds |
| §4.0 foundations | trivial Hℤ; ℂ(j) | π₀: hfp ℤ, Tate ℤ/p; dim ℂ(j)^{C_{p^a}}=1 iff p^a∣j; V.4.2.2 on p.401 (KBOOK line 23994) | holds |
| §4.2 TR, F, TC | W₂(ℤ), p=3; 𝔽ₚ | R[2]=2, F[2]=8; R−F=0 on ℤ/pⁿ→ℤ/pⁿ⁻¹: kernel ℤ/pⁿ, cokernel ℤ/pⁿ⁻¹; HM97A line 924 | holds |
| §4.3 Connes operator | (2.1.1), (2.1.2) | HM03 lines 1133, 1154 (pp.31–32); dd=dη=ηd line 1161; HESS96 line 389: (1.4.4) on p.9 | holds |
| §4.5 Tate differentials | C₃ on 𝔽₃; C₅ on ℤ | Ĥ⁰(C₅,ℤ)=ℤ/5, Ĥ⁻¹=0; HM03 Proposition 4.4.1 at line 2607, p.71 | holds; locator R01 |
| §5.1 TC⁻, TP of 𝔽ₚ | degrees ±2 | φ(ũv)=v⁻¹·pv=p; can−φ a unit off degree 0; TC₀=TC₋₁=ℤₚ | holds; locator R01 |
| §5.2 ghost criteria | p=2 over ℤ; 𝔽ₚ[t]/t² | (V(1)−[−2])/2 has ghosts (1,−1,−7): −7≢−1 mod 4, fails at n=3; V(t): ghosts 0, pW₂={(0,aᵖ)} | holds |
| §5.14 Bott multiplication | p=5, ℚ₅(ζ₅), n=1 | (a,r,d)=(0,1,1): χ=−1+1=0, d=1<B₁=5; χ change a′e−e/(p−1)+r′−r=0; HM03 lines 3490–3700 | holds |
| §6.3 cyclotomic invariants | ℚ₂, ℚ₃, unramified L | w₂^(2)(ℚ₂)=8, w₆^(3)(ℚ₃)=9; unramified: 8, 3, 1 for p=2, 3, ≥5 | holds |
| §6.7 completed groups | ℚ₂, ℚ₃, ℚₚ | ℚ₂: ℤ/2, ℤ₂⊕ℤ/8, ℤ/8, ℤ₂⊕ℤ/2; ℚ₃: 0, ℤ₃⊕ℤ/3, ℤ/3; K₁₁=ℤ₃⊕ℤ/9; KBOOK lines 31092–31097 | holds |
| §6.8 integral groups | ℚ₂ i=2 ν=1; ℚ₃ i=3 | RΓ(L,ℤₚ(i)) splits over ℤₚ, so H¹(ℤ/p^ν(i))=H¹/p^ν⊕H²[p^ν] for every ν: (ℤ/2)³; ℤ/3⊕0⊕ℤ/3 | holds |
| §6.11 equal characteristic | 𝔽₃((t)), 𝔽₂((t)) | K₂=U₂⊕ℤ/2, K₃=U₃⊕ℤ/8; 𝔽₂((t)): K₂=U₂; GH06 lines 90, 579, 705 (pp.3, 16, 19) | holds |
| §6.12 homotopy type | ℚ₃; ℚ₅(ζ₅) | k=g, g⁴; v₅(g⁴−1)=1; v_p(kⁱ−1)=a+v_p(i) iff r∣i; π₂ᵢ₋₁=ℤₚ^d⊕ℤ/w_i for i≥2 | holds |
| §7.6 semilocal map | ℚ(i), p=5; −1 | 2+i ↦ 4 and 0 at i↦2, 3; norm 5; −1∈μ₄ dies in ℤ₅×(1+5ℤ₅)^∧; KBOOK line 31189 (p.511) | holds |

- Source locators checked against the text: about 115, mostly in KBOOK and HM03 (about 45 each), the rest in HANDBOOK, WEIBELCHERN, HESS05, HM97A, GH06, HESS96, CMM, BOUSFIELD, HAINE, JANNSEN, SOULE, Huber–Wildeshaus, Huber–Kings and MILNE. Mismatches: R01.
- Library declarations: all 96 library names in the README located at the pins; opened Tau Ceti `NumberTheory/ClassFieldTheory/Local/Symbol.lean` lines 207, 320, 339–358, `Brauer/RootsOfUnity.lean` line 89, `Algebra/Category/ModuleCat/Tower/Padic.lean` line 141. No Milnor K-theory, K₂ of a field or maximal divisible subgroup exists at the pins.
- Cross-roadmap citations resolved at main or the open head: about 95 section ids in 30 roadmaps; the 10 new since the previous head read in full (ClassicalArithmeticCompletion §§1.14, 1.44; EllipticCohomology E2.1–E2.2; BordismFormalGroups F6.1; ReductiveGroupsPartII RG2.3.7; DeformationAndDerivedPatchingAlgebra §1.10; StableHomotopyKTheory §7.33). All exist and state what is cited.
- `Suggested.lean`: elaborates, `sorry` the only warning (5 theorems). The 8 elaborated signatures were compared with the README statements; no binder lost, nothing changed. One-tactic probe (`simp`, `rfl`, `infer_instance`, `aesop`): closes none.
- Gate: every check passed. Dependency check: "depcheck: 238 roadmaps, 2156 edges, 0 problem(s)". No change outside the roadmap folder.
- Pull-request text: title, summary block and prose read against the head; no sentence contradicted (five theorems on three definitions, the 11 open suppliers, RG2.3.7, the excluded moduli).
- Overlap check: read ArithmeticKTheory, SchemeKTheoryOperations, RefinedTraceMethods, K2SymbolsBrauerPartII, K2SymbolsBrauer, BordismFormalGroups, EllipticCohomology, ClassicalArithmeticCompletion; owners: Milnor ring, residues, norms — K2SymbolsBrauer; Chern classes from higher K — SchemeKTheoryOperations §7.3a; local norm-residue symbol and its cohomological comparison — ClassicalArithmeticCompletion §§1.14, 1.44; Bousfield localization — BordismFormalGroups F6.1; height-one KU with its ℤ_p× action — EllipticCohomology E2.1–E2.2; local K-groups, Moore's theorem, Bloch complexes, genuine and logarithmic trace theory — this roadmap (cited as supplier by ArithmeticKTheory, K2SymbolsBrauerPartII, RefinedTraceMethods). No object has two owners.
- Source independence: 16 passages compared with 8 sources, none shared beyond formulas and standard names; largest share KBOOK, 79 of about 320 citations (HM03 72); contents compared with KBOOK and HM03: independent (Layer 3 ↔ III.6 follows Layers 1–2 ↔ IV.1–2; §4.5 ↔ HM03 §4 precedes §4.6 ↔ §1.3; §5.6 ↔ §3.4 precedes §5.7 ↔ §2.3). DM was not read.

## Not verifiable

- DM (§§4.7–4.18 pp.15–17, Proposition 5.7 p.20; sampled §0.4): the DOI resolves to a host in no licence class; the README's link is a ResearchGate page; no copy in the sources cache.
- DFM, Baker, Eilenberg–Moore: no copy in the sources cache; outside the sample, not fetched.
- Stacks tags 040Q and 07GC: not in the sources cache; the tag numbers were not checked against the site.

## Source issues

- **Gap** in KBOOK at Example III.6.2.3, p.233: the source says any x with (ζ,x) nontrivial makes ζ^i ↦ {ζ^i,x} a section of the norm residue symbol; it should be an x with (ζ,x) = ζ, since a nontrivial value need not generate μ_m for composite m; affects the proof.
- **Error** in WEIBELCHERN at the proof of Proposition 5.1, p.24: the source says ζβ^(i−1) generates K_(2i−1)(F;ℤ/q) and c₁₁(ζ)⊗ζ^(i−1) generates H¹, for ζ a primitive q-th root; it should be a generator a of F×/F×^q in place of the first ζ (for 𝔽₅, q=2, ζ=−1 is a square); affects the proof.
- **Error** in KBOOK at Proposition V.6.10, p.415: the source says K_*(E;ℤ/m) is free over ℤ/m[β] on 1 and z; it should be free on 1, ζ, z, ζz, since the odd classes ζβⁱ of the residue field survive when m∣q−1; affects a stated result.

## For the human reviewers

- Licence: README References link DFM and DM to ResearchGate uploads (lines 1759–1760) and Levine and the K-book errata to web.archive.org copies (lines 1748, 1750). Whether these copies are author-authorised was not checked.
- Licence: the HANDBOOK chapter was read from a web.archive.org copy of the K-theory Handbook file on faculty.math.illinois.edu.
