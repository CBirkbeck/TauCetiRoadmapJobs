# Review of GeneralAlgebraicKTheoryPartII (pull request #1742 at 32c1022)

**Verdict:** needs changes

Previous review (at 76a08ce), finding by finding:

- R01 (James splitting taken from HomotopySpheres): repaired. "### 4.30c The stable James splitting" is an own target with five Checks; §4.33 reads "Apply the reduced stable James splitting of §4.30c"; `HomotopySpheres` no longer occurs in the README; the gate's `dropped` is 0.
- R02 (Layers 7–10 in the order of lmmt §§4.2–4.5): repaired in substance. Former §§10.1–10.5 are §§5.1a and 5.7–5.10, former §§7.4, 7.8, 8.6, 8.7, 8.9 are §§7.10, 7.4, 7.8, 7.9, 7.11, with the table "Former numbering | Present section". Layer 7 now runs lmmt 4.7, 4.8, 4.16/4.18, 4.11, 4.12, 4.14, 4.19, 4.21, 4.9. §§9.6–9.7 were not moved; see the Source independence line.
- R03 (run-in bold targets, stale titles): repaired. `### 9.2`, `### 9.4`, `### 9.5`, `### 9.7`, `### 5.9`, `### 5.10` are headings; every `§k.n (Title)` in a Needs line names its heading, three with an added qualifier.
- R04 (docstrings stating more than the statements): repaired. "`J(W)` is a Hausdorff CW complex in which the stages of the word-length filtration are subcomplexes"; "`J(W)` is a topological monoid."
- R05 (description): repaired. "Owned here are the chromatic groundwork (telescopes to the Bousfield–Kuhn functor) and the James reduced product".
- R06 (§1.2 locator): repaired. "(lmmt line 595, the two remarks opening §3.3, p.1023; …)".

## R01 (P3) — §8.2 lists the chromatic field maps of §6.2 as a need it does not have

**Location:** `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md` line 2263 (Needs of §8.2) and line 2338 (Layer 8 Dependencies): "§§4.27–4.28 and §6.2 (Hahn, height and chromatic field maps)".

**Claim:** The statement or route of §8.2 uses §4.28 and §6.2.

**Witness:** The route of §8.2 uses §8.1, §4.5 and §4.34 only ("Apply §4.34 to B"); cmnn20 line 816 uses the May nilpotence theorem alone. §6.2 needs §6.1a and gap:all-height-morava-realization, so Layer 8 waits on the Nullstellensatz.

**Repair:** Needs of §8.2: "§8.1 (ε-enlargement and descent towers); RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; §4.5 (Finite chromatic localizations); §4.34 (Ordinary-homology detection of the H∞ unit)." Delete "§§4.27–4.28 and §6.2 (Hahn, height and chromatic field maps);" from the Layer 8 Dependencies.

## R02 (P3) — §4.11 needs the later §4.20

**Location:** `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md` lines 851 and 871: "Φ₁Ω∞X≃L_(T(1))X=L_(K(1))X (by §4.20)"; "for the n=1, p odd comparison only, KTheoryFiniteLocalFields §0.4 … and §4.20 (Separation above height one)".

**Claim:** Each target of Layer 4 needs only earlier sections.

**Witness:** §4.11 (line 849) precedes §4.20 (line 1009) and cites it. §4.20's Needs are §4.19, §4.1 and BordismFormalGroups, so the comparison can sit in §4.20 with no cycle.

**Repair:** End the §4.11 paragraph at "…the coherent finite-source formula and the uniqueness statement; its comparison with Φ₁ is in §4.20." and drop the last Needs clause. Add to §4.20: "For p odd, Φ₁ of §4.11 induces on pointed homotopy categories a functor naturally equivalent to `heightOneFromZeroSpace`, compatibly with Φ₁Ω∞X≃L_(T(1))X=L_(K(1))X and Φ_p(Ω∞₀X)≃`heightOneLocalize X`; Φ₁ inverts maps that are equivalences on connected covers, so Ω∞ and Ω∞₀ give the same value.", with Needs "§4.11 (Bousfield–Kuhn functor); KTheoryFiniteLocalFields §0.4 (Height-one localization and realization)". In Scope (line 15) write "which agrees with that functor at n=1 and p odd (§4.20)".

## R03 (P3) — the proof route of §4.8 attributes the hypothesis to the wrong equivalence

**Location:** `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md` line 800: "then use preservation of F-acyclics to see the map from X is also an E-equivalence."

**Claim:** Preservation of F-acyclics by L_E gives the E-equivalence X→P.

**Witness:** E=K(1), F=Hℚ, X=S: L_E L_F S=0, so P=L_K(1)S×Hℚ. S→P is a K(1)-equivalence with no hypothesis, and not a rational one: π₋₁ is 0 against ℚ_p.

**Repair:** "Compare its fiber L_E(fib(X→L_FX)) over L_FX with that of X→L_FX: preservation of F-acyclics makes the map from X an F-equivalence. It is an E-equivalence without any hypothesis, because L_FX→L_E L_FX is one."

## R04 (P3) — the `Monoid` instance has no docstring

**Location:** `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/Suggested.lean` line 90: "instance : Monoid (JamesReducedProduct X x₀) := inferInstanceAs (Monoid (jamesSubmonoid X x₀))".

**Claim:** Every declaration of the file carries a docstring stating the mathematics.

**Witness:** Lines 89–90: a blank line, then the instance. The `TopologicalSpace` instance at line 106 has its docstring.

**Repair:** Add above line 90: "/-- Concatenation of words makes `J(X)` a monoid whose unit is the empty word. -/".

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.3 (sample) | C=Projω(A), X=A; C=0 | hom(A,A)=A by left multiplication, Hom(A,A⊕A)=A²; End=0. lmmt lines 618–619; bgt line 1352 is Theorems 4.22–4.23, p.770 | sound |
| §3.5 (sample) | C=finite-dimensional k-spaces; C=0 | Σν(k) has π₁=k, π₀=0 at k; its loop is ν(k); envelope of 0 is 0. pp lines 1595, 1598, 1642, 1651, pp.34–35 | sound |
| §4.5 (sample) | n=0; H𝔽₃ at p=2 | L₀^fS=Hℚ, L₀^(p,f)S=S[1/2]; S[1/2]⊗H𝔽₃=H𝔽₃, Hℚ⊗H𝔽₃=0. lmmt lines 336–339, p.1017 | sound |
| §4.11 (sample) | X=Hℤ; X=Σ⁻¹Hℚ | Φ_nΩ∞Hℤ=L_T(n)Hℤ=0; Ω∞Σ⁻¹Hℚ=* while X[1/p]≠0. kuhn-guide lines 113–121: (1)–(3), uniqueness from (1),(2) | sound; order R02 |
| §4.34 (sample) | B=H𝔽₂; the E₁ ring K(n) | H𝔽₂: Hℚ and H𝔽₃ give 0, H𝔽₂ gives π₀=𝔽₂. K(n): every ordinary homology 0, K(n)≠0, not H∞. may-nilpotence line 47 | sound |
| §4.35 (sample) | ℤ/4→𝔽₂; upper triangular 2×2 over k | K₀: ℤ→ℤ identity, K₋₁=0 both; K₀=ℤ² for A and A/I=k×k. lmmt lines 862–866 | sound |
| §4.38 (sample) | identity; n=1 | fiber 0, K(id)=id; N=m−1 with m≥2 gives N≥1. lmmt lines 491–494, p.1021 | sound |
| §6.1 (sample) | H𝔽_p; Hℚ; B an 𝔽_p-algebra | heights −1, 0; K(𝔽_p)[1/p]≠0 gives 0≤0; K(ℚ) bound 1; L_T(i)K(B)=0, i≥1, as in §4.42. lmmt lines 162, 813; cmnn24 line 57 | sound |
| §6.7 (sample) | E₁, n=1, 2; H𝔽_q, q≠p, n=1 and n=0 | E₁: nonzero at (1,2), zero at (2,3). H𝔽_q: both zero at n=1; at n=0 rational part 0 but L_T(1)K(𝔽_q)≠0, so n=0 needs p-locality. lmmt lines 175–186 | sound |
| §7.1 (sample) | id on Hℤ; Hℤ⊕ΣHℤ→Hℤ | all fibers 0; rational π₁ is ℚ→0, not 0-nice. Definition at lmmt lines 849–851, p.1029 | sound |
| §7.6 (sample) | n=0 | BP⟨0⟩→E(0) is Hℤ_(p)→Hℚ, a T(0)-equivalence; K-fiber K(𝔽_p), L_T(1)=0. lmmt lines 903–914, p.1030 | sound |
| §7.9 (sample) | A=tmf, i=2, 3, 4 | Tmf at i≥2 (T(1)∨T(2)-equivalence); TMF only at i=3 (tmf→TMF is not a T(1)-equivalence); 0 at i=4. lmmt lines 1002–1005 | sound |
| §8.1a (sample) | A=Hk; A=0; h₀ before localization | [Σk]=−1 from k→0→Σk; Mot=0; π₀Hom(h_Perf(A),h₀)=π₀S=ℤ. cmnn20 lines 629–637, 704–710, 749 | sound |
| §8.4 (sample) | H=1; rank d | X=S gives k, free of rank 1; k-dimension d·\|H\|. cmnn20 lines 1651, 1664, p.37 | sound |
| §9.1 (sample) | Hℤ at p=2 | fiber of K(ℤ)→K(ℤ[1/2]) is K(𝔽₂), L_K(1)Hℤ₂=0. lmmt lines 1056–1061, p.1033 | sound |
| §4.46 Theorem A | A=Hℤ, n=1 | L₁^(p,f)Hℤ=Hℤ[1/p] by §4.9; fiber K(𝔽_p), L_T(1)=0 | sound |
| §5.4 CMNN | n=2 | L₀^(p,f)S=S[1/p]; K(S[1/p])→K(ℤ[1/p]) p-adic equivalence, Mitchell gives 0 | sound |
| §5.5 purity | H𝔽_p, n=1; Hℚ, n=1 | L_(T(0)∨T(1))H𝔽_p=0 and L_T(1)K(𝔽_p)=0; L_T(1)Hℚ=0 but L_T(1)K(ℚ)≠0, so one height does not suffice | sound |
| §6.5 redshift | (H𝔽₂)^tC₂, p odd | R[1/p]=R≠0, T(1)⊗R=0, height 0; 2=0 on K(R), so T(1)⊗K(R)=0, height ≤0≠1; excluded by R⊗Hℚ≠0 | sound |
| §8.3 descent | A→A×A; KO→KU | (1,0)↦1; [KU]=[KO]−[ΣKO]=2[KO], rationally a unit, N=2 | sound |
| §5.10 assembly | G=ℤ; S₃ | ℤ/ℤ terminal in Or_Cyc, identity; S₃ has no cyclic terminal orbit | sound |
| §4.30c | S⁰; S²∪₂e³ | ⋁_(k≥1)S both sides; degree 5: r=2 only, Tor₁(ℤ/2,ℤ/2)=ℤ/2, tensor algebra 0. hatcher lines 20117, 20146, pp.467–468 | sound |
| Lean `existsUnique_lift` | X={x₀,a}; X not Δ-generated | φ(a^k)=f(a)^k forced; φ∘mk is a product of values of f, continuous for the product topology, hence for the finer one | sound |
| Lean `exists_cwComplex`, `continuousMul` | W=S²; W=point | cells in dimensions 0, 2, …, 2r in J_r; one 0-cell; countable CW product is the CW topology | sound |
| Lean James theorems | W=point; w=w₀; W=S⁰ | Moore loops of a point are [0,∞), contractible; s/0=0 gives the length-0 loop, the unit; ℕ against ℤ on π₀, excluded by `ConnectedSpace` | sound |
| §8.2 (R01) | route inputs | §8.1, §4.5, §4.34; §6.2 and §4.28 unused | finding |
| §4.11 (R02) | Needs graph | 4.11→4.20→4.19→{4.3, 4.4, 4.8, 4.17}; no cycle, wrong order | finding |
| §4.8 (R03) | E=K(1), F=Hℚ, X=S | P=L_K(1)S×Hℚ; K(1)-equivalence holds, rational one fails (π₋₁: 0, ℚ_p) | finding |

- Source locators checked against the text: 50 in 9 sources (lmmt 19, cmnn20 11, hatcher 10, pp 4, kuhn-guide 2, and one each in cmnn24, may-nilpotence, bgt, akq). The 15 sampled targets all hold; all ten hatcher locators of §4.30b–c fall on the printed pages given.
- Library declarations opened at the pins: `TauCeti.MooreLoopSpace` (`TauCeti/Topology/PathSpace/Moore.lean` line 608, `Monoid` 660, `ContinuousMul` 666), `ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence` (`…/WeakHomotopyEquivalence.lean` line 355), `TauCeti.CWType` (line 38), `Topology.RelCWComplex` (Mathlib `Topology/CWComplex/Classical/Basic.lean` line 99), `Subcomplex` (line 659), `WithGeneratedByTopology` (`Topology/Convenient/GeneratedBy.lean` line 70). No James construction, Pontryagin product on homology or stable equivalence of spectra at either pin.
- Cross-roadmap citations resolved: KTheoryLowDegrees §§1.1–1.3, 13.1; KTheoryFiniteLocalFields §§0.4, 1.2, 1.6, 6.5a; SchemeKTheoryOperations §§4.12, 5.2, 5.6, 5.7; GeneralAlgebraicKTheory §§13.6, 13.8a–c; AInfCohomology §AI.7.2; PrismaticCohomology §0.65; ModularCurves §7E (through its former-numbering table). Consumers: ChromaticHomotopyTheory and DGFloerPartII cite only §§4.x, 5.2, 5.5, 6.5 and "§8.8", which the table maps.
- Gaps: 21 contracts for the 21 declared slugs, each in its supplier's subsection.
- Gate (the worker's run): every check 0, `build=0`, OK. Dependency check, my run: `depcheck: 240 roadmaps, 2247 edges, 0 problem(s)`. The outside-folder diff is empty.
- Elaboration: `lake env lean` exits 0 with five `sorry` warnings (lines 125, 136, 146, 156, 174) and nothing else. The elaborated types were compared with §4.30b: the seven "dropped" binders are `[TopologicalSpace X]` on purely algebraic definitions; every theorem keeps its hypotheses. The `for` entry and the line-196 error in the signature listing come from the listing, not the file.
- One-tactic probe (`first | simp | rfl | infer_instance`) on a scratch copy: none of the five theorems closes. Headlines: only the James theorem is statable; the module docstring names the others with their missing carriers.
- Description read against the head: no sentence contradicted; the removed supplier and the renumbering are stated.

Overlap check: read ChromaticHomotopyTheory, RefinedTraceMethods, StableHomotopyKTheoryPartII, BordismFormalGroups (main), StableHomotopyKTheory, EllipticCohomology; Layer 4 chromatic interfaces, §6.1a, §6.2: this roadmap (ChromaticHomotopyTheory consumes them); sharp bound m=n+1 and higher norms: ChromaticHomotopyTheory; p-local telescopes with T(0)=S_(p)[1/p]: BordismFormalGroups F6.3 (the global T(0)=S[1/p] variant is here); James–Hopf maps: BordismFormalGroups F6.2; finite Borel norms and the Tate fixpoint lemma: RefinedTraceMethods §§2.1–2.5; circle Tate and Tate orbit lemma: AInfCohomology §AI.7.2; power operation and transfer ideal: StableHomotopyKTheoryPartII §§4.4–4.5; the James reduced product: see For the human reviewers. No other `Suggested.lean`, on main or open, declares `JamesReducedProduct`.

Source independence: 23 passages compared with 9 sources and a shared-run scan of the README against 13 source texts, none shared (longest common run 14 tokens, the formula statement at lmmt line 903); largest share lmmt, 92 of 195 line-anchored locators; contents compared with lmmt: independent, except that Layer 9 keeps the seven results of lmmt §4.4 in order, an order its Needs force (9.1→9.2; 9.3→9.4→9.5; 9.1 and 6.5→9.6→9.7).

## Not verifiable

- `james` (Annals of Mathematics 62, 1955): settled as uncertified; the James equivalence was read at hatcher line 20284 instead.
- Locators outside the sample and the passages above were not reread this round.
- The open revisions of BordismFormalGroups (#1807, #1808) are not among the listed checkouts; it was read on main.
- The description's sentence on review rounds and tools has no counterpart in the folder.

## Source issues

- **Misprint** in lmmt at Remark 3.11, printed page 1026: the source gives the stabilised relative K-theory colimit of the split square-zero extensions of S by Σ^rM as ΩM; it should be ΣM, since relative K₁ of ℤ⊕A is 1+A; affects nothing.
- **Error** in akq at §2.1, manuscript p.5: the source identifies the Thom spectrum of the sign map on Ω² of the 3-connected cover of S³ with Hℤ integrally; it should be Hℤ_(2) after 2-localization, the map being null at odd primes; affects nothing.

## For the human reviewers

- HomotopySpheres is on main and on the never-cite list; its §§3B.1–3B.6 plan the James construction and splitting, and its README line 3308 names this roadmap as consumer. §§4.30b–4.30c and the 12 Lean declarations plan the same objects. Which roadmap owns them?
- `lmmt`, `mitchell` and `hopkins-smith` are read from a third party's university page; the `lmmt` copy is the journal PDF, stamped as licensed to that university (lmmt line 151).
- `hatcher`, `cmnn20`, `mil81` and `weibel` are read from authors' pages; `james` is cited by locator only.
