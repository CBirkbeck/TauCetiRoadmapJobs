# Review of ArithmeticGaloisRepresentations (pull request #856 at 682bd29)

**Verdict:** needs changes

## R01 (P1) — The perfect-residue ramification supplier is absent on main

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:381`, also :2483 and `Suggested.lean:26`: “LocalFieldsRamification §§3a.1–3a.3 and 4a.1–4a.3 supply”.

**Claim:** The entire conductor layer imports arbitrary-perfect-residue Herbrand theory, finite-separable transition functions and completed maximal-unramified comparison from these sections.

**Witness:** At main `c994070`, `TauCetiRoadmap/LocalFieldsRamification/README.md:705` and :1132 start Layers 3 and 4. Neither README nor Suggested.lean contains the cited 3a/4a sections or `perfectResidueHerbrand`.

**Repair:** Give this general prerequisite a valid earlier owner: an explicit LocalFieldsRamification Part II, or precisely declared supplier gaps with matching plan slugs and README contracts. Do not present an amendment of the existing roadmap as supplied main content. Keep the arbitrary-perfect-residue scope. Test the replacement contract on `k((t))`, `k = F̄_p`, `y^p−y=t⁻¹`: `e=p`, `d=2(p−1)`, eventual `ψ(u)=pu−p+1`. The finite-residue main contract cannot instantiate this example.

## R02 (P1) — All-depth unit reciprocity is not supplied by the cited section

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:400` and :2579: “supplies `map_unitFiltration_normResidue`”.

**Claim:** ClassFieldTheory Layer 7 supplies the image of every unit-filtration step under finite and absolute reciprocity, in both characteristics.

**Witness:** `TauCetiRoadmap/ClassFieldTheory/README.md:1425` on main lists attained conductor minima and the unramified criterion. Its Layer 7 and Suggested.lean have no `map_unitFiltration_normResidue` or all-depth reciprocity theorem.

**Repair:** Own the additional theorem explicitly, or obtain it from a named earlier Part II/precisely declared supplier gap. Keep both characteristics and depth zero. Retest with the quadratic character of `ℚ₂(√2)`: it is nontrivial on `U²`, trivial on `U³`, and has conductor 3. An attained minimum alone does not identify these steps with upper ramification groups.

## R03 (P1) — The six named Weil–Deligne contracts do not exist at the supplying head

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1770`–:1775, :1836 and :1876.

**Claim:** SR.5.2 supplies `wd-linear-substrate`, `nilpotent-exp-log`, `grothendieck-monodromy`, `wd-parameter-operations`, `full-wd-construction` and `wd-frobenius-semisimplification` with the advertised exactness and inverse.

**Witness:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4372` at its original supplying head contains `classical-llc-normalization`, a Frobenius-semisimplified interface. The six cited targets are absent there; the object search finds them only in a separate amendment.

**Repair:** Resolve the actual contract with the earlier supplier, recording any missing part as a precise declared gap. Cite the existing normalization target for what it actually promises. The full, non-Frobenius-semisimplified functor and its inverse need an explicit owner; do not infer them from a semisimplified parameter. Test with unramified `ρ(Φ)=J₂(1)`: the full functor must retain `J₂(1)`, whereas its Frobenius semisimplification has `I₂`. These two outputs cannot supply the same inverse.

## R04 (P2) — LFunctions is a later supplier

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:555`, :2222, :2250, :2300 and :2448.

**Claim:** Layers 0, 5 and 6 of LFunctions are inputs to this roadmap's local-constant/global functional-equation route.

**Witness:** The prescribed dependency check reports `ArithmeticGaloisRepresentations (#42) -> LFunctions (#301)`. LFunctions is a new open roadmap, not an existing main supplier. The complete checker output is recorded below.

**Repair:** Move the consumed Hecke continuation/functional-equation prerequisites to a valid earlier owner, or move the analytic consumer targets to a later Part II while keeping the arithmetic Gauss-sum definitions here. Update the ownership and Needs lines, then rerun the dependency check. Preserve the primitive odd character modulo 4 test: conductor 4, one real gamma shift, root number 1. Merely moving this folder after LFunctions does not resolve the earlier-consumer obstruction reported by the checker.

The other six UPWARD lines involve roadmaps already present on main (ProfiniteProPGroups under Completed). They are not new mathematical upward dependencies when their main contracts are used. They still appear in the supplied failing gate; the revision-dependent additions in R01–R02 cannot use that exemption.

## R05 (P2) — The kernel-field Check needs an open kernel

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1615`: “For a finite-image `ρ`, `IsUnramifiedAt ρ v` agrees with unramifiedness of `v` in the kernel field”.

**Claim:** Finiteness of the image suffices for this identification under Layer 1's general coefficient topologies.

**Witness:** A sign representation into an indiscrete field can have dense kernel and nontrivial inertia at 2. Its fixed field is `ℚ`, unramified at 2, whereas the representation is ramified there.

Here is an explicit construction of the witness. Take the multiquadratic quotient `C₂ × ∏_{i≥1} C₂` of `G_ℚ` from `ℚ(i)` and independent `ℚ(√p_i)`, with distinct primes `p_i ≡ 1 mod 8`. The tail extensions split at 2. Choose a nonzero `F₂`-linear functional `L` on the tail product which vanishes on its direct sum. The functional `(a,x) ↦ a+L(x)` has dense kernel: after any finite coordinate prescription, its value can be changed in the remaining coordinates. Compose it with the quotient map and `a ↦ (−1)^a` into indiscrete `ℚ₃`. This is a jointly continuous rank-one representation with finite image. Its kernel fixes only `ℚ`, but inertia at 2 maps onto `{±1}` through the first coordinate. Thus the two sides of the Check are respectively false and true.

**Repair:** Require `ker ρ` open in this Check, or explicitly restrict it to Hausdorff coefficients where continuity plus finite image yields an open kernel. Keep the general coefficient scope elsewhere. For the ordinary continuous character of `ℚ(i)/ℚ`, the repaired statement gives ramification at 2 on both sides; for the dense-kernel example the new hypothesis fails. The paragraph immediately preceding the Check already correctly requires an open kernel for finite ramification.

## R06 (P2) — Delete the second owner of the Hecke functional equation

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2238`: “Restate LFunctions Layer 5's primitive interface as *finiteOrderHeckeFunctionalEquation*”.

**Claim:** An already owned functional equation is a named target here as well.

**Witness:** `TauCetiRoadmap/LFunctions/README.md:1053` states the same primitive equation, followed by the same Euler correction. The target here explicitly identifies itself as a restatement.

**Repair:** Delete this construction/target and retain the supplier citation in Scope and ownership and Exact supplier contracts, with the consumers citing that one interface. Keep the Gauss-sum root-number comparison as the distinct arithmetic target. On the trivial character the supplied completion still has poles at 0 and 1; on the odd character modulo 4 it still has root number 1. This removes duplicate ownership without losing either test. Resolve the supplier direction as in R04.

## R07 (P3) — Several sampled locators do not support their attached claims

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:807`, :1366, :2908, :2944 and :4736.

**Claim:** The attached sources locate, respectively, arbitrary-monoid Hom base change, general restriction/induction semisimplicity, all of Dickson's classification, projective-field intersections and cohomological scalar extension.

**Witness:** NT26 §1.2 is notation (`nt26` line 295); ACC+ Lemma 7.1.8 is crystalline residual inertia (`acc` line 7895); ACC+ Lemma 6.2.30 proves enormous-image descent (`acc` line 5972).

**Repair:** Split the claims and supply locators for the actual general statements or their proof steps. In particular:

- §1.2: BHKT §2 and NT26 §1.2 do not prove the arbitrary-monoid Hom/invariant equivalences. Cite an actual scalar-extension result or give the finite-dimensional kernel argument with its inputs. The pinned `Representation.finrank_intertwiningMap_baseChange` assumes `Finite G` and compares dimensions only.
- §1.12: DDT p.53 and CHT §2.4.4 p.41 do not state this five-part general theorem. The latter begins a local minimal-deformation calculation (`cht` line 1877). Cite the precise Clifford and averaging results; preserve the `S₃/F₂` nonnormal-subgroup negative control.
- §4.3: §§251–254 occupy printed pp.272–279, not just p.272 (`dickson` lines 10447, 10553, 10642, 10736). For projective-field intersections cite the argument inside the proof of NT26 Lemma 5.7 (`nt26` lines 1911–1923); ACC+ Lemma 7.1.8 is unrelated.
- §7.7: ACC+ Lemma 6.2.30's proof uses invariant subspaces and Galois descent; it does not prove the displayed `H¹` scalar-extension assertions. Give a cochain/base-change locator. Its use for the subspace descent target can remain.

These repairs retain the computed values in the table below; they change the evidence attached to them, not their mathematical scope.

## R08 (P3) — Sixteen raw anchors fail the supplied text gate

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:947`, :1164, :1449, :1482, :1504, :2052, :2139, :2200, :2236, :2260, :3620, :3656, :3716, :3873, :3898 and :3929.

**Claim:** The roadmap is ready to pass the text gate.

**Witness:** The supplied gate reports `residue=16`; these locations are raw `<a id=...></a>` lines. Other text scanners report zero.

**Repair:** Delete the raw anchors, use Markdown headings for the named subtargets, and update links to their heading anchors. Rerun the gate; the tested condition is `residue=0`. This is a gate failure even though it does not alter a mathematical statement.

## R09 (P3) — Synchronize the Lean acceptance-test names and layer structure

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/Suggested.lean:9`, :232, :280 and :406; `README.md:4285` and :4966.

**Claim:** Own backticked identifiers denote declarations in Suggested.lean, and every retained declaration is named in the README.

**Witness:** `pGenerated`, `symPowerImage` and `projectiveTopology` are declared but never named in the README. Conversely, backticked `PolarizedRep` and `ResidualImage.GSp4.IsEnormous` are not declared in Suggested.lean.

**Repair:** Name the three retained helper definitions where their headline signatures are explained; italicize proposed identifiers for interfaces not declared in Lean. Use the required “target signatures” module title and README-ordered Layer comments, grouping the existing declarations accordingly. Do not add API padding to satisfy the name rule. Re-elaborate the unchanged mathematical signatures; all 33 presently elaborate, with only the 20 expected sorry warnings.

## Verified sound

The following records specific successful tests and distinguishes them from unverified claims. They do not certify inaccessible sources or the missing supplier contracts. The whole README and Lean file received a textual pass; numerical tests below cover all 15 seeded targets, all 20 Lean headlines, the principal README endpoints and every mathematical finding. They are finite adversarial tests, not proofs of the general theorems.

**Build and form.** Built the five named Tau Ceti imports, then ran `lake env lean` on Suggested.lean from the pinned checkout: exit 0, exactly 20 `sorry` warnings. Elaborated a scratch copy with `#check @name` for all 33 declarations. The printed binders retain the needed compactness, finite dimension, module topologies, semisimplicity, residual spanning, local-field and prime-inequality assumptions. No dropped standing binder was found and no signature was changed. The quotient topology is explicitly passed to the projective representation's continuity hypothesis; its lift is a continuous monoid homomorphism. The Frattini intersection is over maximal **open** subgroups, not all abstract subgroups.

A scratch one-tactic probe tried `simp`, `rfl` and `infer_instance` on each of the 20 sorried theorems. All 20 failed; no padding was established by those probes. Object searches did not identify a single pinned lemma giving one of the retained new headline conclusions directly. The file has 451 lines, one `import Mathlib`, only used individual Tau Ceti imports, no `set_option`, no sorry'd data and no admitted examples. No unrelated PR changes or dirty tracked files were found.

**Headline inventory.** Present in Lean: coefficient-field descent; integral descent; Brauer–Nesbitt; monodromy; odd absolute irreducibility; Frobenius recognition; Dickson classification; adequate constituent bound; tensor adequacy; rank-two enormous/adequate equivalence; general-rank enormous image; enormous symmetric powers; central-simple image algebra; splitting-field realizability; finite-field realizability; distinct-eigenvalue descent; Carayol strict conjugacy; projective lifting; open Frattini subgroup; multiplicative residual unramifiedness. The README's other endpoints are full Weil–Deligne comparison/purity/local constants; general perfect-residue conductor integrality, induction, reduction and wild bound; geometric abelian Tate/pairing/determinant adapters; function-field recognition; reductive integral models; polarised and Taylor–Wiles interfaces. The docstring names these unavailable-carrier families. This does not make the nonexistent supplier contracts in R01–R03 available.

**Seeded source checks.** Page references below use the version actually opened; source line numbers refer to the service's extraction. No source passages were copied into this report.

| Target | Source text examined and outcome |
| --- | --- |
| 1.1 Continuous representations | DDT §2.1 pp.52–53 (`ddt` lines 1960–1983) supports the field-valued representation/ramification conventions. BHKT §2 p.5 (`bhkt` lines 202–228) is notation. The full finite-projective and jointly continuous API is supplied/constructed separately, not established by those notation pages. |
| 1.2 Frames, operations, Tate twists | DDT §2.1 p.50 (`ddt` lines 1873–1899) fixes cyclotomic arithmetic Frobenius; p.55 lines 2064–2078 gives inverse-conjugation on End. NT26 §1.2 p.7 (`nt26` lines 295–327) uses geometric Frobenius. The roadmap correctly inverts it. Hom base-change citation defect: R07. Ribet p.154 not readable here. |
| 1.9 Reduction | DDT p.54 (`ddt` lines 2022–2032), DS §6.12/Lemma 6.13 p.523 (`ds` lines 601–624), and BHKT Theorem 4.8/Definition 4.9 pp.16–17 (`bhkt` lines 739–776) support lattice dependence of raw reduction and independence after semisimplification. NT26 p.7 merely introduces residual notation. |
| 1.12 Restriction/induction | Opened DDT p.53 and CHT §2.4.4 pp.41–42 (`cht` lines 1877–1920); the latter is local Clifford-theoretic lifting, not the stated general five-part result. Pinned normal-subgroup Clifford input exists; R07 records the locator repair. |
| 2.2 Ramification/Frobenius | Deligne §§2.2.3–2.3 pp.522–523 (`deligne1973` lines 600–633) fixes arithmetic/geometric inversion and the inertia/wild predicates. Serre Local Fields IV §1 Prop.2 remains uncertified. R05 concerns the roadmap's extra finite-image Check. |
| 2.5 Local factors | Deligne §§8.5–8.6 p.570 (`deligne1973` lines 1909–1925) retains N in Frobenius semisimplification. Saha Def.2.1 pp.2–3 and Lemma2.3 p.3 (`saha` lines 81–115) require characteristic zero and finite inertia for averaging. These restrictions and the geometric local-factor convention are retained. |
| 3.1 Finite wild image/Swan | Ulmer §4 pp.3–4 and §5 p.4 (`ulmer` lines 104–192) gives the weighted sum and finite wild image for finite ℓ-adic coefficients. It does not itself supply the roadmap's arbitrary-perfect-residue substrate; R01 applies. |
| 3.4 Functoriality | BK Lemma2.4 p.229 (`bk` lines 105–109) gives exact-sequence additivity of Swan; Ulmer §10 Prop.1 p.8 (`ulmer` lines 341–356) gives the deep-twist formula. BK's extraction loses some displayed equations, so those displays are not certified from OCR. |
| 3.6 Reduction | DDT Lemma2.7 pp.54–55 (`ddt` lines 2053–2063) gives preserved Swan and the Artin-conductor loss. Ulmer §6 p.5 (`ulmer` lines 215–245) explains semisimplification and unchanged wild action. The roadmap correctly retains possible strict Artin-conductor decrease. |
| 4.3 Sylow/PSL₂ | Dickson §§251–254 pp.272–279 (`dickson` lines 10447–10757) distinguishes the Sylow, dihedral, subfield and exceptional cases. The p.272-only locator needs expansion. NT26 Lemma5.7 proof p.41 (`nt26` lines 1911–1923) supplies the projective intersection argument. ACC+ Lemma7.1.8 does not. |
| 5.7 Finite-field/trace-field descent | DS Lemma6.13 p.523 (`ds` lines 616–624) has finite fields and semisimplicity. BLGGT LemmaA.1.5 p.85 (`blggt` lines 3963–3995) has characteristic zero, trace values and one element with distinct base-field roots; proof of Lemma5.3.1 p.71 lines 3279–3301 supplies the compact lattice step. These hypotheses are in the Lean signatures. |
| 7.4 Polarisations/CHT/oddness | CHT Lemmas2.1.1–2.1.4 pp.7–10 (`cht` lines 291–384), BLGGT §1.1 pp.11–13 (`blggt` lines 450–561) support ν(j)=−1, the CM sign, the δ correction for tensors and the scalar-square torsor. The roadmap correctly distinguishes GLₙ-conjugacy from full identity-component conjugacy. |
| 7.6 Closure/lifting | NT26 Lemma2.2 proof p.10 (`nt26` lines 437–466); Patrikis Thm2.1.1 pp.15–16, Prop2.1.4 p.17, Lemma2.3.6 pp.27–28, Lemma2.3.15 p.31 (`pat` lines 753–850,1268–1305,1478–1483); Nekovář Prop3.10 proof pp.1197–1198 (`nekovar` lines 908–979); BCGP25 Prop4.11.2 proof pp.110–112 (`bcgp25` lines 4906–5007). Finite coefficient obstructions, real-place transition maps and the corrected Asai eigenvalues agree. Borel/Schneider remain uncertified. Patrikis states the character-root lemma for Galois groups; the arbitrary-profinite extension still needs its own argument. |
| 7.7 Cohomology/descent | BLGG RemarkA.1.2 p.29 (`blgg` lines 1468–1475); DDT Lemma2.48 p.82 (`ddt` lines 3033–3055); CHT Cor2.5.4 proof p.57 (`cht` lines 2723–2740); ACC+ Lemma6.2.30 proof p.1044 (`acc` lines 5972–5989). The exceptional F₅ cohomology is confirmed by the independent calculation below. Source-locator and source-error qualifications apply. |
| 7.8 Clebsch–Gordan | CHT Lemma2.5.2 proof p.56 (`cht` lines 2687–2713) supports its low-weight semisimple decomposition. Jantzen II.2.16 pp.185–186 could not be read legally, so the stated general modular exact-sequence locator is not certified; explicit p=2,3 tests below succeed. |

**Computed adversarial tests.** In this table, “retained” means the displayed instance agrees, not that finite testing proves the universal statement. “Excluded” identifies a necessary hypothesis that the roadmap actually retains. Each Lean headline is marked **Lean**. Matrices act on columns; Φ is arithmetic Frobenius; Euler polynomials use Φ⁻¹. Numerical Jordan-block and cohomology computations are over the indicated field. The zero-rank determinant is 1.

| Statement | Instance and values on the two sides / wrong model | Result; change |
| --- | --- | --- |
| 1.1 Joint continuity | Indiscrete Q₃, rank-one sign on a dense-kernel quotient: action continuous, kernel not open; discrete C₂ sign: kernel open of index 2 | Both admitted by the general definition; R05 restricts its extra Check |
| 1.1 Projective determinant | A=Q×Q, M=(1,0)A, automorphism 2: determinant (2,1), whereas a constant-rank-one scalar formula gives (2,2) | Varying-rank convention retained |
| 1.1 Zero module | Rank 0: trace 0, determinant 1, characteristic polynomial 1 | Empty-product convention retained |
| 1.1 Nonfree projective module | I=(2,1+√−5): norm 2; a²+5b²=2 has no integer solution | I is not free; arbitrary-projective scope matters |
| 1.2 Frames | Permutation basis change sends diag(2,3) to diag(3,2): both traces 5, determinants 6 | Retained |
| 1.2 Hom extension | Real C₃ rotation: End dimension 2; complexification χ⊕χ⁻¹ has End dimension 1+1=2; invariants 0 on both sides | Retained; R07 needs an actual general locator |
| 1.2 Dual action | Over F₂, A=[[1,1],[0,1]], B=[[1,0],[1,1]]: (AB)ᵀ=[[0,1],[1,1]], AᵀBᵀ=[[1,1],[1,0]] | Transpose alone fails; inverse transpose retained |
| 1.2 Tate twist | χ(Φ₅)=5, χ⁻¹(Φ₅)=1/5; twisting rank 2 multiplies determinant by 25 | Arithmetic convention retained |
| 1.3 Open induction | Ind₁ᶜ²1: dimension 2, generator eigenvalues 1,−1, determinant −1; restriction to 1 is two copies | Retained |
| 1.4 Discrete/adic distinction | C₃ has image size 3; Z₃ modulo 3ⁿ has image size 3ⁿ, while Z₃ itself is infinite | Discrete finite-image and adic inverse-limit statements distinguished |
| 1.5 Coefficient descent **Lean** | C₃ acting by ζ₃ over Q̄₂: field Q₂(ζ₃) has degree 2; rank 0 needs Q₂ and no entries | Retained |
| 1.6 Integral conjugacy **Lean** | C₂ swap matrix has entries 0,1 and stable Z₃²; Z acting by 3 has valuation m on element m, unbounded below | Compact example passes; noncompact countermodel excluded |
| 1.7 Absolute irreducibility | Real C₃ rotation: real dimension 2 and irreducible; complexification has two dimension-one summands | Absolute condition retained |
| 1.8 Brauer–Nesbitt **Lean** | F₄, C₃: 1⊕1 and χ⊕χ both have trace 0; characteristic polynomials X²+1 and X²+ω² differ | Characteristic polynomials, not traces alone, retained |
| 1.9 Raw reduction | Stable lattices giving off-diagonal 1 and ℓ: reductions J₂(1) and I₂; invariant dimensions 1 and 2; both semisimplify to 1⊕1 | Retained |
| 1.9 Marked residual equivalence | Over F₃[ε]/ε², I+εE₁₂ reduces to I; the basis swap reduces to a nonidentity matrix | Strict equivalence distinguishes the marking |
| 1.10 Coefficient twist | F₄: ω↦ω²↦ω; Teichmüller lift of 4∈F₅ is −1, square 1 | Retained |
| 1.11 Lattice/building convention | GL₁: multiplication by a uniformizer translates the extended building by 1; reduced building is a point | Reduced-building fixed point retained |
| 1.12 Normal restriction | Natural S₃/F₄ representation restricted to normal C₃ is χ⊕χ², two simple summands | Clifford normality retained |
| 1.12 Nonnormal restriction | Same representation restricted to C₂/F₂ has J₂(1), invariant dimension 1; its semisimplification has dimension-two invariants | Nonnormal counterexample retained; R07 locator |
| 1.12 Modular induction | Ind₁ᶜᵖ F_p has one Jordan block of length p; invariants dimension 1 instead of p | Prime-to-characteristic averaging condition necessary |
| 2.1 Decomposition/Frobenius | Q(i): p=3 inert, residue size 9, arithmetic Frobenius i↦−i; p=5 split, Frobenius identity | Retained |
| 2.1a Tame transport | Tame ramification index 2: uniformizer valuation multiplies by 2, hence t maps to 2t; identity extension gives t | Direction retained |
| 2.2 Finite kernel field | Dense-kernel sign in R05: inertia image size 2, fixed field Q; “unramified” false versus true | Fails; add open kernel |
| 2.2 Open-kernel control | Character of Q(i): inertia image size 2 at 2 and kernel field ramification index 2; at 3 both are unramified | Repaired claim passes |
| 2.2 Restriction/twist | Unramified rank one with Φ=5: residue-degree-two restriction has Φ=25; twist by unramified 2 gives Φ=10 | Retained |
| 2.3 Fundamental characters | F₉/F₃ norm exponent (9−1)/(3−1)=4; ω₂⁴=ω₁ | Retained |
| 2.4 Monodromy **Lean** | r(Φ)=diag(q,1), N=E₁₂: r(Φ)Nr(Φ)⁻¹=qN; exp(tN)=I+tN | Arithmetic relation retained |
| 2.4 Full versus semisimplified WD | Unramified J₂(1): full Φ has rank(Φ−1)=1; F-semisimplified Φ=I₂ has rank 0 | R03: cannot reconstruct the full object from the latter |
| 2.4 Excluded characteristic | ℓ=p cyclotomic inertia has infinite scalar image; its nontrivial scalar eigenvalue is not unipotent | ℓ≠p is essential and retained |
| 2.5 Special WD factor | r(Φ)=diag(q,1), N=E₁₂: ker N=⟨e₁⟩ gives 1−X/q; dual kernel gives 1−X | Dual/geometric normalization retained |
| 2.5 Exactness restriction | F₃[C₃], J₂(1), N=0: invariants dimension 1, factor 1−X; two trivial constituents give (1−X)² | Modular exactness excluded |
| 2.5 Cyclic block | Two blocks, return scalar 2: det(1−ΦX)=1−2X²; degree-zero determinant is 1 | Retained; zero-size handled separately |
| 2.5a Adelic comparison | χ(Φ)=q: geometric factor on χ⁻¹ is 1−qX, equal to arithmetic factor on χ | The dual in the comparison is necessary |
| 2.6 Monodromy weights | Sp₂ above: geometric eigenvalues q⁻¹,1, weights −2,0, midpoint −1 | Weight spread and central weight agree |
| 2.7 Local epsilon normalization | Unramified trivial character, additive conductor 0, self-dual measure: epsilon 1; quadratic Gauss sum over F₃: i√3, normalized i | Retained |
| 2.7 Global Hecke equation | Primitive χ modulo 4: conductor 4, odd real shift 1, root number 1; trivial character completion has poles 0,1 | R04/R06 preserve these values under single ownership |
| 3.1 Weighted Swan | Quadratic conductor-3 character in Q₂(ζ₈): lower weights 1+1/2+1/2=2; unweighted count 3 | Weighted definition retained |
| 3.1 General residue field | F̄_p((t)), yᵖ−y=t⁻¹: e=p, d=2(p−1), eventual ψ(u)=pu−p+1 | R01: valid example outside supplied finite-residue substrate |
| 3.1 Herbrand intercept | Q₂(ζ₈): e=4,d=8, eventual ψ(u)=4u−5; Q₃(ζ₉): e=6,d=9, ψ(u)=6u−4 | Subtracting e−1 from d is essential |
| 3.2 Artin/Swan | χ₋₄: a=2, Swan=1; χ₈: a=3, Swan=2; tame nontrivial rank one: a=1, Swan=0 | Retained |
| 3.2 Reciprocity depth | χ₈ on U² nontrivial, on U³ trivial: least trivial depth 3 | R02: minimum alone does not supply all-depth identification |
| 3.3 WD conductor | Sp₂ unramified r: a=2−1=1; nontrivial tame scalar twist: invariants zero, a=2 | Formula uses both inertia and N |
| 3.3 Global conductor | χ₋₄ over F₃: conductor ideal (4); reduction in F₂ is trivial, conductor (1) | Reduction may lower Artin conductor |
| 3.4 Exact sequence | Tame unipotent extension: a=1 versus sum 0+0; Swan=0 versus 0+0 | Swan additivity retained; Artin additivity not asserted here |
| 3.4 Deep twist | Trivial rank 2 twisted by break-2 character: Swan=2·2=4, Artin=2·3=6 | Retained |
| 3.4 Dual/base change | Rank-one break 1: dual break 1; tame index-two restriction break 2; unramified restriction break 1 | Directions and scaling retained |
| 3.5 Induction/discriminant | Ind from Q₂(i) of 1: conductor 2, discriminant exponent 2; unramified degree-two induction of a conductor-one character gives 2 | Retained |
| 3.6 Lattice reduction | Tame Tate matrix with upper-right ℓt: characteristic-zero invariants dimension 1, residual dimension 2; a changes 1→0, Swan stays 0 | Loss equals 2−1=1 |
| 3.7 Artin–Schreier | p=2,m=1: d=2,a=2; p=3,m=2: d=6,a=3; t⁻ᵖ and t⁻¹ differ by an AS coboundary | Prime-to-p pole condition retained |
| 4.1 Oddness **Lean** | Standard irreducible S₃/Q representation, a transposition c=diag(1,−1): determinant −1, trace 0, eigenspace dimensions 1,1; c=I₂ gives 1,2 and 2,0 | Odd condition discriminates in characteristic ≠2 |
| 4.1 Characteristic two | J₂(1)/F₂: determinant 1, not identity, square I; −1=1 | Characteristic restriction retained |
| 4.2 Cartans | GL₂(F₅): split Cartan order 16, normalizer 32; nonsplit order 24, normalizer 48 | Split/nonsplit carriers distinguished |
| 4.3 Small PSL cases | PSL₂(F₂)=S₃ order 6; PSL₂(F₃)=A₄ order 12; PSL₂(F₄)=A₅ order 60 | q≥4 simplicity cutoff retained |
| 4.3 Sylow count | A₅: ten Sylow-3 subgroups, 10=1+3·3; five Sylow-2 subgroups of order 4, 5=1+1·4 | Congruences agree; R07 locator |
| 4.4 Dickson **Lean** | GL₂(F₂) projective order 6, dihedral; SL₂(F₅) projective order 60, A₅; GL₂(F₅) projective order 120, S₅ | Exceptional/subfield cases retained |
| 4.5 Large versus triangular image | Borel GL₂(F₅) order 80; SL₂(F₅) order 120, so Borel cannot contain it | Irreducibility/Cartan exclusions matter |
| 4.6 Dihedral image | Ind from C₃ to S₃ of χ: dimension 2, restriction χ⊕χ⁻¹, character ratio order 3 | Retained |
| 4.7 Persistence | PSL₂(F₂₅) minimal proper index 26>10; A₄ in PSL₂(F₅) has index 5<10 | a≥2 cutoff distinguishes the examples |
| 5.1 Frobenius density | Q(i)/Q: split and inert conjugacy classes each have size 1 in C₂, density 1/2 | Retained |
| 5.2 Quadratic symbols | (2/7)=1, (−1/7)=−1, (2/3)=−1 | Both signs occur; compatibility conditions still required |
| 5.3 Frobenius recognition **Lean** | Trivial and quadratic Q(i) characters at 3: X−1 versus X+1; rank 0 polynomials both 1 | Recognition distinguishes the nonisomorphic case |
| 5.4 Trace identity | A=diag(2,3), B=I₂: 6(1/2+1/3)−5·2+5=0 | Rank-two inverse/trace sign retained |
| 5.5 Central-simple image **Lean** | Complex quaternionic Q₈ representation with real trace field: image algebra H has real dimension 4, center dimension 1 | Central simple does not mean split |
| 5.6 Splitting equivalence **Lean** | Same H: split over R false and realizable in dimension 2 over R false; over C both true | Both directions survive nonsplit control |
| 5.7 Finite-field realization **Lean** | F₄ eigenvalues ω,ω²: polynomial X²+X+1 in F₂; companion [[0,1],[1,1]] has order 3 | Descent preserves dimension 2 and kernel |
| 5.7 Distinct-root descent **Lean** | C₂ diag(1,−1) over C descends to R; Q₈ quaternionic example has noncentral eigenvalues ±i, not distinct real roots | Obstructed example fails the retained root hypothesis |
| 5.8 Haar measure | GL₂(Z₃) inside M₂(Z₃): measure (1−1/3)(1−1/9)=16/27; count GL₂(F₃)=48 out of 81 | Count and measure agree |
| 5.8 Nonreduced test | Zero sets of x−1 and (x−1)² in Z₃ both {1}, measure 0 | Underlying zero set, not multiplicity, determines this measure |
| 5.9 Conjugacy condition | S₃ transpositions: 3/6=1/2; a single transposition has 1/6 but is not conjugacy-stable | Frobenius subset must be conjugacy-stable |
| 5.10 Carayol **Lean** | R=F₃[ε]/ε², g=I+εE₁₂: g diag(1,2)g⁻¹=[[1,ε],[0,2]], reduction unchanged, trace 0, determinant 2 | Strict conjugacy has the asserted trace invariance; constant natural GL₂(F₃) residual span is M₂ |
| 5.11 Polynomial annihilation | r=1, s=J₂(1): P_r=X−1; P_r(s)=E₁₂≠0 despite equal semisimple characters | Annihilation is stronger than semisimplified recognition |
| 5.12 Potential abelianness | Finite irreducible C₃ real representation restricts to its kernel as two trivial lines | Potentially abelian does not mean already a sum of base-field characters |
| 5.13 Function-field normalization | P¹/F_q: #P¹(F_{qʳ})=qʳ+1, error 0; constant extension degree 2 has no F_q-points but has F_{q²}-points | Constant-field component must be retained |
| 6.1 Tate rank | y²=x³+1 over F₅: #E(F₅)=6, trace 0, determinant 5, polynomial X²+5 | Degree-two Tate characteristic polynomial agrees |
| 6.1 Excluded torsion prime | Supersingular E/F₅: geometric E[5] has 1 point, versus 25 points expected for an étale rank-two 5-torsion module | ℓ≠characteristic retained |
| 6.2 Pairing determinant | Rank 2: det=χ; rank 4: det=χ²; complex conjugation has g positive and g negative eigenvalues, determinant (−1)^g | No erroneous rank-independent parity |
| 6.3 Multiplicative reduction **Lean** | Q₅, ℓ=3: Tate parameter 5³ gives v(j)=−3 and unramified residual; parameter 5 gives −1 and ramified residual | Divisibility by 3 distinguishes both directions |
| 6.3 Nonsplit multiplicative case | Unramified quadratic twist has inertia value 1, Frobenius −1 | Residual unramifiedness unchanged; Euler sign changes |
| 6.4 Coefficients | Real multiplication degree 2 on a dimension-two abelian variety: E-linear Tate dimension 2, Qℓ-dimension 4 | Restriction-of-scalars dimension and determinant norm agree |
| 6.4a Open Frattini **Lean** | Zℓ in a unipotent matrix group: Φ=ℓZℓ, index ℓ; trivial group: index 1; infinite product C_p: Φ=0, not open | Finite-dimensional compact matrix hypothesis excludes the last case |
| 6.6 Wild bound | Quadratic Q₂(i), N=1,e_K=1,p=2,c=1: Swan 1≤2 and Artin 2≤3; unramified character: Swan 0≤1 | Inequalities pass; source locator remains unreadable |
| 7.1 Symmetric/exterior powers | Sym² diag(2,3): eigenvalues 4,6,9, determinant 216=6³; exterior square eigenvalue 6; Sym⁰ dimension 1 | Exponents and degree-zero convention agree |
| 7.1 Tensor induction | C₂ interchanges two dimension-two tensor factors: eigenvalue multiplicities 3 and 1, trace 2, determinant −1 | Flip sign retained |
| 7.2 Adjoint trace pairing | n=2 over F₂: tr(I)=0, scalar subspace lies in ad⁰; dimensions ad=4, ad⁰=3, scalar=1 | Direct-sum scalar splitting excluded when p divides n |
| 7.3 Similitude dimensions | GSp₄ dimension 11, Sp₄ dimension 10, M₄ dimension 16; zero form allows every multiplier | Nondegeneracy is needed and retained |
| 7.4 CHT multiplier | n=1: ((a,1)j)²=1 and ν((a,1)j)=−1 | The minus sign at j is pinned |
| 7.4 Conjugacy torsor | Over Q₃, 1 and 2 have distinct square classes; allowing the scalar factor in the identity component identifies the corresponding lifts | GLₙ versus full-component conjugacy distinguished |
| 7.4 Tensor sign | Two odd CM multipliers each give −1 at c; their product gives +1; quadratic δ contributes −1 | δ correction retained |
| 7.4 Rank/characteristic boundary | Rank 0 pairing gives no faithful multiplier condition; over F₂, B(x,y)=xy is symmetric/antisymmetric but B(1,1)=1 | Rank and alternating/skew distinctions retained |
| 7.4 Mixed coefficient components | R=Q×Q, B=(I₂,J₂): transpose (I₂,−J₂) is neither B nor −B globally | Roadmap excludes source's unrestricted dichotomy; erratum below |
| 7.4 Odd adjoint invariants | In rank 2, (a,b)=(1,1): a²+b²−1=1; (2,0): 3 | Balanced oddness distinguishes the even case |
| 7.5 Rank-two similitudes | GSp₂=GL₂; diag(2,3) multiplier and determinant both 6 | Rank-four formulas cannot be copied without exponent change |
| 7.6 Zariski closure | Closure of {2} in G_m is one point; closure of subgroup ⟨2⟩ in characteristic zero is G_m | Closure must be of the generated subgroup/image |
| 7.6 Strong irreducibility | Finite image of rank 2 restricts to kernel as 1⊕1; rank 1 remains irreducible | Strong condition excludes finite rank-two examples |
| 7.6 Character roots | On C₂, sign has square 1, but no square root character with values ±1 | Finite-order correction cannot be omitted |
| 7.6 Obstruction model | C₄→C₂: elements over the generator have order 4, so no section; split C₂×C₂→C₂ has an order-two lift | Zero obstruction distinguishes split from nonsplit |
| 7.6 Projective lifting **Lean** | PGL₁=1 lifts by the trivial character; projective diag(1,−1) lifts by diag(1,−1) | Two explicit lift cases pass; finite-group obstruction alone is not the global theorem |
| 7.6 Real-place transition | H²(C₂,Z/2)=Z/2; inclusion into Z/4 sends 1 to 2, zero modulo 2(Z/4) | Transition kills the real obstruction |
| 7.6 Asai tensor flip | Eigenvalues of ϱ(g²) are 2,1/2: Asai eigenvalues 2,1/2,1,−1, determinant −1 | Roadmap's reciprocal pair corrects the source misprint |
| 7.7 SL₂ exceptional cohomology | SL₂(F₅), ad⁰: order 120, dim Z¹=4, dim B¹=3, dim H¹=1 | Exceptional case retained |
| 7.7 Neighboring cohomology | SL₂(F₃): 3−3=0; GL₂(F₅): 3−3=0; SL₂(F₇): 3−3=0 for dim H¹(ad⁰) | Distinguishes group, field size and exceptional case |
| 7.7 Averaging | H¹(C_p,F_p)=Hom(C_p,F_p) dimension 1; H¹(C_m,F_p)=0 when p∤m | Invertibility condition retained |
| 7.8 Modular symmetric power | Sym³(F₃²), transvection: Jordan blocks 3,1; a proposed split pair of dimension-two factors has blocks 2,2 | Modular nonsplitting retained |
| 7.8 Finite versus algebraic group | F₂: x²+xy+y² is GL₂(F₂)-fixed; for u∈F₄ with u²+u=1, shear changes its y² coefficient by 1 | Finite-point splitting does not imply algebraic-group splitting |
| 7.8 Clebsch–Gordan dimension | V⊗Sym²V: 2·3=6; characteristic-zero factors Sym³V and det⊗V: 4+2=6 | Dimensions agree; modular direct-sum assertion separately restricted |
| 7.9 Coprime adequacy **Lean** | Rank-one C₃ over F₄, p=2: ad⁰=0, H¹=0, semisimple span dimension 1 | Coprime branch passes even though large-bound branch 2≥4 fails |
| 7.9 Tensor adequacy **Lean** | Rank-one C₃ and C₅ characters over F₁₆: tensor has order 15, ad⁰=0, span dimension 1 | Restricted rank-one irreducibility and coprime adequacy pass |
| 7.10 Rank-two enormous iff adequate **Lean** | SL₂(F₅): both fail H¹=0 (dimension 1); SL₂(F₇): dimension 0, diag(2,4) has distinct eigenvalues | Exceptional negative and neighboring positive controls retained |
| 7.10 Contains-SL headline **Lean** | n=3,p=5: p>n and diag(1,2,3)∈SL₃(F₅), three distinct roots, trace(I)=3≠0; p=3 makes trace(I)=0 | Tested eigenvalue/scalar obstructions, not an independent full adequacy proof |
| 7.10 Symmetric-power headline **Lean** | n=2,p=7: Sym¹ is the original rank-two representation; diag(2,4) roots distinct, H¹(ad⁰)=0 | Smallest retained symmetric-power case passes |
| 7.11 Symplectic small characteristic | p=2, rank 4: trace(I)=0 and −1=1; p=5: trace(I)=4≠0 | Odd/large-prime hypotheses protect the scalar/sign tests; no full big-image certificate inferred |
| 7.12 Small unitary/derived groups | Rank-one derived group trivial; PSL₂(F₃) order 12 nonsimple; PSL₂(F₄) order 60 simple | Small-rank/field exclusions cannot be dropped |
| 7.12 Auxiliary eigenvalues | diag(2,4) over F₇: determinant 1, discriminant (2−4)²=4≠0 | Distinct-eigenvalue auxiliary condition passes |

The four finite-cohomology values above were computed independently by solving the cocycle equations `f(gs)=f(g)+Ad(g)f(s)` over F_p, using generators of SL₂ and GL₂ and the basis `diag(1,−1), E₁₂, E₂₁`. Coboundaries were computed as `g·v−v`. Thus the F₅ exception is a numerical witness, not an inference from the theorem being tested.

**Pinned object audit.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Opened the following nine declaration locations, checking hypotheses as well as names. Paths here are relative to the corresponding pinned library repository.

| Declaration/object | Pin location and what it supplies |
| --- | --- |
| `ContRepresentation` | `Mathlib/RepresentationTheory/Continuous/Basic.lean:54`: a homomorphism to continuous linear endomorphisms. The group has no topology binder here; this does not include joint continuity in the group variable. Thus the roadmap's topological adapter is distinct. |
| `Representation.finrank_intertwiningMap_baseChange` | `TauCeti/RepresentationTheory/BaseChange.lean:498`: finite group, scalar-extension dimension identity. It is not the arbitrary-monoid Hom equivalence of R07. |
| Normal-subgroup Clifford restriction | `TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean:327`: `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`, irreducible finite-dimensional representation, normal subgroup. This algebraic part is consumed, not a new theorem to plan. |
| Abstract `frattini` | `Mathlib/GroupTheory/Frattini.lean:24`, nongenerating criterion :53 with `IsCoatomic (Subgroup G)`. This is not the intersection of maximal open subgroups used by the Lean headline. |
| Rank-two simplicity | `Mathlib/LinearAlgebra/Projectivization/PSL/PSL2.lean:120`, :135: `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'` and `rank_two_simple`, respectively an element-square condition and the cardinality cutoff. The q=2,3 exclusions are real. |
| Arithmetic cyclotomic Frobenius | `TauCeti/NumberTheory/LocalField/Unramified/Inertia/Cyclotomic.lean:61`: `IsArithFrobeniusLift.coe_localCyclotomicCharacter`, coprime coefficient prime, residue cardinality q. |
| Tame character conjugation | `TauCeti/NumberTheory/LocalField/Tame/PadicCharacter.lean:152`, :162: Tate action and Frobenius q-power. These fix the same arithmetic convention as Layer 2. |
| `vanishingIdeal` | `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Points/Vanishing.lean:100`, membership :108: vanishing at all specified points. It supplies a genuine ideal body, not an opaque placeholder for closure. |
| Elliptic determinant | `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52`: `det_tateModuleGaloisRepresentation`, with coefficient characteristic and separable-closure hypotheses. The already supplied determinant is not restated as a Lean headline here. |

**Ownership and resolved supplier evidence.** Object searches used `roadmaps grep`, the main checkout, the board's packages and the supplied open-head index, for joint continuity, scalar extension, determinants, Tate modules, monodromy/WD, finite-group Clifford theory, cohomology, projective lifting, Frattini and image conditions. These searches found the duplicate functional-equation target in R06 and the supplier drift in R01–R03. Searches of the distinctive six Lean endpoint names (coefficient descent, Dickson, symmetric-power enormousness, Carayol, projective lifting and multiplicative reduction) returned only this folder. No fully qualified collision was established. This is an object-based ownership audit, not a claim that all similarly named statements in other scopes are duplicates.

The appropriate owner here is the arithmetic/topological adapter and its Galois-specific theorem. Generic algebraic representation operations, local ramification, reciprocity, geometric Tate carriers and analytic Hecke continuation have their earlier owners. The overlap therefore calls for the specific repairs above, not rejection of this roadmap's whole scope or re-planning it as an unrelated roadmap.

| Supplier | Resolved contract/evidence |
| --- | --- |
| RepresentationTheory on main | `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:607` Clifford, :661 Brauer, :721 projective representations, :823 scalar Schur. Normality, finite dimension and scalar-endomorphism conditions remain relevant. |
| ProfiniteCohomology on main | `TauCetiRoadmap/ProfiniteCohomology/README.md:725` low-degree complex; :924 coefficient colimits; :1549 all-degree comparison; :2342 wreath-product cocycle law. The tensor-induction transversal change has a named owner. |
| ProfiniteProPGroups on main | `Completed/ProfiniteProPGroups/README.md:477` maximal open subgroups/Frattini; :523 finite generation versus finite Frattini quotient. General compact matrix openness adds work beyond this pro-p substrate. |
| EtaleCohomologyFoundations on main | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:776` F3a; :854 F4.0 lisse/projective carrier; :864 isomorphism/base change; :874 stable carriers; :885 lattices; :1327 F10.3 scalar determinants. These contracts are present. |
| PadicMeasuresIwasawaAlgebras on main | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:3196` projective determinant, :3201 maps and :3203 base change. General determinant ownership is preserved. |
| ReductiveGroupsPartII | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:2955` fixed points; :3054–:3066 reduced buildings/GL comparison. The GL₁ translation test selects the reduced building. |
| AbelianSchemesAndArithmeticModuli | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1803` A4.1 Tate fiber functor, through :1817 rank/reduction/duality. Arithmetic transport here has a supplied geometric source. |
| AdicSpacesPartIII | `TauCetiRoadmap/AdicSpacesPartIII/README.md:11890` projective trace realization, through :11912 contraction/trace comparison. This covers finite projectives beyond free matrices. |
| PadicLocalLanglandsForGL2Qp | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:283` full fundamental characters over finite residue fields, including equal characteristic. The niveau norm exponent agrees with the F₉/F₃ test. |
| SmoothRepresentationsOfLocalGroups | SR.5.2 classical normalization found; six advertised full-WD contracts absent at the permitted supplying head: R03. |
| LocalFieldsRamification | Main Layers 3/4 found; the additional 3a/4a perfect-residue interface is absent: R01. |
| ClassFieldTheory | Main Layer 7 conductor-minimum/unramified contract found; advertised all-depth unit-filtration map absent: R02. |
| LFunctions | `TauCetiRoadmap/LFunctions/README.md:1053` primitive functional equation and :1072 Euler correction found at its open head. They are already owned there and later in the order: R04/R06. |

The dependency check was rerun without editing the merge order. Its output was:

```text
not movable: ArithmeticGaloisRepresentations consumes ProfiniteCohomology (#376) and is consumed by EllipticLegendreCharacterInterfaces (#89), which comes first: moving ArithmeticGaloisRepresentations after ProfiniteCohomology would put a supplier after a consumer, a cycle through ArithmeticGaloisRepresentations
UPWARD: ArithmeticGaloisRepresentations (#42) -> AlgebraicCurves (#226) at README lines [448, 2813, 3502, 3528]
UPWARD: ArithmeticGaloisRepresentations (#42) -> ClassFieldTheory (#262) at README lines [395, 400, 592, 1607, 1670, 1824]
UPWARD: ArithmeticGaloisRepresentations (#42) -> LFunctions (#301) at README lines [555, 2222, 2250, 2300, 2448]
UPWARD: ArithmeticGaloisRepresentations (#42) -> LocalFieldsRamification (#328) at README lines [371, 1390, 1419, 1537, 1594, 1643]
UPWARD: ArithmeticGaloisRepresentations (#42) -> ProfiniteCohomology (#376) at README lines [470, 4142, 4572, 4642, 5155]
UPWARD: ArithmeticGaloisRepresentations (#42) -> ProfiniteProPGroups (#233) at README lines [3351, 4010, 4027, 4059]
UPWARD: ArithmeticGaloisRepresentations (#42) -> RepresentationTheory (#180) at README lines [436, 1981, 2364, 2448, 2637, 2757]
depcheck: 163 roadmaps, 1197 edges, 7 problem(s)
```

The six main-roadmap UPWARD diagnostics are false positives for permitted main contracts; that does not excuse their unpublished additions. The “not movable” line describes the obstruction to the checker's proposed relocation, rather than independently proving a mathematical cycle in the retained main contracts. No separate cycle finding is inferred from it. No declared supplier gaps were available to cover R01–R03.

**Gate evidence.** The worker's gate at this head failed with `residue=16`, `depcheck=7`; `build=0`, `outside-folder=0`, `dirty=0`, `stray-files=0`, `sorry-data=0`, `set_option=0`, and every other reported counter zero. R08 covers all sixteen residues; R04 and the explicit false-positive analysis cover all seven dependency diagnostics. The independent targeted import build and Lean elaboration succeeded. The worktree remains unchanged. This is not an accepting verdict while the gate fails.

## Not verifiable

No source manifest existed in this folder and none was edited. All 77 bibliography entries, plus the prose citations to Stacks, Schneider and SGA1, were submitted to the legal source service. Fetching is not verification: only passages actually read are identified above. Published/preprint numbering is certified only where the examined version agrees with the cited locator; the remaining locators are not silently treated as checked.

The following 19 texts could not be obtained through the attempted legal routes. They are recorded together in the scratch missing-reference inventory; the review is delivered with these limits rather than awaiting a new text. No paywall was bypassed.

- jantzen: Representations of Algebraic Groups; the DOI's landing page: the landing page https://pubs.ams.org/ebooks/surv/107 is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open); Author homepage at users-math.au.dk/jantzen offers errata, not the text; Aarhus publication record lists the book without a full text.
- ref-2: E. Artin, J. Tate, *Class Field Theory*, Benjamin, 1967, Ch. X, Theorem 5 (Grunwald–Wang).; Bibliographic resolution through the source service found no legal source.
- ref-22: Level-raising and symmetric power functoriality, III; the DOI's landing page https://projecteuclid.org/journals/duke-mathematical-journal/volume-166/issue-2/Level-raising-and-symmetric-power-functoriality-III/10.1215/00127094-3714971.full: no PDF link
- ref-31: W. T. Gan, S. Takeda, *The local Langlands conjecture for `GSp(4)`*, Ann. of Math. 173 (2011), 1841–1882.; Bibliographic resolution through the source service found no legal source.
- ref-35: I. M. Isaacs, *Character Theory of Finite Groups*, Academic Press, 1976.; Bibliographic resolution through the source service found no legal source.
- ref-41: Q. Liu, *Conducteur et discriminant minimal de courbes de genre 2*, Compositio Math. 94 (1994), 51–79.; Bibliographic resolution through the source service found no legal source.
- ref-43: Abelian varieties isogenous to no Jacobian; the DOI's landing page https://projecteuclid.org/journals/annals-of-mathematics/volume-191/issue-2/Abelian-varieties-isogenous-to-no-Jacobian/10.4007/annals.2020.191.2.7.full: no PDF link
- ref-46: Elliptic Curves; the DOI's landing page https://doi.org/10.1142/11870: www.worldscientific.com: HTTP 403
- ref-48: D. Mumford, *Abelian Varieties*, Tata Institute / Oxford University Press, 1970.; Bibliographic resolution through the source service found no legal source.
- ref-53: R. Noot, *Abelian varieties — Galois representation and properties of ordinary reduction*, Compositio Math. 97 (1995), 161–171.; Bibliographic resolution through the source service found no legal source.
- ref-57: K. A. Ribet, *Abelian varieties over `ℚ` and modular forms*, in Algebra and Topology 1992 (KAIST).; Bibliographic resolution through the source service found no legal source.
- ref-60: Conductor, discriminant, and the Noether formula of arithmetic surfaces; the DOI's landing page https://projecteuclid.org/journals/duke-mathematical-journal/volume-57/issue-1/Conductor-discriminant-and-the-Noether-formula-of-arithmetic-surfaces/10.1215/S0012-7094-88-05706-7.full: no PDF link
- ref-62: J.-P. Serre, *Zeta and L functions*, in Arithmetical Algebraic Geometry (Purdue, 1963), Harper & Row, 1965, 82–92.; Bibliographic resolution through the source service found no legal source.
- ref-64: J.-P. Serre, *Propriétés galoisiennes des points d'ordre fini des courbes elliptiques*, Invent. Math. 15 (1972), 259–331.; Bibliographic resolution through the source service found no legal source.
- ref-68: Sur les représentations modulaires de degré 2 de Gal(Q¯/Q); the DOI's landing page https://projecteuclid.org/journals/duke-mathematical-journal/volume-54/issue-1/Sur-les-repr%C3%A9sentations-modulaires-de-degr%C3%A9-2-de-GalQQ/10.1215/S0012-7094-87-05413-5.full: no PDF link
- ref-69: Good Reduction of Abelian Varieties; the DOI's landing page: the landing page https://www.jstor.org/stable/1970722?origin=crossref is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open)
- ref-70: J. H. Silverman, *The Arithmetic of Elliptic Curves*, 2nd ed., Graduate Texts in Math. 106, Springer, 2009.; Bibliographic resolution through the source service found no legal source.
- ref-73: Number theoretic background; the DOI's landing page: the landing page https://connect.liblynx.com/wayf/6ae25440153a8da8eb26b84c669f3de7 is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open)
- ref-74: J. Tate, *Local constants*, in A. Fröhlich (ed.), Algebraic Number Fields: L-functions and Galois Properties (Durham 1975), Academic Press, 1977, 89–131, prepared with C. J. Bushnell and M. J. Taylor.; Bibliographic resolution through the source service found no legal source.

Eleven further works resolved only to paywalled pages and remain **uncertified**, cited by locator alone: `borel` (Linear Algebraic Groups), `ref-14` (Bushnell–Henniart, Local Langlands for GL(2)), `ref-20` (Cline–Parshall–Scott, finite Lie-type cohomology I), `ref-25` and `ref-26` (Deligne, Weil I and II), `ref-39` (Khare–Wintenberger II), `ref-67` (Serre, Chebotarev applications), `ref-71` (Silverman, Advanced Topics), `ref-76` (Thorne, 2-adic unitary automorphy), `schneider` (p-adic Lie Groups), and `serre-local-fields`. These settled access statuses are not requests to bypass access restrictions and were not added as missing requests.

`ribet1976` was obtained from the author's legal copy, but is image-only and the available extraction contains no readable proposition text; OCR is unavailable. In particular its p.154 locator is not certified. Some BK displayed formulas are also extraction-damaged; readable prose was used only to the extent stated in the source table. No README locator was explicitly labelled “unverified” or “uncertified”; the seeded sample nevertheless encountered these limits.

The source table certifies the specified passages, not every locator in the 77-item bibliography. The numerical table records finite tests, not general proofs of all API assertions; in particular the general-rank enormous/big-image conclusions and the general modular Clebsch–Gordan source are not independently certified by those tests. Ownership searches covered the available indexed heads and main; existence of a similarly named interface in an unlisted revision was not treated as permission to consume that revision. This report does not claim a complete source certification despite the successful Lean elaboration.

## Source issues

- **Error** in cht at the remark after Lemma 2.1.1, printed p.8 (`cht` line 305): the source says an involutive coset representative forces the pairing to be symmetric or antisymmetric over an arbitrary ring; it should be a multiplier-twisted symmetry, allowing different signs on different connected components; affects a stated result.
- **Error** in cht at Corollary 2.5.4 and its proof, printed p.57 (`cht` lines 2723–2740): the source says ℓ>2n−1 suffices for the stated symmetric-power subgroup to be big; it should be strengthened to exclude the SL₂(F₅), n=2 cohomology exception, whose H¹(ad⁰) has dimension one; affects a stated result.
- **Misprint** in bcgp25 at the proof of Proposition 4.11.2, printed p.111, arXiv:2502.20645v1 (`bcgp25` line 4993): the source says the normalized Asai eigenvalues have the form 1,−1,λ,−λ; it should be 1,−1,λ,λ⁻¹; affects the proof.
