# Review of PresentationsOfMonoidalCategories (pull request #2308 at d41aee9)

**Verdict:** needs changes

## R01 (P1) — R-symbol extraction admits a false instance

**Location:** `TauCetiRoadmap/PresentationsOfMonoidalCategories/Suggested.lean:161`, `existsUnique_rSymbols`: “A braiding on `C` gives exactly one `RSymbols P`”.
**Claim:** A fusion basis and `_hP` suffice, without the split-family and unit hypotheses of README §2.2.
**Witness:** In finite ℤ-graded ℚ-vector spaces with Koszul braiding, take `S_u=ℚ[1]⊕ℚ[2]`, `N=1`, `F=1`, `φ(e₁⊗e₁)=e₂`. Triple products vanish; `_hP` is `0=0`. Extraction forces `R=−1`; the singleton hexagon requires `−1=1`.
**Repair:** Give `existsUnique_rSymbols` the same `_hS`, `_horth`, `_hdec`, `e`, `_hl`, `_hr` hypotheses as `existsUnique_fSymbols`, keeping `_hP`. This signature elaborates at the pins. The counterexample fails `_hS` (`End S_u=ℚ×ℚ`) and admits no such `e`. Add it as a negative-control Check in §4.2.

## R02 (P1) — The pivotal Check loses solutions over rings

**Location:** `TauCetiRoadmap/PresentationsOfMonoidalCategories/README.md:103`: “the pivotal condition gives `t_1 = ±1` … so both pivotal structures are spherical.”
**Claim:** For the stated commutative-ring generality, the C₂ example has exactly those two pivotal structures.
**Witness:** Set `R=ℤ/8`, `ω=1`, `t_1=3`. Then `3²=1`, `3⁻¹=3`, and both dimensions are `3`, but `3≠1,−1`. The four solutions are `1,3,5,7`.
**Repair:** Replace with: “The pivotal structures are indexed by `t_1 ∈ Rˣ` with `t_1²=1`; each is spherical, with both dimensions `ω t_1`. Over `ℤ` these are `±1`; over `ℤ/8` they are `1,3,5,7`.” The stated ℤ/8 counterexample was also checked in Lean.

## R03 (P2) — The Fibonacci unitary gauge needs a larger field

**Location:** `TauCetiRoadmap/PresentationsOfMonoidalCategories/README.md:106`: “unitary gauge over `ℚ(√5)`”.
**Claim:** The Fibonacci F-matrix can be unitary with its entries in this real quadratic field and its displayed diagonal entry `a=φ⁻¹`.
**Witness:** Unitarity of its two-entry first row forces the other entry `b` to satisfy `b²=1−a²=a`. The conjugate of `a` is `−φ<0`; hence `a` is not a square in `ℚ(√5)`.
**Repair:** Replace “unitary gauge over `ℚ(√5)`” with “the gauge over `ℚ(√5)` having `F^{τττ}_τ=[[a,a],[1,−a]]`, where `a=φ⁻¹`”. Its inverse is itself, its indicated scalar remains `a`, and all 50 admissible pentagon components agree. Keep the Galois-conjugate example in this gauge.

## R04 (P3) — Definitions lack their API and discriminating Checks

**Location:** `TauCetiRoadmap/PresentationsOfMonoidalCategories/README.md:164`, §0.2: “Relabeling and base change”.
**Claim:** Each definition has an API and at least three discriminating Checks.
**Witness:** §0.2 supplies only the two operation names and a Needs line: no identity/composition/compatibility API and no Check involving either operation. The three Layer 0 Examples concern different statements.
**Repair:** Add prose API bullets for identity and composite relabelings, identity and composite scalar maps, and their commutation. Give each operation three computed Checks. Include C₃ inversion on asymmetric data with `F^{121}_1=2` and `F^{212}_2=1/2` (the entries exchange), reduction `−1↦1` under `ℤ→𝔽₂`, and scalar inclusion `−1↦−1` under `ℤ→ℤ[i]`; retain inverse-matrix checks. Apply the same per-definition API/three-Check requirement to the symbol structures, model, gauges, rotation and double dual; layer-wide examples do not replace it.

## R05 (P3) — Result locators are absent or point before the formula

**Location:** `TauCetiRoadmap/PresentationsOfMonoidalCategories/README.md:164`, §0.2, and lines 80, 193, 200, 283, 298, 334, 339, 345, 365, 409.
**Claim:** The sampled results have exact source locators supporting their statements.
**Witness:** Ten sampled targets have no result locator. The gauge citation says “§E.6, p. 89”; its transformation and redundancy formulas occur at Kitaev2006 lines 5190–5236, §E.6.1, equations (239)–(242), pp. 90–91.
**Repair:** Attach locators to each result, including extraction and classification. For the model use Kitaev2006 Definition E.17, pp. 96–97, and §E.7.2, (259)–(262), p. 99; for gauge use §E.6.1, (239)–(242), pp. 90–91; for braidings use §E.3, (207) and Fig. 20, pp. 80–81; for duality use §E.2, (186), p. 74; for traces use EGNO2015 Definition 4.7.1, pp. 73–74. Explicitly identify the ring extensions as derived targets and give their algebraic routes: these sources' field/unitary hypotheses do not establish arbitrary-ring versions by citation alone. For §0.2 cite the defining polynomial identities and explain entrywise scalar transport.

## R06 (P3) — The acceptance test retains unused API declarations

**Location:** `TauCetiRoadmap/PresentationsOfMonoidalCategories/Suggested.lean:91`, `FSymbols.ext`, and line 94, `FSymbols.map`.
**Claim:** These declarations are headline results or definitions needed to state one.
**Witness:** Neither extraction signature, at lines 147 and 161, mentions `ext` or `map`. `ext` is the inverse-uniqueness API; `map` implements entrywise base change. The README's headline list at lines 13–16 contains neither.
**Repair:** Delete them from `Suggested.lean`. Keep inverse uniqueness and base-change API in the README. A proved auxiliary implementation does not meet the rule that definitions are retained only to make a headline statable.

## R07 (P3) — Headline names and layer markers are not synchronized

**Location:** `TauCetiRoadmap/PresentationsOfMonoidalCategories/README.md:238`, §2.2, and line 339, §4.2; `TauCetiRoadmap/PresentationsOfMonoidalCategories/Suggested.lean:135`.
**Claim:** README and acceptance test identify the same named headlines in README layer order.
**Witness:** Neither `existsUnique_fSymbols` nor `existsUnique_rSymbols` occurs in the README. The Lean file has only a Layer 2 section comment, so Layer 0 data are unmarked and Layer 4 extraction sits under Layer 2.
**Repair:** Name `existsUnique_fSymbols` in §2.2 and `existsUnique_rSymbols` in §4.2. Insert `/-! ## Layer 0: the data -/` before the structures and `/-! ## Layer 4: braidings -/` before R-symbol extraction; retain the Layer 2 marker before F-symbol extraction.

## R08 (P3) — The downstream layer citation is stale

**Location:** `TauCetiRoadmap/PresentationsOfMonoidalCategories/README.md:439`: “Layers 1, 6, 7 and 8 there use `FSymbols`, `RSymbols`”.
**Claim:** OcneanuRigidity's cited Layer 1 is the consumer of symbol deformation theory.
**Witness:** Pull request #2316, `TauCetiRoadmap/OcneanuRigidity/README.md:372`, puts formal rigidity of F- and R-symbols in Layer 5; its Layer 1 constructs the relative centre and averaging maps.
**Repair:** Replace the bullet with: “OcneanuRigidity, Layers 5–8, consumes the F- and R-symbols, base change, model, gauge action and rigidity criterion developed here.”

## Verified sound

Previous findings at `48aa9d7`, checked individually: R01 partly repaired—Lean lines 147 and 161 now state “Extraction” and “Extraction of R-symbols”, but R01 above refutes the latter signature; R02 repaired—“**Summary.**”, numbered subsections, “Examples”, “Dependencies” and “Downstream consumers” are present; R03 repaired—the three named declarations were deleted; R04 repaired—§2.2 and §2.3 say “For nontrivial `R`”; R05 repaired—“These fix the duality conventions”; R06 repaired—“free of finite rank in each degree”; R07 repaired—the description names both “ring-level dual-basis results” and “ring-level `Vec^ω_G`”, and the added Lean file.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Fusion rules, unit indices (§0.1) | Singleton; empty labels; C₂ | Singleton: `N=1`, both indices `0`; empty labels cannot supply `u`; C₂: `N_{01}¹=N_{10}¹=1` | Consistent | API/Checks: R04 |
| Left and Right indices | C₂ and Fibonacci, `a=b=c=d=τ` | C₂ admissible block: `1=1`; Fibonacci: `ΣN·N=2=2`, indices `(1,0,0),(τ,0,0)` | Consistent | none |
| Fusion/splitting basis convention | Two copies of one simple | `ψ₁φ₁=1`, `ψ₁φ₂=0`; `φ₁ψ₁+φ₂ψ₂=I₂` | Correct direction | none |
| F defining equation | C₃ coboundary, triple `(1,2,1)` | `ω=1/2`, `F=2`; coefficient identity `1=2·(1/2)` | Correct inverse convention | none |
| Composite rule | Scalar maps `s₁=2`, `s₂=3` | `M(s₁s₂)=1/6=(1/2)(1/3)` | Agrees | none |
| Pentagon | C₂, four odd labels, `ω=−1` | Left `1·1=1`; right `(−1)·1·(−1)=1` | Agrees | none |
| Pentagon, multiplicity-free two-channel case | Corrected Fibonacci gauge | All 50 admissible components: `LHS−RHS=0`; nontrivial block squares to `I₂` | Agrees | R03 |
| Triangle and normalization | C₂, middle unit | `F^{101}_0=1`; zero-dimensional channels have no indices; unit normalization at `(u,u)` gives `λ_𝟙=ρ_𝟙` | Agrees | none |
| R defining equation | Super odd line | `β=−1`, `R=−1`; `1=(−1)(−1)` | Correct direction | none |
| Forward hexagon | C₂, three odd labels | Left `ω²=1`; right `r²ω`; `ω=−1` gives `r²=−1` | Semion values `±i` | none |
| Reverse hexagon | Same instance | Left `ω⁻²=1`; right `r²ω⁻¹`; again `r²=−1` | Agrees | none |
| Symbol extensionality | Two inverses of F | `B=B(FC)=(BF)C=C`; proof fields contribute no choices | True API, not headline | R06 |
| §0.2 relabeling | C₃ inversion | `N_{11}²=1=N_{22}¹`; unit `0↦0`; composing inversion twice returns `(1,1,2)` | Agrees | R04, R05 |
| §0.2 scalar transport | `ℤ→𝔽₂`, C₂ nontrivial F | `F=−1↦1`, `F⁻¹=−1↦1`; product `1↦1` | Agrees | R04–R06 |
| §0.3 associativity | Fibonacci; zero ring | `ΣN_{ττ}^eN_{eτ}^τ=2=2`; over zero ring, matrices of unequal sizes can both multiply to identity | Nontriviality necessary | none |
| §0.3 commutativity | `Vec(S₃)`, `a=(12),b=(23),c=ab` | `N_{ab}^c=1`, `N_{ba}^c=0`; no invertible `1×0` matrix over ℚ | Correct obstruction | none |
| Zero-ring model control | C₂ versus Fibonacci fusion rules | Both Hom modules `0`; all objects isomorphic; multiplicities `N_{xx}^x=0` versus `1` | Classification excluded correctly | none |
| §1.1 model | One grade, ranks 0, 1, 2 over ℤ | `End(0)=0`, `End(1)=ℤ`, `End(2)=M₂(ℤ)`; cross-grade Hom `0` | Correct finite-free carrier | R04, R05 |
| §1.1 biproducts | Ranks 1 and 2 in one grade | Rank `1+2=3`; three inclusion/projection products sum to `I₃` | Agrees | none |
| §1.2 tensor product | C₂, grade ranks `X=(1,2)`, `Y=(3,1)` | Tensor ranks `(1·3+2·1,1·1+2·3)=(5,7)` | Agrees | R05 |
| §1.2 associator/monoidal constructor | C₃ `(1,2,1)` | `α.hom=1/2`, `α.inv=2`; both composites `1`; F entry `2` | Agrees with row-source Mat | R05 |
| §1.3 derived unit identities | Fibonacci, `F^{uττ}_τ` | Sole nonempty unit block `1`; both unitor composites `1` | EGNO Prop. 2.2.4 applies | none |
| §1.3 additive base-change functor | Multiplication by `2`, `ℤ→𝔽₂` | Matrix `2↦0`; `1+1↦0=1+1`; object rank remains `1` | No flatness needed | none |
| §1.3 Grothendieck ring | One grade over ℤ; zero ring | Nontrivial case `[R²]=2[R]`, ring ℤ; zero-ring case every object zero, group `0` | Agrees | none |
| §2.1 split simple families | ℤ-free model; real C₃ rotation representation | Model `End(s)=ℤ`, orthogonal Hom `0`; rotation `End=ℂ`, real dimension `2≠1` | Hypothesis discriminates | none |
| §2.2 F extraction headline | One-grade finite-free category; C₃ coboundary | Standard basis gives `F=1`; C₃ triple gives uniquely `F=2` from `1=F/2` | Matches normalized signature | R05, R07 |
| §2.3 reconstruction headline | One grade; rank 2 | Model Hom matrices and reconstructed Hom both `M₂(R)`; object returns `R⊕R` | Consistent | R05 |
| §2.3 round trip | C₂ over ℤ; zero coefficients | Standard extraction returns `F=−1`; zero ring gives `finrank=0≠N_{uu}^u=1` | Nontriviality now explicit | none |
| §2.4 abelian comparison, both directions | Finite-dimensional k-vector spaces; ℤ-free model | Over k: one simple, `finrank End=1`; over ℤ: `2:ℤ→ℤ` mono/epi, no inverse | Field boundary correct | R05 |
| §2.4 fusion coefficient Check | Three-dimensional A₄ simple | Character multiplicity `(27−3)/12=2=N_{33}³` | Agrees | none |
| Gauge transformation convention | C₃, gauge `g(1,2)=2`, others 1, initial F=1 | At `(1,2,1)`, `G_L=2`, `G_R=1`, so `F'=2` | Agrees | R05 |
| §3.1 gauge group/action headline | Same gauge followed by its inverse | `2·(1/2)=1`; transformed F `1→2→1`; normalized unit blocks stay `1` | Invertible action | R04, R05 |
| §3.2 classification headline | Nontrivial `R=k×k` | `End X≅R` forces `Σn_a²=1`, hence precisely one `n_a=1` | Label recovery works over rings | R05 |
| §3.2 linearity boundary | Fibonacci and conjugate | `s_τ=a` versus `−φ`; both self-dual and gauge-invariant, `a≠−φ` | Semilinearity is insufficient | R03 |
| §3.3 identity automorphisms | C₂ over ℤ and ℤ/8 | Character equation `η₁²=1`; solutions respectively `{±1}` and `{1,3,5,7}` | Ring formula correct | R02, R05 |
| §3.3 autoequivalences/kernel headline | C₂ over ℤ, `g^{11}_0=−1` | Gauge fixes F; every `∂η` has `η₁²=1`; `−1≠1` | Nontrivial quotient element | R05 |
| §3.4 Vec comparison | C₃ coboundary; nonabelian S₃ with ω=1 | C₃ `F=2`, supplier `α=1/2`; S₃ triples each have one admissible output, `F=α=1` | Same conventions | none |
| §3.4 free/projective boundary | `R=k×k`, projective `k×0` | Component ranks `(1,0)` differ; not finite free, so excluded from model subcategory | Restriction necessary | none |
| §4.1 braiding headline | C₂ semion, `r=i` | `β.inv=i`, `β.hom=−i`; inverse product `1`, double braiding `−1` | Not symmetric | R05 |
| §4.2 extraction, README hypotheses | C₂ finite-free super model | Odd block `φ=1`, `β=−1`, unique `R=−1`; unit blocks `R=1` | Prose case holds | R05, R07 |
| §4.2 extraction, actual Lean headline | `S=ℚ[1]⊕ℚ[2]` with Koszul braiding | Eight triple basis inputs: `L=0=R`; forced scalar `−1`; hexagon sides `−1` and `1` | False | R01 |
| §4.3 braided gauge/classification headline | C₂ over ℤ, `g^{11}_0=−1` | `R'=gRg⁻¹=R`; kernel gauges again have `η₁²=1` | Same quotient control | R05 |
| §5.1 rigidity criterion headline | C₃ `s₁=1/2`; rescaled evaluation/coevaluation | With `x=1,y=2`, both zigzags `xy s₁=1`; with `y=1`, both `1/2≠1` | Unit criterion discriminates | R05 |
| §5.1 zero-ring boundary | Zero coefficients | `s=0=1`, unique unit; both zigzags `0=𝟙` | Correct degenerate case | none |
| §5.2 rigidity of sums headline | Two copies of a self-dual simple | Diagonal contraction gives `I₂`; off-diagonal terms `0` | Biproduct supplier applies | none |
| §5.3 converse headline | Untwisted `Vec(S₃)`; idempotent monoid `{u,x}`, `x²=x` | S₃ dual `g⁻¹`, `N_{g⁻¹g}^u=1`; monoid x has no unit channel, hence no dual | Both directions discriminated | none |
| Duality-scalar equality | C₃ coboundary | `F⁻¹(1,2,1)=1/2=F(2,1,2)` | Agrees | none |
| Rotation matrix | C₃ channel `(1,1,2)` | `s₂⁻¹·ω(2,1,1)·ω(2,2,1)=(1/2)·1·1=1/2` | Agrees | R04 |
| Double-dual matrix | Same channel | Prefactor `64`, three rotations `(1/2)³`; `D^{11}_2=8` | Agrees | R04 |
| Duality rescaling | C₃, `φ^{21→0}↦2φ`, others fixed | `s₁:1→2`, `s₂:1→1/2`; `D^{11}_2:1→1/8` | Matches stated ratios | none |
| §6.1 pivotal classification headline | C₃ coboundary, canonical t | `t₁=1/2`, `t₂=2`, `D^{11}_2=8`; `(1/2)²·8=2=t₂` | Agrees | none |
| §6.1 unit/dual conditions | C₃ and C₂ | `t₀=1`, `t₁t₂=(1/2)·2=1`; C₂ condition `t₁²=1` | Agrees | R02 |
| §6.2 dimensions headline | C₃ coboundary; rank-two sum | `leftDim=1/((1/2)·2)=1`, `rightDim=(1/2)/(1/2)=1`; sum dimensions `2=2` | Matches pinned traces | R05 |
| §6.3 spherical classification headline | C₃ canonical t; nontrivial character ζ₃ | Canonical `t₁²=1/4=s₁/s₂`; twist dimensions `ζ₃⁻¹≠ζ₃` | Both directions discriminated | none |
| C₂ pivotal Check | `R=ℤ/8`, ω=1 | `3²=1`, `3⁻¹=3`; dimensions `3=3`; `3≠±1` | Check false | R02 |
| Fibonacci coefficient field | `a=(√5−1)/2` | Required `b²=a`; conjugation gives `b'²=−φ<0` | No unitary gauge over stated field | R03 |
| Twisting dimensions | C₃ character ζ₃ | `leftDim→ζ₃⁻¹`, `rightDim→ζ₃`; product `1→1` | Agrees | none |
| Canonical representation dimensions | A₄ simple; trivial D(S₃) module | A₄ diagonal trace `1+1+1=3` on both sides; trivial D(S₃) module gives `1=1` | Checks agree | none |
| Acceptance-test auxiliary declarations | `map(id)`; inverse uniqueness | Entry `2→2`; two inverse matrices satisfy `B=BFC=C`; no headline consumes either declaration | Extraneous API | R06 |
| Headline markers/names | Three sorried theorems | Extraction names in Lean `2`, in README `0`; layer markers present `{2}`, required `{0,2,4}` | Form mismatch | R07 |
| Downstream citation | OcneanuRigidity #2316 | Symbol-deformation layer `5`, cited `1`; subsequent consumer layers `6,7,8` agree | Stale locator | R08 |

- Sources: 11 existing locators inspected against 2 legal cached texts; 15 seeded targets inspected, 10 lack result locators (R05); EGNO2015 lines 1589, 1795, 2086, 4010, 4046, 4087, 4165 and Kitaev2006 lines 3660, 3696, 4602, 5190 supply the comparisons.
- Pins: 24 declaration/type witnesses opened, including `Mathlib/CategoryTheory/Monoidal/Category.lean:227`, `Mathlib/CategoryTheory/Preadditive/Mat.lean:504`, `Mathlib/CategoryTheory/Preadditive/HomOrthogonal.lean:75`, `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:141`, `TauCeti/CategoryTheory/Semisimple/Basic.lean:56`, `TauCeti/CategoryTheory/Monoidal/Pivotal/Basic.lean:76`, `TauCeti/CategoryTheory/Monoidal/Pivotal/Trace.lean:97`, `TauCeti/CategoryTheory/Monoidal/Pivotal/Semisimple.lean:100`.
- Cross-roadmap audit: 2 supplier targets resolved at PivotalSpherical #2311 (§3.3, §8.1); its broader ring contracts differ from main and the description explicitly names the revision; `homDual` is a target there, not a missing pinned declaration.
- Dependency output: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; 0 UPWARD/CYCLE lines; 0 changes outside this folder; no second copy on main.
- Gate: every worker check passes at `d41aee9`; direct `lake env lean` elaboration passes with 3 `sorry` warnings and no other warnings.
- Signatures: all 11 `#check @name` types elaborated and compared; 0 section binders lost; R-symbol extraction omits explicit hypotheses instead (R01); repaired signature and ℤ/8 proof elaborate.
- Headlines audited: constructor, extraction/reconstruction/round trip, gauge classification/autoequivalences, braiding/extraction/classification, rigidity/converse, pivotal/dimension/spherical classification; 2 extraction headlines are stated, model-dependent headlines named in the docstring; 3/3 sorried declarations resist `simp`, `rfl`, `infer_instance`.
- Pull-request text: title and 4 prose paragraphs compared with the 621-line addition, 42 added headings and 11 declarations; 0 contradictions or omitted base-to-head removals; the description names both supplier extensions and F/R extraction.

Overlap check: read OcneanuRigidity (#2316), PivotalSpherical (main and #2311), CategoricalOperatorAlgebras and TemperleyLieb; PivotalSpherical owns split-family dual bases, `Vec^ω_G` and abstract pivotal/spherical theory; this roadmap owns F/R models and their classification; OcneanuRigidity owns deformations, CategoricalOperatorAlgebras unitary analytic refinements, and TemperleyLieb diagram presentations/envelopes. No duplicate ownership found.

Source independence: 16 passages compared with 2 sources, no non-formula copying found; largest share EGNO2015, 7 of 11 locators; contents compared with EGNO2015: independent. Layers 0→1→2→3 and 5→6 follow construction, extraction and duality dependencies, not its chapter sequence.

## Not verifiable

- The precise arbitrary-ring extensions at the ten sampled targets without locators cannot be source-certified as written; the cited field/unitary antecedents and the concrete instances above were checked (R05).
- JoyalStreet1993 §§1–2, Kelly1964 Theorems 6–7 and Bonderson2007 Chapter 2 remain settled uncertified manifest entries; their publisher DOI records are the recorded access boundary, and no new requests were made.
- The description's random-fusion-basis numerical runs on Rep(A₄) and Rep(D(S₃)) have no supplied computation artifact; the displayed character and trace values above are independent checks.

## Source issues

- **Error** in EGNO2015 at Proposition 2.6.1(i), printed p. 33: the source says the isomorphism set for fixed induced group homomorphism is always an H¹-torsor; it should be empty unless the two cochains differ by a coboundary, and otherwise an H¹-torsor; affects a stated result.
- **Error** in EGNO2015 at Proposition 4.7.3(3), printed p. 74: the source says quantum traces are multiplicative in a rigid monoidal category; it should be restricted by a scalar-unit or appropriate centrality hypothesis; matrix-category objects E₁₂,E₂₁ give `(1,0)≠(0,0)`; affects a stated result.

## For the human reviewers

- **Licence.** EGNO2015 line 16 identifies the cached text as the author's final version supplied with publisher permission; line 17 reserves redistribution restrictions. Only mathematical statements and locators are used here.
