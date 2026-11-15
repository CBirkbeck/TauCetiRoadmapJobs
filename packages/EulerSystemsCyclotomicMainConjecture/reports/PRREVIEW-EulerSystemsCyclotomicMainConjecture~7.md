# Review of EulerSystemsCyclotomicMainConjecture (pull request #1311 at 3c32836)

**Verdict:** needs changes

Six findings, all P3; none is blocking.

## R01 (P3) — The stated library baseline is not the pin of this head

**Location:** `TauCetiRoadmap/EulerSystemsCyclotomicMainConjecture/README.md:133`: “The library baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.”

**Claim:** Neither revision is the one this head builds against, so the sentence that introduces every “From Mathlib” and “From Tau Ceti” contract names the wrong libraries.

**Witness:** `lake-manifest.json` at `3c32836`: mathlib `rev` `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, TauCeti `rev` `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

**Repair:** Replace the sentence with “The library baseline is the Mathlib and Tau Ceti revisions pinned by the repository's `lake-manifest.json`.” Tested: every declaration the contracts cite exists at those two revisions (counts below).

## R02 (P3) — Two supplier declaration names exist nowhere

**Location:** `README.md:227`: “§1.14 (`normResidueSymbol`, with arithmetic Artin on its first argument …) … §1.55 (Stickelberger's relation, `span_stickelbergerPhi`: …)”; `README.md:1799`: “`normResidueSymbol a b`, with the first argument entering arithmetic Artin.”

**Claim:** Both spellings are presented as declarations of ClassicalArithmeticCompletion. That roadmap states the mathematics in §§1.14 and 1.55 but declares neither name, and Tau Ceti at the pin has neither.

**Witness:** ClassicalArithmeticCompletion on main, `README.md:664` writes the symbol `(a, b)_{F,n}`; `README.md:1788` names no declaration. `span_stickelbergerPhi` occurs only in this README. (`stickelbergerPhi_prime` does exist: `TauCeti/NumberTheory/NumberField/PowerResidueSymbol/StickelbergerPhi.lean:137`.)

**Repair:** Line 227: “§1.14 (the degree-`n` norm-residue symbol `(a,b)_{F,n}`, with arithmetic Artin on its first argument, skew symmetry and norm compatibility)” and “§1.55 (Stickelberger's relation `(Φ(P))=P^γ` with `γ=Σ…`, …)”. Line 1799: “ClassicalArithmeticCompletion §1.14's symbol `(a,b)_{F,p^{n+1}}`, with the first argument entering arithmetic Artin.”

## R03 (P3) — The contract misdescribes where IntegralIwasawaTheory §4.2 gets the disc form of Baker–Brumer

**Location:** `README.md:225`: “That section moves an algebraic number into the exponential disc by a power and takes the disc form of Baker–Brumer from its own supplier; neither step is restated here.”

**Claim:** At its open head, IntegralIwasawaTheory proves the disc form itself, in its §§4.1a–4.1e; §4.2 has no outside supplier for it.

**Witness:** IntegralIwasawaTheory at `72d834e`, `README.md:709`: “Apply `bakerBrumer_expDisc_linearIndependent` of §4.1e in `ℂ_p`”; its *Needs* is “§§4.1 and 4.1e, and Tau Ceti's deep-unit exponential and logarithm”.

**Repair:** “That section moves an algebraic number into the exponential disc by a power and takes the disc form of Baker–Brumer from its §4.1e; neither step is restated here.”

## R04 (P3) — The supplier contracts omit sections and suppliers that the *Needs* lines consume

**Location:** `README.md:216`: “Each supplier below is consumed only through the sections named, and only for the statements those sections make.”

**Claim:** The *Needs* lines cite sections, and whole suppliers, that the contract list does not name. One of them, EllipticCurves Layer 7, is used by no statement of §F.2.

**Witness:** Line 349: IntegralIwasawaTheory §2.0; 878: its §§5.0, 5.3 and DirichletPadicLFunctions §3.1; 1324: its §1.2; 517: EulerSystemsAndKolyvaginSystems §1.1; line 221 names only PadicMeasuresIwasawaAlgebras §4.6 (2406 uses §§4.4, 4.7); 410: EllipticCurves Layer 7.

**Repair:** Add to the contract bullets, with the titles the suppliers use:
- IntegralIwasawaTheory: “§1.2 (circular numbers before intersection with units); §2.0 (finite-coefficient global duality); §§5.0, 5.3 (the canonical Kubota–Leopoldt pseudomeasure and its Dirichlet series, including the pole branch)”.
- EulerSystemsAndKolyvaginSystems: “§1.1 (the fields `K(q)`, `K(r)` and their Galois groups)”.
- DirichletPadicLFunctions: “§3.1 (arithmetic tests and analytic coordinates)”.
- PadicMeasuresIwasawaAlgebras: “§§1.1, 1.3, 1.7 (finite projections, reduction of `p`-adic units, comparison with the completed group algebra); §§2.6, 2.11 (unit measures, dilation pushforward); §4.2 (structure theorem); §4.4 (`muInvariant_add`); §4.7 (growth formula); §5.2 (topological Nakayama)”.
- ClassFieldTheory: “Layer 5 (local Tate duality)”. ProfiniteCohomology: “Layers 7 and 10 (coinduction and Shapiro; cohomology in all degrees)”, and narrow “Layers 5–12” at line 349 to the layers §F.1 uses.
- New bullets for LocalGaloisGroups (Layer 7, Step 1, `padicCompletionUnits`; Layer 0) and LocalFieldsRamification (Layers 0–2).
- Delete “EllipticCurves Layer 7” from lines 410 and 964.

Tested: with these additions every section a *Needs* line cites is in the contract list. The *Dependencies* ranges at lines 969, 974 and 3801 also cover IntegralIwasawaTheory §4.1 and EulerSystemsAndKolyvaginSystems §§2.3, 3.5–3.8, which no target cites: narrow them to the sections consumed.

## R05 (P3) — Three passages refer to something a reader cannot find

**Location:** `README.md:3536`: “see the `χ`-parts node, property `(g)`”; `README.md:1302`: “the smoothing divisor `θ_a = δ_a − δ_1` (the denominator of §F.10)”; `README.md:2274`: “This is the augmentation correction the roadmap asks for.”

**Claim:** No “node” is defined, §F.10 states no denominator and never mentions `θ_a`, and the third sentence describes a request made of the roadmap rather than the mathematics.

**Witness:** Property `(g)` is in §4.1 (line 2474). §F.10 (lines 819–861) contains neither “denominator” nor `δ_a`; the smoothing is IntegralIwasawaTheory §5.0 (its `README.md:741`).

**Repair:** Line 3536: “see §4.1, property `(g)`”. Line 1302: “(the smoothing factor that clears the pole of the pseudomeasure of §F.10; IntegralIwasawaTheory §5.0)”. Line 2274: “These are the augmentation factors of §§2.2–2.3.”

## R06 (P3) — §5.1 and its Lean headline keep `χ(p) ≠ 1`, which the proof given does not need

**Location:** `README.md:3811`: “… with `χ(p) ≠ 1`. Then `|A_L^χ| = [E_L^χ : C_{L,χ}]` (Mazur–Wiles).”; `Suggested.lean:203`: “`(hne : ψ ≠ 1) (hψp : ψ p ≠ 1)`”; `README.md:1712`: “These interfaces are used in Rubin IX Theorem 1.2”.

**Claim:** Step 2 of §5.1 already proves the equality for a character with value 1 at `p`, by §4.26. The statement is therefore narrower than its own proof and than the source, and §0.28 names a consumer that is no target.

**Witness:** RUBIN-ES line 5943 (Theorem IX.1.2, p. 135): equality for every nontrivial even `χ` of conductor prime to `p`. Conductor 5, `p=11`, `χ(11)=1`: both sides 1. `ℚ(√229)`, `p=3`, `χ(3)=1`: `h=3`, `[E:C]=2h`, both 3-parts 3.

**Repair:** In §5.1 delete “with `χ(p) ≠ 1`” from the statement and from line 3818, and add to step 2: “when `χ(p)=1` this applies to `χ` itself”. Cite Rubin, Theorem IX.1.2, p. 135, and Remark III.2.5, p. 36, for that case. In `mazurWiles_classGroup_eq_unitIndex` delete `hψp` (keep it in `kolyvagin_classGroup_dvd`). In §0.28 replace “Rubin IX Theorem 1.2” by “§5.1”.

## Previous findings

- R01 of the review at `9fc63e3` (stale supplier names) — repaired for the names it listed: `characterEigenspace`, `smoothedStickelberger_cast` and `gaussSum_smoothed_descent` no longer occur; line 222 now reads “§0.2 (`cyclotomicClassEigenspace p r i` for odd `p` …)”. Two further names of the same kind are R02 above.
- R02 (three Checks for `V_χ(M)`) — repaired: §4.6 has four Checks (lines 2652–2655), including “`V_χ(ℤ₃)=0` for the trivial action, whereas `V_χ(ℤ₃[C₂])=ℚ₃`”.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.3 distribution, `ℓ∣m` | `m=ℓ=2`; `m=4`, `ℓ=2` | `(1−i)(1+i)=2=1−ζ₂`; `(1−ζ₈)(1+ζ₈)=1−i` | holds; RUBIN-ES line 1601 |
| §0.5 arithmetic Frobenius | `m=7`, `ℓ=2`; `m=3`, `ℓ=2` | `(1+ζ₇⁴)(1−ζ₇⁴)=1−ζ₇`; with `ζ₇²` the difference is nonzero; `(−ζ₃)(1−ζ₃²)=1−ζ₃` | holds; inversion detected |
| §0.6 sign | `ℓ=2`, `m=2` and `m=3` | `N(i−1)=2`, printed formula gives `−2`; `ζ₆−1=ζ₃`, printed gives `−ζ₃` | holds; source error recorded |
| §0.7 conductor one | `ℓ=2,3,5` | `2`; `(1−ζ₃)(1−ζ₃²)=3`; `Φ₅(1)=5` | holds; RUBIN-ES line 1603 |
| §0.11 not torsion | `p=3`, `k=2`; RJW's `c_m` | `N(1−ζ₉)=Φ₉(1)=3≠±1`; `(ξ⁻¹−1)/(ξ−1)=−ξ⁻¹` | holds; RJW-PADIC-L line 3037 |
| §0.17 Euler system | `p=5`, `m=1`, `q=2`; `p=2`, `q=3` | `c̃₂=Φ₁₀(1)=1=5^{1−Fr₂⁻¹}`; `c̃₃=−ζ₃`, norm 1; factor `det(1−Fr⁻¹x∣ℤ_p)=1−x` | holds; RUBIN-ES lines 1607–1611 |
| §0.18 `χ`-components | `ℤ₅` with `ω³`; `ℤ/2` over `ℤ`, sign | `ω(2)³−ω(2)=−2ω(2)`, a unit, so `M^ω=0`; `M^χ=ℤ/2≠0` | holds; RUBIN-ES line 842 |
| §0.20 Frobenius factor | `C₄`, `χ(s)=i`, `u=[1]` | `Sχ(u−s⁻¹u)=(1+i)Sχ(u)`; `1−i` is the wrong factor | holds |
| §0.24 `C_{n,χ}` | conductor 5, `p=3` and `p=5` | `u₀/σu₀=(3−√5)/2=ε⁻²`; index `∣2∣_p⁻¹=1=∣A∣` | holds; RUBIN-ES lines 1659–1672 |
| §0.26 `c_ℚ` | conductor 5; `p=3`, `11`, `5` | factor `1−χ⁻¹(p)`: `2` (unit), `0`, `1` | holds; RUBIN-ES line 1688 |
| §0.28 unsmoothed system | conductor 5, `p=11` | `p`-extended class `0`; `χ`-sum of `b₅` is `ε⁻²` over the real group, `2ε⁻²` over the full one | holds; RUBIN-ES lines 5929–5939 |
| §0.30 local functional (touched by R02) | `p=3`: `r=1`, `ℓ=2`; `m=1`, `n=1` | `x₁=2/3`, `x₂=−1/3=−ℓ⁻¹x₁`; `x₃=ζ₃+3/2`, trace `2=3x₁`; symbol `(ζ₃,2)`: `Ind=1` | holds; source's unscaled restriction fails |
| §0.31 replacement | `q=7`, `p=3`; `T=ℤ_p` | `(1−x)−(1−x/7)=−(6/7)x≡0 mod 6`; `det(1−Fr⁻¹x∣ℤ_p(1))=1−q⁻¹x` | holds; RUBIN-ES lines 6198, 6316 |
| §1.1 error terms | `p=5`, `χ=ω²` | dual residual character `ω⁻²·ω=ω⁻¹`, nontrivial on `Gal(ℚ(μ₅)/ℚ)`, not a character of `Δ=C₂` | holds; RUBIN-ES lines 1571, 1682 |
| §4.13 Kummer duality | `p=5`: `ρ=1`, `ρ=ω²` | `χ=ωρ⁻¹`: `ω`, `ω³`, both odd | holds; GREITHER-1992 lines 718–732 |
| §4.18 (touched by R03) | `m=7`; quartic check | `∣g∣²=8`, `μ(g)=−𝔭`, `B_{1,χ}=−1`; step 8 needs only `(a)`, `(b)` of the supplier's §4.2 | holds |
| §5.1 and `mazurWiles_classGroup_eq_unitIndex` | `ℚ(√5)`: `p=3,5,11`; `ℚ(√257)`, `ℚ(√229)` at 3 | `1=1` three times; `h=3`, `[E:C]=2h`: `3=3` with `χ(3)=−1` and with `χ(3)=1` | holds; hypothesis unused (R06) |
| `kolyvagin_classGroup_dvd` | `ℚ(√5)`, `p=3`; `p=5` (`ψ(5)=0`) | `1∣1`; `ℤ₅ε/ℤ₅ε²` trivial, `1∣1` | holds |
| `relativeClassGroup_lowerBound` | `ℚ(√−23)`, 3; `ℚ(√−15)`, 2; `ℚ(ζ₅)`, 2 | `B=−3`: `3≤3`; `B=−2`: `1≤2`; `N(B/2)=1/10`: `½≤1` | holds |
| `iwasawaLeopoldt_two` | sextic `K⊂ℚ(ζ₂₁)`, `χ=χ₃ψ₇` | `B_{1,χ}=2ζ₃²`, `N(B/2)=1`; `h(K)∣h(ℚ(ζ₂₁))=1`: `1=1` | holds |
| `iwasawaLeopoldt_two_power` | `ℚ(ζ₅)`, `n=2`, `e=1,2`; `ℚ(√−3)`; `ℚ(√−15)` | `2·½=1`; `4·¼=1`; `2·½=1`; `2·1=2=∣A₂∣` | holds |
| §§0.14, 2.2, F.2 (touched by R04, R05) | `m=5`, `a=2,4,6`; `L=ℚ(√6)`, `p=3` | `∣1+ζ₅∣=(1+√5)/2`, `−ζ₅⁻¹`, `1`; `ℚ₃(√6)=ℚ₃(√−3)` since `−2` is a square | hold |

- Previous findings: both repaired (section above).
- Source locators checked against the text: 45, in RUBIN-ES (36), RJW-PADIC-L (3), GREITHER-1992 (5) and SINNOTT-1980 (1); all fifteen sampled targets have their theorem number and page right.
- Library declarations opened at the pins: 60 by file and line (39 Mathlib, 21 Tau Ceti), 20 more by name; all exist. Only `normResidueSymbol` and `span_stickelbergerPhi` are missing (R02).
- Cross-roadmap citations resolved: 127 section citations of the six open suppliers and of PadicMeasuresIwasawaAlgebras, each against that roadmap's head or main; every cited section exists. Every backticked supplier declaration name was searched at its supplier's head; all are there except the two of R02.
- Gate rerun on this head: every check 0, `OK`; the worker's run records `build=0`. Dependency check: `depcheck: 246 roadmaps, 2247 edges, 0 problem(s)`, no UPWARD or CYCLE line. Nothing changed outside the folder.
- `lake env lean` on `Suggested.lean`: five `sorry` warnings and nothing else. `#check @` on all 14 declarations: types as in the worker's signatures; `globalUnitImage` needs only `[Field K]`. One-tactic probe (`rfl`, `simp_all`, `infer_instance`, `norm_num`, `decide`, `aesop`, `omega`, `trivial`, `positivity`) fails on all five theorems.

Overlap check: read IntegralIwasawaTheory, EulerSystemsAndKolyvaginSystems, CyclotomicClassGroupsAndStickelberger, DirichletPadicLFunctions, SelmerIwasawaCohomology and ClassicalArithmeticCompletion; the abelian main conjecture is IntegralIwasawaTheory's (§§6.5, 11.7), proved again here as a shared statement, as both scopes say; the generic Euler-system theory is EulerSystemsAndKolyvaginSystems', its cyclotomic instance is owned here; `cyclotomicClassAction` there is the cyclotomic case of `classGroupTensorAction`, compared in §0.18; Sinnott's Proposition 5.1 and stable index, the `p`-adic class number formula and the Gras formula have no other owner. Nothing has two owners.

Source independence: 11 passages compared with 3 sources, longest shared run 7 words (a ten-word clause in the §1.6 Check, RUBIN-ES line 1712); largest share RUBIN-ES, 81 of 213 locators; contents compared with RUBIN-ES (Chapters I–IX, Appendices A–D): independent. Layer 4's order differs from Greither's and is the one its *Needs* lines force (§4.7 on §§4.3–4.6, §4.12 on §§4.9–4.11, §4.14 on §§4.8, 4.12, 4.13, §4.20 on §§4.14, 4.16, 4.19).

## Not verifiable

- SINNOTT-1980, Introduction, Theorem, p. 182: the scan's OCR drops the display for real fields, so the factor `2^{[k_n:ℚ]}` of §3.3(g) was checked only against IntegralIwasawaTheory §1.8 and the `k=ℚ` Check.
- SpecialValuesBirchTate is neither on main nor an open pull request; the consumption stated in “Downstream consumers” and in the description was not checked.
- The sources outside the seeded sample (SOLOMON-1990, MAZUR-WILES-1984, BELLIARD-DESCENT, COLEMAN-1979, COLEMAN-1981, RUBIN-1988, SHARIFI-IWASAWA, the Gamma-function papers) were not reopened this round.

## Source issues

- **Error** in RUBIN-ES at Chapter III, §2.1, display (2), printed p. 34: the source says the norm of `ζ_{mℓ}−1` is `ζ_m−1` or its Frobenius quotient for every prime `ℓ`; it should be the same value with the sign `−1` when `ℓ=2`; affects a stated result.
- **Gap** in RUBIN-ES at Chapter III, Lemma 1.1, proof, printed p. 33: the source says inflation–restriction through `L` handles the character `χ⁻¹ε_cyc`; it should be inflation–restriction through `L(μ_p)`, since `G_L` acts nontrivially on that residual line; affects the proof.
- **Error** in RUBIN-ES at Appendix D, Lemma 1.1(iii) and Lemma 1.4, printed pp. 164–165: the source says the trace of `DG_{ℓm}` carries a factor `−ℓ`, giving restriction `λ_m∘(−Fr_ℓ)`; it should be the factor `−1`, giving `−ℓ⁻¹λ_m∘Fr_ℓ` (at `p=3`: `x₁=2/3`, `x₂=−1/3`); affects a stated result.
- **Misprint** in RUBIN-ES at Chapter IX, Example 1.1, printed p. 135: the source says the tower is the maximal abelian extension unramified outside `p`; it should be the one unramified at `p`, since the conductors are prime to `p`; affects nothing.
- **Misprint** in RUBIN-ES at Chapter IX, Example 6.2, printed p. 143: the source says the replacement yields an Euler system for `ℤ_p(1)`; it should be one for `ℤ_p`, whose classes and factor `1−q⁻¹x` it has; affects nothing.
- **Error** in RJW-PADIC-L at §10.5, the definition of `c_m`, p. 52: the source says the quotient `(ξ_m⁻¹−1)/(ξ_m−1)` gives the cyclotomic Euler system; it should be a nontorsion element such as a norm of `1−ξ`, since the quotient is `−ξ_m⁻¹`; affects a stated result.
- **Error** in RJW-PADIC-L at §10.5, display (10.7), p. 52: the source says `H¹(F,ℤ_p(1))` is `F^×⊗ℤ_p` for a number field `F`; it should be the inverse limit of `F^×/(F^×)^{p^m}`, which is larger; affects a stated result.

## For the human reviewers

- Licence: GROSS-KOBLITZ-1979 is linked as a scan on a third party's university page (`README.md:3934`, “otherpapers” directory at rochester.edu), neither the publisher nor an author; the host's right to distribute was not settled.
- Licence: RUBIN-ES, 81 of 213 locators, is read from the author draft on the Arizona Winter School notes site (`README.md:3952`); the published text is Annals of Mathematics Studies 147.
- Scope: SHARIFI-IWASAWA (`README.md:3925`) is unpublished author lecture notes, cited five times, all in §F.9, for results that are also in refereed textbooks.
