<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2454#issuecomment-6674685460 -->
Review (claude) of 144a88d

Verdict: needs_changes

1. **F01** (P3) Library pins and line numbers are stale

   Location: `packages/ArithmeticLocallySymmetricSpacesPartII/README.md` lines 39, 41, 45: "The manifest pin is 6b7abb3c…", "The manifest pin is a91d3aaf…", and the parenthesised line numbers.

   Claim: the Mathlib pin is 6b7abb3c and the Tau Ceti pin a91d3aaf, with declarations at the quoted lines.

   Witness: `lake-manifest.json` of the content checkout pins mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and TauCeti 2fd255d997f47c0b5d834ee416c7015d55444ce5. At those pins every cited declaration exists, but the lines differ:

   | Declaration | README line | At the pin |
   | --- | --- | --- |
   | `Fintype.prod_equiv` (Defs.lean) | 741 | 735 |
   | `Fintype.prod_empty` (Defs.lean) | 753 | 747 |
   | `Finset.prod_pos` | 157 | 160 |
   | `MvPolynomial` | 79 | 80 |
   | `Module.finrank_tensorProduct` / `finrank_baseChange` | 373 / 376 | 372 / 375 |
   | `groupCohomology` | 184 | 183 |
   | `Matrix.SpecialLinearGroup.toGL` | 273 | 369 |
   | `PiTensorProduct.mapMonoidHom` | 532 | 530 |
   | `MonoidHom.pi` | 154 | 156 |
   | `NumberField.IsTotallyReal` / `IsTotallyComplex` | 47 / 209 | 48 / 210 |
   | `TauCeti.symPowerRep` | 59 | 57 |
   | `SymmetricPower.finrank_eq` | 203 | 192 |

   Unchanged: `Finset.prod` 67, `Finset.prod_const_one` 391, `Finset.prod_update_of_mem` 247, `Finset.powerset` 31, `Rep.of` 62, `Matrix.SpecialLinearGroup.map` 225.

   Repair: replace the two pin hashes by 1b1ccf4b088b32fa3f23f2de1127433254a81e1e (Mathlib) and 2fd255d997f47c0b5d834ee416c7015d55444ce5 (Tau Ceti) and the lines by the right column, or drop the line numbers and keep file paths only. Tested: each right-column line was opened at the pin and holds the named declaration.

2. **F02** (P3) Supplier drift: NoncommutativeAndEquivariantIwasawa Lean names and the domain citation

   Location: README line 57: "§0.14 (`twist_free`) … §0.15 (`IwasawaHomology.freeTwist`, `IwasawaHomology.vanish_above_dim`)"; same line, "§F.1 for integral noetherianity, domains in the uniform case".

   Claim: those three backticked declarations are named in NEI §§0.14–0.15, and §F.1 proves that the uniform Iwasawa algebra is a domain.

   Witness: NEI at its head e311e48 (README 4554 lines, `Suggested.lean` 220 lines): none of `twist_free`, `freeTwist`, `vanish_above_dim` occurs in either file. §0.15 names only `rationalHomology_eq_Tor` in prose (README line 665) and states the facts cited (`A⊗W` free of rank `dim W` by the inverse-action formula; `H_i(G,M⊗W)=0` for `i>d`). The domain conclusion for uniform groups is the filtered-ring lemma of §0.5 (line 274, "If `gr R` is a domain, `R` is a domain") applied in §0.8 step 6 (line 394); §F.1 (line 436) asserts noetherianity and the canonical topology only.

   Repair: in line 57 cite "§0.14 (diagonal twist of a free module is free) and §0.15 (`rationalHomology_eq_Tor`, the free-twist homology and the vanishing above `dim G`)" without the three names, and cite "§F.1 for integral noetherianity and the canonical finite-module topology, §§0.5 and 0.8 for the domain property in the uniform case". Then the citations resolve at the head; the `*Needs:*` lines of §§1.1–2.6 already cite only section numbers and need no change.

3. **F03** (P3) Locator slips into fu24

   Location: README line 462 (§3.4) and line 503 (§4.2): "§7, pp. 23–24, equations (38)–(39)"; line 301 (§2.2): "p. 22, equation (33) and its following inequality".

   Claim: fu24 has an equation (39), and the inequality following (33) is on p. 22.

   Witness: fu24's last numbered display is (38) (fu24 line 1168, p. 23); the bound `dim H^q(Y(K_f),V_k) ≤ Σ dim H_i(G, H̃_j ⊗ W_k)` and `≤ p_{K_f}(k)` on p. 24 (fu24 lines 1172–1179) is unnumbered; a search for "(39)" in the text returns nothing. The inequality after (33) is fu24 lines 1135–1138, p. 23.

   Repair: write "§7, pp. 23–24, equation (38) and the unnumbered bound following it" in §3.4 and §4.2, and "pp. 22–23, equation (33) and its following inequality" in §2.2.

4. **F04** (P3) Process residue in References

   Location: README line 786: "… Annals of Mathematics 175 (2012), 1629–1651 (fu24 line 1214); these locators use v1".

   Claim: none; a cache line number of the extracted source text is cited in the roadmap.

   Witness: "(fu24 line 1214)" is a locator into the worker's extracted text, not into the published work; the house style excludes machine locators from the roadmap text.

   Repair: delete "(fu24 line 1214)"; the published title and journal reference already identify the version distinction, and fu24's bibliography entry [Mar12] can be cited as "fu24, References, [Mar12], p. 24" if a locator is wanted.

5. **F05** (P3) aw14 is cited for a deformation index it excludes

   Location: README line 784 (References): "Use Theorems 4.6 and 5.4, pp. 11 and 16, with deformation index n≥0"; line 75 (gap:integral-central-faithfulness) cites "aw14, Theorems 4.6 and 5.4" for the first-congruence group.

   Claim: aw14 Theorems 4.6 and 5.4 cover the congruence kernel of index zero, i.e. `ker(SL₂(ℤ_p)→SL₂(𝔽_p))`.

   Witness: aw14 §5.4, lines 730–737 (p. 16): the standing hypothesis is `p^n 𝔤 = (1/p) R⊗L_G` for an integer `n > 0`, "for example … `G = ker(G(O_L)→G(O_L/p^{n+1}O_L))`" with `n > 0`; the first congruence kernel is `n = 0`. Fu's own remark (fu24 lines 168–171, p. 4) says Theorem 1.5 "can be deduced from" these results without stating the reduction; Fu's §5 proves the index-zero case directly, with the issues recorded as E3 and E5.

   Repair: in line 784 write "with deformation index n≥1; the index-zero (first-congruence) case is the content of gap:integral-central-faithfulness, whose supplier either reduces to n≥1 or follows fu24 §5 with the E3/E5 repairs", and in the gap paragraph at line 75 add "(aw14 covers n≥1 directly)". This keeps the gap's `needs` sentence unchanged and precise.

No P1 or P2 finding. The mathematics of every sampled target, the two headline statements of `Suggested.lean`, the six declared gaps and the supplier citations were checked and hold; the five findings are locator, pin and residue repairs. A fix round applies them before the port.

## Verified sound

**Principles.** No route-specific shortcut (all weights, all congruence levels, all `t∈ℕ^d`), no re-planned roadmap (every foundation is cited to ArithmeticLocallySymmetricSpaces, CompletedCohomologyPartII, NoncommutativeAndEquivariantIwasawa, LieHighestWeight, Chebotarev, ModularForms, ModularSymbolsPadicLFunctions, GL2AutomorphicRepresentationsAndTransfer, AutomorphicFormsOnReductiveGroups), no copied passage, no algorithm, no sorry'd data, no `set_option`. Untrusted text contained no instruction.

**Elaboration.** `lake build TauCeti.RepresentationTheory.ClassicalGroups.SymmetricPower` then `lake env lean packages/ArithmeticLocallySymmetricSpacesPartII/Suggested.lean` from the content checkout: exit 0, exactly two warnings, both `declaration uses 'sorry'` (lines 66 and 85). Imports: `import Mathlib` and one `TauCeti.*` module that exists at the pin. No `lemma`, no `set_option`, no `#eval`.

**`#check @` comparison.** Elaborated in a scratch copy: `embeddingStdRep : {F} → [Field F] → [NumberField F] → (F →+* ℂ) → (Γ : Subgroup SL(2, 𝓞 F)) → ↥Γ →* GL (Fin 2) ℂ`; `weightRep : … → (Γ : Subgroup SL(2, 𝓞 F)) → ((F →+* ℂ) → ℕ) → Rep ℂ ↥Γ`. The two theorems carry `¬IsTotallyReal F`, `𝔞 ≠ ⊥`, the kernel containment, and (Bianchi) `IsTotallyComplex F`, `finrank ℚ F = 2` in their own signatures; there are no section variables, so nothing was dropped. Every elaborated type matches its README statement (§3.1, §4.2, §5.8).

**Padding probe (every sorried theorem).** `finrank_groupCohomology_weightRep_le`: `simp` made no progress; `infer_instance` fails (not a class). `bianchi_groupCohomology_linear_growth`: `simp` leaves the existential goal; `rfl` fails. Neither restates a definition, mirrors a Check or computes a value. A boundary probe `finrank ℂ (weightRep Γ 0) = 1` does not close by `simp [weightRep]` either, and is not in the file. No padding.

**Headline theorems (README line 13).** Three: Fu's local homology theorem (§2.6), the sharp cusp-form bound with its ordinary-cohomology form (§4.2), the two-sided Bianchi bounds (§5.8). Stated: the ordinary-cohomology form of §4.2 and the ordinary degree-one/two form of §5.8. Named in the docstring as not statable, with the missing carrier: §2.6 (Ore division ring, skew rank, rational completed Iwasawa homology with diagonal twist: Tau Ceti has `TauCeti.completedGroupAlgebra` in TauCeti/NumberTheory/Padics/Measure/CompletedGroupAlgebra.lean but no Ore rank or completed Tor), the adelic `S_κ(K_f)` (§§4.2–4.4), the cuspidal/interior/compact-support forms (§5.8). Correct split.

**Backticked names of this roadmap.** `embeddingStdRep`, `weightRep`, `finrank_groupCohomology_weightRep_le`, `bianchi_groupCohomology_linear_growth` are the only own names in the README and all are declared. `roadmaps resolve` found no cross-roadmap citation missing; its two Lean-name leads are R02.

**Dependency check.** `tauceti-roadmap gate --depcheck … --movable`:

```text
depcheck: 242 roadmaps, 2481 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Merge order: NoncommutativeAndEquivariantIwasawa (29), ArithmeticLocallySymmetricSpaces (74), AutomorphicFormsOnReductiveGroups (75), GL2AutomorphicRepresentationsAndTransfer (99), ModularSymbolsPadicLFunctions (130), CompletedCohomologyPartII (207) all precede this roadmap (208); LieHighestWeight (TauCetiRoadmap/RepresentationTheory/LieHighestWeight), Chebotarev (Completed/Chebotarev) and ModularForms are on main.

**Supplier citations resolved at the heads** (ALS 360d0bc, CCPII 1788162, NEI e311e48, MSPL 1c1215a, GL2ART 769f46a, AFRG 753cac0; main for the rest): ALS §§0.9, 0.10, 1.1, 1.6, 1.7, 1.8, 2.5, 2.8, 3.6, 4.1, 4.5–4.7, 5a.2, 5b.4, 5b.5 (headings at its README lines 1500–4460; §5b.5 states the cuspidal map with image in interior cohomology; §3.6 the trace as corestriction; §5a.2 duality with dual coefficients and orientation twist at neat level). CCPII §3.1 (inverse-action contragredient), §4.2 (completed chain model over `TauCeti.completedGroupAlgebra`), §5.1 (finite generation, canonical topology), §5.6–5.7 (torsion when no real discrete series, for a connected semisimple group over a number field with `K₀` the closure at a prime: the README's choice base field ℚ, group `Res_{F/ℚ}SL₂`, ideal `(p)` fits these hypotheses and gives `K₀=∏_{v|p}G_v`), §6.3 (descent spectral sequence with diagonal twist, citing Fu (38)). NEI §F.1, §0.12 (rational global dimension `d`, `p`-torsion allowed), §0.14, §0.15 (homology as `Tor^A`, finite dimensional, zero above `dim G`, free twist), §1.12 (Ore localisation flat): sections exist and state what is consumed (names: R02). MSPL §0.7: Eichler–Shimura `S⊕S̄≅H¹_par` for every finite-index Γ, descending from `Γ∩Γ(M)`, compatible with every double-coset and normaliser action, with `ψ_f|ι=(−1)^k conj(ψ_{fᶜ})`: exactly the input §5.3 uses at Γ(N) for all N≥1. GL2ART §R16.2.9 (unicity of the supercuspidal type), §R16.6.3 (Hilbert weight representation: totally real, real embeddings, determinant twist; different object, correctly deferred in Scope), §§R17.4.2–R17.4.6 (prime-cyclic base change, all-place compatibility, descent, cuspidality criterion, cuspidal fibres: quadratic is ℓ=2). AFRG §1.1, §5.2 (cohomology with specified coefficients; the `D_k`/`Sym^{k−2}` Check gives the real-place degree-one contribution), §5.3 (tempered range). LieHighestWeight Layer 0 (`sl₂`, `V(n)` as `Sym^n`, irreducibility) and Layer 3 (PBW, Verma). Chebotarev Layer 10 (`hasDirichletDensity_frobeniusPrimeSet`, density of split-completely primes, infinitude). ModularForms 10C (section spaces and dimension formulas).

**Ownership.** `roadmaps grep` over main and the 459 open heads for proper-face polynomials, multiplicity-free polynomials, Finis–Grunewald–Tirao, Fu's bounds, `weightRep`, `embeddingStdRep`: no match outside this package. BianchiModularForms (#1719) and KleinianGroups (#432) mention only Elstrodt–Grunewald–Mennicke; neither states weight-aspect growth. The board index lists three packages (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory), none overlapping. Ownership against open pull requests whose files the brief did not provide was not checked beyond this grep.

**Declared gaps.** All six have supplier NoncommutativeAndEquivariantIwasawa, the same slug in `design/plan.json` and in the README's `## Exact supplier contracts`, a one-sentence `needs` with hypotheses, and ask for nothing the pins or an earlier roadmap provide (Mathlib's `Module.Flat` is commutative-only; NEI §1.12 is a bimodule statement about an already-supplied Ore set; the Ore division ring and skew rank, the microlocalisation `A→Û`, the quotient comparison, the central faithfulness and the cyclic growth bound exist nowhere at the pins or on the heads). The generic-cyclic-growth bound was re-derived: with `x=k+1`, `y=x−α≥1`, `∏x²−∏y²=(∏x−∏y)(∏x+∏y)≤2∏x·Σ_iα_i∏_{j≠i}x_j`, so Fu's bound divided by `∏x` is `≤2Σ_iα_i∏_{j≠i}x_j`, and on a strip `k_i<α_i` one has `dim Hom≤dim W_k=x_i∏_{j≠i}x_j≤α_i∏_{j≠i}x_j`; both regimes are covered by the one polynomial. Acceptance after the fix round is conditional on these six gaps.

**Source sample, at the text.** fu24 (arXiv v2, page markers at lines 4–1227): Theorem 1.2 line 89 p. 2 (`dim S_k(K_f)≤(min k_i)⁻¹O(Δ(k))`, parallel `O(k^{r−1})`); Corollary 1.3 line 95 p. 3; (2) line 80 p. 2; Theorem 1.4 line 130 p. 3 (rank `d`, multiplicity-free polynomial of degree `≤r−1`, both bounds); p. 4 line 142 (canonical dimension 0 ⇒ finite dimensional, by AW13 Lemma 10.13); Theorem 3.2 line 405 p. 8; Lemma 3.3 line 447 p. 9 (rank `∏(d_i+1)²`); Proposition 3.4 line 492 p. 10; (16) line 675 p. 13; (17)–(18) lines 688–696 p. 14; Theorem 4.3 line 725 p. 15; Lemma 5.6 line 941, Theorem 5.7 line 975 p. 20; §6 lines 1044–1149 pp. 21–23: (32) line 1113, (33)–(34) lines 1122–1123, cyclic torsion filtration line 1128, (35)–(36) lines 1145–1147; §7 lines 1150–1181: (37) line 1161, (38) line 1168, unnumbered bound lines 1172–1179 p. 24. marshall12 (v1): §2.1 (4) line 129 p. 4 with hypothesis `dim W_d>1` and `H_c` defined as classes vanishing near the cusps (line 123); §2.2 (7) line 174 p. 4; §5 (29) line 609 p. 15; Lemma 11 lines 631–659 pp. 15–16 (Galois-closure realization). fgt10 (v1): §1 (1.2)–(1.8) lines 127–166 pp. 3–4 (cuspidal = kernel of boundary restriction; degree-one image is half the boundary, equal to the cusp count when `Γ∩P⊆±U`; degree-two restriction surjective except `n=m=0`); §3.2 lines 937–968 pp. 16–17 (`tr∘res=[Γ:H]`); §3.3 (3.9)–(3.10) lines 978–985 p. 17; (4.4) line 1073 p. 19; Definition 4.3 line 1094 p. 20; Proposition 4.10 line 1194 p. 22; Proposition 4.11 line 1210 p. 23 (at principal `𝔞` the second sum is empty); Theorem 4.17 line 1288 p. 24 with `c₂=2^{|R|−4}` exactly when every odd `p∈R` is `1 mod 4`; Proposition 4.18 line 1340 p. 25; Lemma 4.19 line 1375 p. 26 (dimensions, traces, parities as in §5.4); Corollary 4.20 line 1417 p. 27. aw13: §10.12 line 3598 p. 77 (hypothesis `p^{m+1}𝔤=R⊗L_G` with `m>0`), §10.13 Lemma line 3623 p. 77 (`d(M)=0` iff finite dimensional). aw14: §4.6 Theorem line 491 p. 11; §5.4 Theorem line 742 p. 16 (R05). serre77: I §1.5.3 line 625 p. 20; I §4.2 (c) lines 1521–1530 p. 52; II §2.8 amalgam sequences lines 5190–5196 p. 169.

**Adversarial table** (sampled targets, headlines, and every target a finding touches).

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §0.1 proper-face class | `m=1`; `m=3`, `c_∅=2`, `c_{02}=3`, `x=(2,5,4)`; `m=2`, `c_{1}=7`, `x=(1,t)` | constant; `2+3·2·4=26`; `7t` | as stated; the full monomial is never generated |
| §0.2 saving | each proper `s`, `j∉s`, `x_j≥a` | `∏_{i∈s}x_i≤D(x)/a`; `m=1`: `c_∅≤c_∅x/a` | sound; diagonal exponent `m−1` |
| §0.3 `W_k`, action quotient | `k=0`; `k=(1,2)`; `m=1,k=2` | dim 1; `2·3=6`, quotient `36`; dim 3 | matches fu24 (32); Burnside on absolutely irreducible `W_k` |
| Conventions, Casimir | highest weight `k`, `ev=0` | `ef v=hv=kv`, `Δ=½k²−k+2k=½k(k+2)`; `k=0,1`: `0, 3/2` | sign convention pinned |
| Conventions, untwisting | `p=3`, `g=(1 3;0 1)`, `h=(1 0;3 1)` | `gh=(10 3;3 1)`, `hg=(1 3;3 10)`, `g⁻¹(0,1)=(−3,1)` | inverse-action formula excluded from same-action |
| §1.1 Hom/coinvariant duality | `M=A` | both sides `dim W` | fu24 line 1120 |
| §1.2 cyclic bound | `δ=1`; `δ=0`; `m=1` | `0`; `D(k+1)` (excluded); constant | hypotheses `δ≠0`, `α_i≥1` present |
| gap generic-cyclic-growth | `m=1,k≥α`; `α=(3,3),k=(1,t)`; `d=(1,2)` | `2α−α²/(k+1)≤2α`; `2(t+1)≤6(t+1)+12`; rank `36` | E6 repair verified in both regimes |
| gap integral-central-faithfulness | `p=3, λ=1` | `μ=−1±√3`, `v₃(3)=1` odd | finite extension needed, as stated; R05 on the index |
| §1.3 torsion filtration | `ℚ_p[X,Y]`, `T=A/(X,Y)` | controlled by `A/(X)`, not equal | surjection, not isomorphism, as stated |
| §2.1 free approximation | `M=A^a`; `M=A/Aδ`; `(X,Y)⊂ℚ_p[X,Y]` | `T=N=0,ℓ=a`; `a=0,ℓ=1`; rank 1, `ℓ=2` | `ℓ≠a` in general, as stated |
| §2.2 upper estimate | free `M`; `ℓ=1,k=(1,2)` | error 0; `H₀` dim 6, higher 0 | right exactness only |
| §2.3 lower estimate | `a=0`; general | `≥−U_N`; `ℓD−((ℓ−a)D+U_N)=aD−U_N` | leading coefficient `a` |
| §2.4 two-sided | `M=A^a`; `m=1` | 0; bounded | `U_M+U_N` proper-face |
| §2.5 degree one | fu24 (35) | `dim H₁(M)=dim H₀(N)−ℓD+dim H₀(M)≤(ℓ−a)D+U_N−ℓD+aD+U_M=U_N+U_M` | main terms cancel |
| §2.6 local theorem | `m=1`; `p=2`; `M=A^a`; `i>3m` | constants; `(1−g)(1+g)=0` for `g=−I` (excluded by odd `p`); exact; 0 by NEI §0.12 | polynomial independent of `i,k` |
| §2.7 finite support | `M=W_k`; `M=A` | `d=0`, dim `D(k+1)`; `d=3m`, infinite | `dim Hom≤length≤dim M` by left exactness and `End(W_k)=ℚ_p` |
| §3.1 weights | `(0,1),κ=6`; `(1,1),κ=(4,6)`; `κ=(2,…,2)` | `t=(2,2)`, dim 9, `Δ=36`, `min x=3`; `t=(2,2,2)`, dim 27, `Δ=144`; `t=0`, dim 1, `Δ=2^d` | `D(x)≤Δ`, `min x≥min κ/2` |
| `weightRep`, `embeddingStdRep` | `F=ℚ(i)`, `γ=(i 1;−1 0)`; `t=(1,0)`; `t=0` | `det=1`, traces `i,−i`, on `E₁`: `i·(−i)=1` (same embedding: `−1`); `−I↦−1`, all `H^i(SL₂(ℤ[i]),·)=0`; empty tensor, dim 1 | Lean body: `Sym^{tσ}(std∘σ)` over all `σ`, assembled by `PiTensorProduct.mapMonoidHom`; the conjugate factor is the conjugate embedding |
| §3.2 auxiliary prime | `p∤𝔞`, `p` split in the normal closure | `K′_f=G·K^p⊆K_f(𝔞)`, index fixed before `κ` | Chebotarev Layer 10 gives infinitely many |
| §3.3 realization | `κ=2`; `L/ℚ_p`; `O→^p O` mod `p` | constant system; dims `1` over `L`, `[L:ℚ_p]` over `ℚ_p`; extra homology | field comparison only, as stated; marshall12 Lemma 11 |
| §3.4 descent | `F` imaginary quadratic | `d=2`, `dim K₀=6`, cutoff 6; `E²_{ij}` for `i≤3d`, `j≤2r₁+3r₂` | one `Q` from finitely many `B_{M_j}`; no degeneration claimed |
| §4.1 cuspidal degree | `(0,1)`; one real place | `q=1`, factor `2⁰=1`; factor 2 | marshall12 (4) with `dim W_d>1` |
| `finrank_groupCohomology_weightRep_le` | `F=ℚ`, `Γ=SL₂(ℤ)` (excluded) | `dim H¹(Γ,Sym^k)=2dim S_{k+2}+1`: `3` at `k=10`, `5` at `k=22`; right side with `a=k+1` constant | `¬IsTotallyReal` necessary |
| same | `ℚ(i)`, `t=(n,n)`, `a=n+1` / `a=1`; `t=(n,0)`; `t=0`; `i=0` | `≤C(n+1)` / `≤C(n+1)²`; `C(n+1)`; `dim H^i(Γ,ℂ)≤C`; `H⁰` dim `≤1`, `a=1` | saving from `a`; no false saving |
| same, context | `𝔞=⊥`; `Γ′=SL₂(F)∩K′_f` | kernel trivial, infinite index possible; `Γ′⊆Γ(𝔞)⊆Γ`, `cor∘res=[Γ:Γ′]≠0` | `𝔞≠⊥` kept; restriction injective without neatness |
| §4.3 parallel | `(1,1)` | `κ³/κ=κ²` | exponent `d−1` |
| §4.4 Bianchi upper | `κ=6` | `E₂`, dim 9 | `a=n+1` |
| §5.1 cusp torus | `n=0`; `n=2`, `z₁=1,z₂=i` | `1,2,1`; matrix `(1 1;i −i)`, det `−2i`; Koszul `(9,18,9)`, ranks `(8,8)` from `ker e⊗ker e` and `coker e⊗coker e` one-dimensional, cohomology `(1,2,1)` | fgt10 §1: image of degree-one restriction `c`, half of `2c` |
| §5.2 support bridge | `i=1,2` | `dim H_c^i−dim H^i∈[−b_i,b_{i−1}]`, `|·|≤2c≤3c`; `n=0`: `H_c³≅ℂ`, degree-two cokernel 1 | fgt10 p. 4 lines 150–152 |
| §5.3 fixed-type formula | `N=1,k=12`; `k=2`; amalgam `W=V₁₀` | `11/12−1/2+1/4+1/3=1`; `1/12−1/2−1/4−1/3+1=0`; `11−5−3+0=3=2dim S₁₂+1` (`ℤ/4` invariants `j` odd: 5; `ℤ/6` invariants `j≡2 mod 3`: 3) | serre77 II §2.8 sequence gives `dim W−dim W^{ℤ/4}−dim W^{ℤ/6}+dim W^G` when `−I` trivial |
| same, negative control | `N=3,k=4,σ=ω` | `dim S₄(Γ(3))=3·(−1)+4=1`; `3/12+1/4=1/2`; `σ=ω⊕ω̄`: `6/12+2/4=1` | hypothesis `σ^ι≃σ` necessary (E10) |
| same | `N=2`, `k=6,8`, types `(1,sgn,std)` | `k=6`: `0,1,0`, total `1=6/2−2`; `k=8`: `0,0,1`, total `2`; reversed `ε`: `1/2` | sign of `ε_k` pinned |
| same | `N=3,k=3,5`, `σ=ρ₀` (2-dim, ι-stable) | `k=3`: `1/3−1/3=0=dim S₃(Γ(3))`; `k=5`: `2/3+1/3=1`, `2·1=2=dim S₅(Γ(3))` | odd weights, `σ(−I)=−1` |
| §5.4 types | `ℓ=2,ν=2`; `ℓ=2,ν=3`; `ℓ=3`; `ℓ=7` | PS dim 6, traces `(0,0)`; sc dim 2, `(2,0)`, parity `−1`; dims 12, 4, sc `(−2,0)`; PS 4, `(1,0)`; sc 2, `(−1,2)`, parity `+1`; sc `S₄` trace `−2` | fgt10 Lemma 4.19; at `ℓ=3` the cuspidal type of the order-4 character of `𝔽₉^×` has `S₄`-trace `−(θ(i)+θ(i³))=2` and `S₃` (unipotent mod 3) trace `−1` |
| §5.5 count | principal `𝔞`; `ℚ(i)`; `ℚ(√−3)`, `n=0,1,2` | `ω_L(1)=1`, second sum empty; `ℒ(ℚ(i))=∅`, correction `ν/2`; `ν=(0,0,1)` | fgt10 Props 4.10–4.11 |
| §5.6 positivity | `ℚ(i)`; `B_F≠0` | `A=5/24`, `B=1/8`, `A−B=1/12`; `2∉R` forces `d≡1 mod 4` for `−d≡1 mod 4`, contradiction; `A/B=(2/3)·((2^ν+1)/2)·∏(ℓ+1)/2≥(5/3)3^{s−1}>1` | fgt10 Theorem 4.17 constants |
| §5.7 lower bound, non-neat degree two | `Q=Γ/Γ′`, orientation | `H²(Γ)=H²(Γ′)^Q⊇H_!²(Γ′)^Q`; pairing to `H_c³=ℂ` with trivial `Q`-action; `dim(V^*)^Q=dim V^Q`; `E_n≅E_n^*` | route sound; reversing orientation would twist the dual |
| `bianchi_groupCohomology_linear_growth` | `Γ=SL₂(ℤ[i])`, `n=0`; `n=99,100` | `H¹(Γ,ℂ)=0`; leading `1/3·100≈33.3`, `1/12·101≈8.4` | `n₀` needed; two constants, no limit |
| same, context | `[IsTotallyComplex F]`, `finrank ℚ F=2`; `−I` on `E_n` | imaginary quadratic; `(−1)^{2n}=1` | no central vanishing |
| §5.8 four conventions | neat `Γ`, `i=1,2` | `H_cusp^i=H_!^i⊆H^i`, `H_c^i` within `3c` of `H^i` | constants absorbed by threshold |
| E8 | `r=1/p`, `λ_n=p^{−n}` | `|λ_n|r^n=1` for all `n` | partial sums not Cauchy |
| E9 | ramification index 2 | `p=uϖ²∈𝔪²`, `0∈p+𝔪²` | fu24 (17) needs `ℤ_p` or unramified base |

**Duplication by object.** `groupCohomology` (Mathlib, line 183: homology of the inhomogeneous cochain complex of a `Rep`, no topology), the principal congruence kernel as `(SpecialLinearGroup.map (Ideal.Quotient.mk 𝔞)).ker`, `TauCeti.symPowerRep` (abbrev at line 57, `(stdRep k n).symmetricPower d` with `stdRep` matrix-vector action, Standard.lean line 40), `SymmetricPower.finrank_eq` (line 192, needs `StrongRankCondition`, `Module.Free`, `Module.Finite`): consumed, not restated. `TauCeti.completedGroupAlgebra` exists (three files under TauCeti/NumberTheory/Padics/Measure and TauCeti/RingTheory/Iwasawa) and is correctly cited as present but insufficient for §2.6.

**README shape.** Summary, Scope, Conventions with Checks, Exact supplier contracts (per supplier, gaps with Checks), How to read the build, Layers 0–5 each ending in Examples and Dependencies, Downstream consumers, Source corrections, References. Definitions (§0.1, §0.3, §2.1, §3.1, §3.3, §5.4) carry API bullets and at least three Checks; every theorem states its hypotheses and a locator; `*Needs:*` lines cite sections, Mathlib and Tau Ceti names and gaps only, never a pull-request number. Unicode mathematics throughout. Process residue: only R04.

## Not verifiable

- Marshall's published Annals pagination (cited in CCPII §6.3 as pp. 1646–1648) was not opened; the roadmap itself cites only the arXiv v1, which was read.
- Ardakov–Wadsley's Münster Journal and Annals pagination were not opened; the author versions recorded in the manifest were read at the locators above.
- Ownership against open pull requests whose files the brief does not provide was checked only by `roadmaps grep` over the indexed heads.

## Source issues

- **Misprint** in fu24 at Theorem 1.2, p. 2: the source says the minimum runs over `1≤i≤r` with `r=[F:ℚ]`; it should be over the `r₁+r₂` archimedean weights `k_i`; affects nothing.
- **Error** in fu24 at §4, equation (16), p. 13: the source says the completion `D_r(G,K)` is the space of series with bounded weighted coefficients; it should be the series whose weighted coefficients tend to zero (for `r=1/p` and `λ_n=p^{−n}` the partial sums are not Cauchy); affects the proof.
- **Gap** in fu24 at §4, equation (17), p. 14: the source says the microlocal Ore set is `∪_a(p^a+𝔪^{a+1})` over the ring of integers `R` of any finite extension; for ramified `R` one has `p∈𝔪²` and the set contains `0`; it should be taken over `ℤ_p` or an unramified base with ramified coefficients obtained by scalar extension; affects the proof.
- **Error** in fu24 at Theorem 3.2 and proof, pp. 8–11: the source says the final bound `(∏(k_i+1)²−∏(k_i−α_i+1)²)/∏(k_i+1)` holds for all `k`; it is derived only for `k≥α` and the strips `k_i<α_i` are infinite; it should use `dim W_k≤α_i∏_{j≠i}(k_j+1)` there, giving the common bound `2Σ_iα_i∏_{j≠i}(k_j+1)`; affects the proof.
- **Error** in fu24 at Theorem 5.7, p. 20: the source says `D^λ_r(G,ℚ_p)` is an integral domain for every `λ`; its own proof shows the quotient is the zero ring when `v(λ₀)≤1`; it should restrict to the parameter regime where `gr(p²Δ+λ₀)` is not a unit; affects a stated result.
- **Gap** in fu24 at proof of Theorem 5.7, p. 20: the source says the `r′`-filtration on `D_r` has the same graded ring as `D_{r′}` by density; density alone gives neither separatedness nor the ideal-contraction identity needed to pass the domain property to `D^λ_r`; it should prove the filtration on the quotient separated; affects the proof.
- **Error** in fgt10 at Proposition 4.18, p. 25: the source says the fixed-type formula holds for every representation `σ` of `SL₂(ℤ/N)` with `σ(−I)=(−1)^k`; for `N=3`, `k=4` and `σ` an order-three character it gives `1/2` while the true multiplicities are `1` and `0`; it should assume `σ∘Ad(diag(−1,1))≃σ` (satisfied by restrictions of `GL₂(ℤ/N)`-representations, so Theorem 4.17 is unaffected); affects a stated result.
- **Misprint** in fu24 at Corollary 1.3 and equation (2), pp. 2–3: the source says `H^n_c` for the compactly supported cohomology; Marshall's `H_c` of §2.1 is the subspace of classes vanishing near the cusps, and the two differ by the boundary contribution; it should say interior or cuspidal cohomology; affects nothing (the bounds transfer by the bounded boundary maps).
- **Gap** in fu24 at Theorem 1.5, p. 4: the source says the theorem can be deduced from aw14 Theorems 4.6 and 5.4; those are stated for congruence kernels of deformation index `n>0` and the group of Theorem 1.5 has index `0`; it should give the reduction; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "144a88dd5113e7e44745cbe31e31a2d96605bff8", "job": "REV-PKG-ArithmeticLocallySymmetricSpacesPartII", "model": "fable", "worker": "chris-x10"} -->
