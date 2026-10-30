# Review of WeightsInEtaleCohomology (pull request #1001 at 501bdc1)

**Verdict:** accepted

This is a full re-review of the repaired head (243 changed lines since 84a13f1). The four findings of the previous review were checked first, then the whole roadmap: principles, a fifteen-target source sample against the cached texts, the adversarial pass with computed values, the duplication and ownership audit, the supplier-order check, the README shape, the Lean file (elaboration, `#check` of every declaration, one-tactic probes) and headline coverage. Two P3 notes remain; no P1 or P2 finding.

## Repairs of the previous review (84a13f1)

- **r1 R01 (P1), nonexistent crystalline declaration names.** Repaired. `TauCetiRoadmap/WeightsInEtaleCohomology/README.md:450` now reads “specifically ‘Proper smooth crystalline Gysin maps’, clauses (2)–(3), for projection and composition, and ‘Diagonal class and crystalline coevaluation’, clause (2), for the identity action”. At CrystallineCohomology's open head, `TauCetiRoadmap/CrystallineCohomology/README.md:7425`–7432 state clause (2) (projection formula `f_*(x∪f^*y)=f_*x∪y`) and clause (3) (`(g∘f)_*=g_*∘f_*`), and lines 7529–7531 state clause (2) of the diagonal paragraph (`pr_{2*}([Δ]∪pr₁^*x)=x`). The README's remark that the two projections are exchanged relative to its own orientation `(pr₁)_*(cl(Γ)∪pr₂^*(−))` is correct. The three invented identifiers no longer occur anywhere in the folder.
- **r1 R02 (P2), re-planned general semistable comparison.** Repaired. Lines 28, 114, 481, 485, 510–518 and the Layer 3 `*Needs:*` line (534) now consume PadicHodgeTheory §§8.1–8.2 and AInfCohomology §§AI.6.4–AI.6.6; §3.10 is retitled “Saito-specific semistable-period identifications” and keeps only the model verification, the `L_μ` and `C_μ` extension, the correspondence restriction and the Weil-descent identifications. At PadicHodgeTheory's open head, `TauCetiRoadmap/PadicHodgeTheory/README.md:1385`–1412 state the `B_st` comparison for proper formal models with semistable charts, with total monodromy `N_HK⊗1+1⊗N_Bst`, raw uniformizer monodromy divided by the absolute ramification index, and the filtered `B_dR` agreement; lines 1414–1424 (§8.2) supply pullback, cup product, base extension, duality, the normalized top Tate line and the rule that a projector restricts the comparison only when supplied geometrically on both realizations. AInfCohomology's headings AI.6.4 (line 2984), AI.6.5 (3291) and AI.6.6 (3500) are the log-crystalline specialization, the canonical `B_dR⁺` deformation and the `B_dR⁺`/étale comparisons the README names. Merge order: AInfCohomology 53, PadicHodgeTheory 107, this roadmap 131; neither CohomologyComparisons (161) nor any later roadmap is cited.
- **r1 R03 (P3), unrecognized target headings.** Repaired: six `## Layer k:` headings and numbered `### k.n` subsections (the former “Arithmetic construction contracts” are now §§3.7–3.10 and 5.5–5.7). The gate reports `target-ids=0` and `OK`.
- **r1 R04 (P3), library namespace.** Repaired: `TauCetiRoadmap/WeightsInEtaleCohomology/Suggested.lean:41` and 65 open and close `TauCetiRoadmap.WeightsInEtaleCohomology`; the elaborated names (below) are `TauCetiRoadmap.WeightsInEtaleCohomology.newformHeckePolynomial` and `…newform_ramanujan`.

## R01 (P3) — Two Lean-style names exist nowhere

**Location:** `TauCetiRoadmap/WeightsInEtaleCohomology/README.md:3` and 146, “The representation predicates lie in `TauCeti.Weights.GaloisRep`” and “In `TauCeti.Weights.GaloisRep`, construct the three predicates”; line 720, “Define `HasCommonGoodPrimePolynomials` on this family”.

**Claim:** A backticked dotted or CamelCase name is read as a library module or as a declaration of this roadmap's `Suggested.lean`.

**Witness:** The pinned Tau Ceti (`a91d3aa`) has no `TauCeti/Weights` directory; `Suggested.lean` declares only `newformHeckePolynomial` and `newform_ramanujan` (the `#check` run below). Every other backticked identifier in the README resolves (the table under “Verified sound”).

**Repair:** Say both in prose: “the representation-predicate module of this roadmap” and “Define the common good-prime polynomial predicate on this family to mean …”. No mathematics changes; the predicate's API bullets at line 720 already describe it in prose.

## R02 (P3) — Layer `*Needs:*` lines omit suppliers their targets cite

**Location:** `TauCetiRoadmap/WeightsInEtaleCohomology/README.md:534` (Layer 3) and 834 (Layer 6).

**Claim:** Every layer ends with its dependencies.

**Witness:** §3.4 consumes DeligneWeightsAndPurity §4.3 (line 425) and §0.12 (line 431), and §3.5 consumes EtaleCohomologyFoundations §§F.2, F.5–F.6 (line 450); the Layer 3 line lists neither DeligneWeightsAndPurity nor §§F.5–F.6. §6.5 consumes ClassFieldTheory Layers 11–12 and EtaleCohomologyFoundations §§F.5–F.6 (line 791) and PadicDifferentialEquationsAndRigidCohomology §RD.7.7 (line 818); the Layer 6 line lists none of the three. (Layer 4's line lists §§F.5–F.7 while §4.2 uses §F.4.6, line 564; it is covered through Layer 1's §§F.4.5–F.6.)

**Repair:** Add “DeligneWeightsAndPurity §§0.12, 4.3; EtaleCohomologyFoundations §§F.5–F.6” to line 534 and “ClassFieldTheory Layers 11–12; EtaleCohomologyFoundations §§F.5–F.6; PadicDifferentialEquationsAndRigidCohomology §RD.7.7” to line 834. All five suppliers are earlier in the merge order or on main, so the dependency check is unchanged (its output is below).

## Verified sound

**Gate and dependency check.** My own run of the gate on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The dependency check with the merge order, `--movable` and the content repository printed

    depcheck: 209 roadmaps, 1479 edges, 0 problem(s)

with no UPWARD, CYCLE or `moved:` line. The diff outside the roadmap folder against `origin/main` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`) only.

**Principles.** No route-specific shortcut, no “good primes only” in the sense of the principle (the good-prime restrictions are the sources' hypotheses and the bad-prime data are separate targets), no re-planned roadmap (the general theories are imported from DeligneWeightsAndPurity, LefschetzPencilsAndVanishingCycles, PadicHodgeTheory and CrystallineCohomology, and the ownership audit below found no second owner of this roadmap's constructions), no computational algorithm, no copied passage (the sampled passages were compared with the README's wording), no `set_option`, no sorry'd data, no `lemma`, no LaTeX delimiters, no process words, pull-request numbers or local paths (grep over the folder: zero hits). No supplier gaps are declared and none is needed: every cited section exists where it is cited.

**Source sample.** All nine references and the three Stacks tags were fetched through the sources service from legal places (Numdam, arXiv, the Stacks project, Milne's and Scholl's own pages). Every seeded target's locators were opened at the line-numbered text; printed pages were recomputed from the page markers with the README's offsets.

| Target | Locators opened (source id line N) | Hypotheses and statement as written |
| --- | --- | --- |
| 1.1 Frobenius conventions | WI line 247–252 (p. 279, (1.15): geometric Frobenius `F=φ⁻¹`, `F*=φ⁻¹`); WII line 645 (p. 152, (1.1.13)) | Supports the inverse convention and the closed-point power `F^{deg x}`. |
| 1.2 Pure and integral outside T | LV line 426–432 (Lemma 2.3, p. 9: unramified outside S, roots algebraic of absolute value `q^{w/2}`, integer coefficients); WII line 681–712 (pp. 153–154, (1.2.1)–(1.2.6)) | The three predicates match (1.2.1), (1.2.6) and LV (c); algebraicity is part of Weil purity, not of `ι`-purity, as the README says. |
| 1.4 Restriction and induction | WII line 701–706 (p. 154, (1.2.5)(i)–(ii)); LV line 604–641 (§2.5 and Lemma 2.10, pp. 13–14) | Unramified-place product formula is the roadmap's own linear algebra; the cyclic-block determinant is verified below. |
| 1.5 Continuous eigenvalues | WII line 696–737 (pp. 154–155, (1.2.3), (1.2.6)–(1.2.7)) | (1.2.6) needs every isomorphism `ι`; the transcendental-unit example is the README's, consistent with the remark at line 712. |
| 2.2 Purity at good reduction | LV line 727 (p. 16, (3.2)); AV line 2290–2304 (I Thm 12.1, p. 55), 2365–2369 (Rem 12.5, p. 56: Galois-equivariant `Hom(T_ℓ,ℤ_ℓ)≅H¹`), 2910 (Rem 17.2, p. 70), 3224–3229 (II Cor 1.5 and Rem 1.6(a), p. 78) | Milne's `P_r(t)=∏(1−a_{i,r}t)` is reciprocal, as the README warns. |
| 3.2 Nodes and graph action | C line 590–662 (§§4.1–4.5, pp. 423–424; the residual `A` at 616–646 and the normalization sequence at 648–662); S line 1616–1620 (Claim 5, p. 37) | Carayol keeps `A` and removes it only for cuspidal constituents (4.4); the README does the same. |
| 3.3 Picard–Lefschetz | WI line 534–597 (pp. 287–289, (4.1)–(4.3): sign table `−,−,+,+`, `δ∈Hⁿ(X_η̄)(m)`, `x↦x±t_ℓ(σ)(x,δ)δ`) | The README's `(−1)^{m+1}` reproduces the table (verified below) and keeps the odd/even/characteristic-two branches. |
| 3.8 Model-specific data | C line 590–662 (§§4.1–4.5) | Only the comparison is sourced here; the model is ModularCurvesPartII Layer 11, which exists at its head (line 2968). |
| 3.9 Hilbert and Shimura models | S line 1274–1290 (Lemma 3, pp. 30–31), 1377–1384 and 1389–1402 (§7 and Lemma 4, pp. 32–33), 1497–1505 (Claim 4(1), p. 35); StacksModels line 3574 (tag 0CDC, Example 55.14.1) | `V` is a finite extension of the completed maximal unramified extension (S line 1379–1380); Lemma 4's level, lattice and `p`-component equalities are as restated. |
| 3.10 Saito-specific identifications | S line 505–543 (§2, pp. 11–12, Fontaine's `D` and the Weil action), 1274–1290, 1367–1489 (§§6–8, pp. 30–36) | The `ϕN=pNϕ` misprint at S line 542 is the one the README corrects. |
| 5.1 Parabolic purity | WII line 2640–2651 (p. 206, (3.3.4)–(3.3.6)), 2986–2992 (p. 215, (3.7.1): `Sym^k R¹` pure of weight `k`, parabolic image of weight `k+1`); DM line 667–678 (Thm 5.1, Lemma 5.3, p. 168) | DM's input is conditional on the Weil conjectures there (line 670); WII is unconditional, as the README states. |
| 5.4 Hard Lefschetz | WII line 3047–3051 (p. 217, Thm (4.1.1): `X` projective smooth, `ℒ` ample, `η=c₁(ℒ)`, a chosen `ℤ_ℓ≅ℤ_ℓ(1)`) | The suppressed twist is the one the README restores. |
| 5.5 Classical compactification | DM line 667–745 (Thm 5.1, Lemmas 5.2–5.5, Thm 5.6, pp. 168–170); Sch line 69–103 (§§1.1.0–1.2.1, pp. 1–2), 173–191 (§1.3.3, p. 3) | Scholl's projector lives in `ℤ[1/2n·k!][Γ_k]`; the README's denominator `M^{2r}2^r r!` is `|Γ_r|`. |
| 6.3 Common good-prime polynomials | DFG line 247–452 (§§1.1–1.3, pp. 6–9), 2765–2771 (Lemma 5.7, p. 58), 2792 (§5.5, p. 59), 2856 (p. 60, `L(M_g⊗M_{ψ_g^{-1}},τ,s)=L(τ(g),s)`) | The normalized realization `M_g⊗M_{ψ_g^{-1}}` and the rank-two statement are as cited. |
| 6.4 Transport | LV line 426–432 (Lemma 2.3, pp. 9–10); WII line 701 (p. 154, (1.2.5)(i)) | Subquotient purity and the arithmetic use are as cited. |

Additional locators opened for the whole-roadmap pass: WI line 113 (p. 275, (1.5.1)), 408–423 (pp. 283–284, (3.1)–(3.2): alternating form, open symplectic image, rational local factors), 690–760 (pp. 291–293, (5.6)–(5.10): Veronese degree `≥2`, radical `E∩E^⊥`, parity, Kazhdan–Margulis), 808–840 (pp. 294–295, (6.1)–(6.2)); WII line 4119–4150 (p. 247, (6.2.1)–(6.2.5): `K_X=ℚ_ℓ(n)[2n]`, smooth lisse purity `ℋⁱK` pure of weight `i+n`); S line 487–502 (Theorem 0 with the even-degree discrete-series hypothesis, p. 10), 548–608 (Theorem 1, Claim 1, Theorem 2 with graded weights `w−1`, `w−2`, `w`, p. 13), 667–757 (Lemma 1, Claim 2, the `Ker Nrd` Lie algebra, the `N^{(w−2)/2}∘Nrd` character and division by `d`, pp. 15–17), 1515–1572 (the two weight spectral sequences and `(Γ_σ,Δ)`, pp. 35–36), 1667–1673 (Proposition 1′, p. 39), 1779–1916 (Lemmas 5–9, universal deformation at line 1890 on p. 44, Lubin–Tate at 1898, conclusion on p. 45); DFG line 559 (p. 13, `S_N` = primes dividing `Nk!`); StacksEtale line 1410 (tag 03PL, `n∈O_S^*`) and 4438 (tag 0A3J); Gros line 955 (Chapter II §3, p. 38) and 1483 (Definition 4.1.7).

**Adversarial pass.** One row per statement; semicolons separate instances. Values were computed by hand or by a short script (point counts by enumeration, roots numerically).

| Statement (README line) | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| Geometric Frobenius and Tate line (38–54, 131) | `q=3`, `ℚ_ℓ(1)`; trivial line | Arithmetic eigenvalue 3, geometric `1/3`; `|1/3|=3^{−2/2}`; trivial `1=3^0` | Retain; the arithmetic convention would give weight `+2`. |
| Characteristic versus Euler polynomial (46–50) | `F=diag(1,3)`; rank 0 | `P=X²−4X+3`, `T²P(1/T)=1−4T+3T²=det(1−TF)`; rank 0: `1=1` | Retain. |
| Inverse operator Check (134) | `X²−aX+q`, roots `α,β` | Inverse roots sum `a/q`, product `1/q` → `X²−(a/q)X+1/q` | Retain. |
| Ramified scalar Check (133) | lift 3 versus `2·3` with full inertia | `X−3≠X−6` | Retain. |
| Pure outside T (140, Lean form) | `ℚ_ℓ⊕ℚ_ℓ(1)` at `q=3`; rank 0; `T` = all places | norms `1` and `1/3` cannot both be `3^{w/2}`; rank 0 pure of every weight with `P=1`; empty quantifier true | Retain the three nonvacuity hypotheses on uniqueness (148). |
| Integer-polynomial predicate (142, 154) | `ℚ_ℓ(1)`, `ℚ_ℓ(−1)`, trivial at `q=3` | `X−1/3∉ℤ[X]`, `X−3∈ℤ[X]`, `X−1∈ℤ[X]` | Retain; positive twists excluded, as stated at 164. |
| Chosen-embedding predicate (144, 161) | scalar 3 under identity; rank 0 | `|3|=3≠1`; empty root set | Retain; no unconditional uniqueness, as stated. |
| Algebraic closedness remark (144) | `X²+1` over `ℝ` | 0 real roots versus roots `±i` of norm 1 | Retain. |
| Subquotients and extensions (170) | unipotent `[[1,t],[0,1]]` with trivial ends | ends pure of weight 0, inertia nontrivial for `t≠0` | Retain the middle-term unramifiedness hypothesis. |
| Dual, tensor, determinant, twist (172) | `H¹` of `y²=x³−x` over `𝔽₃` | roots `±i√3`; dual roots norm `3^{−1/2}`; `det=3`, weight 2; `(1)` gives norm `3^{−1/2}`, weight `−1` | Retain. |
| Tensor-square integrality (178) | same curve | tensor roots `−3,3,3,−3`: `(X²−9)²∈ℤ[X]`; dual constant term `1/81` | Retain. |
| Nonrational factor (176) | `diag(√2,−√2)` | `X²−2∈ℤ[X]`, factor `X−√2∉ℚ[X]` | Retain. |
| Induction formula (194) | `ℚ(i)/ℚ`, trivial character, `p=3` inert, `p=5` split | swap matrix: `X²−1=P_u(X²)`, `χ₋₄(3)=−1`; identity: `(X−1)²`, `χ₋₄(5)=1` | Retain; an `f`-fold product would give `(X−1)²` at 3. |
| Cyclic-block determinant (196) | `f=2`, `F=[[0,A₁],[A₀,0]]`; `f=1`; rank 0 | `det(X−F)=det(X²−A₁A₀)`; `det(X−A₀)`; `1` | Retain. |
| Restriction (186) | `ℚ_ℓ(1)`, residue degree 2 at `q=3` | eigenvalue `1/9`, `9^{−2/2}=1/9` | Retain. |
| Unit characters (206–212) | `u=2`, `ℓ=3`, `q=5`; `u=1+ℓ`; transcendental `u` | `4=5^w` impossible; chosen weight `2log₅4≈1.7227`, no integer weight; algebraicity false, chosen weight `2log_q|ιu|` | Retain; `TauCeti.zHat.existsUnique_lift` and the unit-group instances exist (table below). |
| Quartic unit (224–226) | `X⁴−X³−X²−X+1` | `t²−t−3=0`: `t=2.30278` gives real roots `1.72208`, `0.58069`; `t=−1.30278` gives a unit-circle pair; mod 2: `f(0)=f(1)=1`, `f≡x²·(x²+x+1)+(x+1)`, so irreducible | Retain the chosen-versus-all-embeddings separation. |
| Representation–sheaf transport (234–240) | constant and Tate stalks at a degree-2 point over `𝔽₃` | `1=1`; `1/9=1/9` relative to `q²=9`; weights 0 and `−2` | Retain. |
| Complex weights (252–260) | `ℚ_ℓ[1]`, `ℚ_ℓ[1](1)`, `ℱ(N)[2N]` | `0+1−0=1`; `0+1−2=−1`; `r+2N−2N=r` | Retain; agrees with WII (6.2.5)(b). |
| `ℓ=p` boundary (260, 654) | `ℙ¹` over `𝔽_p` | `μ_{pⁿ}=0` on a reduced characteristic-`p` étale site; `H²(ℙ¹,ℤ/p)=0` since `H^{>0}(ℙ¹,𝒪)=0` | Retain. |
| Tate/`H¹` variance (278–286) | `y²=x³−x` over `𝔽₃` | enumeration: 4 points, `a=0`, `P=X²+3`, Tate `X²+1/3` | Retain. |
| Good reduction (296–299) | `g=1`; `g=0` | `V_pA` constant term `3^{−1}∉ℤ`, `det H¹=ℚ_p(−1)` weight 2; `g=0`: both polynomials 1 | Retain the `g>0` clause. |
| Higher cohomology (298) | `g=1`, `i=0..3` | ranks `1,2,1,0`; polynomials `X−1`, `X²+3`, `X−3`, `1` | Retain. |
| Abelian point count and bound (315–319) | `E/𝔽₅`, `m=1,2`; `g=0` | 8 points, `a=−2`, `|8−5|=3≤2√5+1≈5.472`; `t₂=a²−2q=−6`, `#E(𝔽₂₅)=32` by enumeration, `|32−25|=7≤11`; `g=0`: `0≤0` | Retain. |
| Curve trace (329, 339) | same curve; `ℙ¹/𝔽₃`, `m=2` | `25+1−(−6)=32`; `10=1+9` | Retain. |
| Abel–Jacobi independence (331–337) | translation by a point on `E` | coproduct `x↦x⊗1+1⊗x`, pullback along translation `x+0=x` | Retain. |
| Proper specialization (357–365) | smooth proper `ℙ¹`; nonproper affine family | ranks `(1,0,1)=(1,0,1)`, vanishing contribution 0; nonproper excluded | Retain. |
| Nodal sequences (375–385) | split one-node genus one | graph `H¹` rank 1, normalization rank 0, generic rank `2=1+1`; weights 0 and 2 | Retain. |
| Picard–Lefschetz sign (395, 409) | `n=1` (`m=0`), `n=3` (`m=1`) | `(−1)^{m+1}=−1,+1`; WI table `−,−,+,+` for `n≡0,1,2,3` | Retain. |
| Uniformizer sign (410) | `b↦−b` | `−1` has compatible `ℓ`-power roots over the strict henselization: character unchanged | Retain. |
| `FNF⁻¹=q⁻¹N` (403–405) | `F=diag(1,q)`, `N=E₁₂`; `N=E₂₁` | `FNF⁻¹e₂=q⁻¹e₁`; `E₂₁` gives `qN` | Retain; direction fixed. |
| Crystalline `E₁` (421) | smooth fibre; strict `I₂` | only `a=0`; `I₂`: two components, two nodes, incidence rank 1, outer kernel and cokernel rank 1 | Retain; agrees with LPV §7a.8 and S line 1515–1517. |
| Twisted `N` and the `I₂` check (423, 436) | `I₂` | source weight 2, `(1)` gives 0 = target weight; graph pairing nonzero | Retain. |
| Ramified base change (423, 518, 525–526) | Tate curve, `K=ℚ₅(√5)`, `π=√5`, `e_K=2`; index 3 | raw 1, normalized `1/2`; raw 3, `e=6`, `3/6=1/2`; `E_p/ℚ_p` then quadratic: raw 2, `2/2=1` | Retain; `Nφ=pφN` holds for both multiples, as stated. |
| Claim 5 map (427) | positions `(−1,q₀+2)`, `(0,q₀+2)`, `(0,q₀)`, `(1,q₀)` | matches S line 1617 | Retain. |
| Correspondence orientation (444–448, 462) | `ℙ¹`, `m`-th `q`-Frobenius; identity | traces `1,q^m`, alternating total `1+q^m`; `χ(ℙ¹)=2=Δ²` | Retain. |
| Diagonal clauses (450, 463) | `ℙ¹`, `Δ=h₁+h₂` | `pr_{1*}(Δ∪pr₂^*1)=1`, `pr_{1*}(Δ∪pr₂^*h)=h` | Retain; clauses exist at the supplier (R01 repair). |
| `L`-linear projector (452–456, 465) | `A=[[0,2],[1,0]]`, `a=√2`, `e=(I+A/a)/2` | `e²−e≈5.6·10⁻¹⁷`, `tr e=1`, `tr(Ae)=√2≈1.41421∉ℚ`; other embedding `−√2` | Retain. |
| Lemma 4 equalities (473–477, 505) | changed `p`-level | assertion does not apply | Retain. |
| Completed unramified base (469, 508) | residue field `𝔽̄_p` | no finite `q` | Retain the separate descent. |
| Pencil descent (542–546) | `𝔸¹∖{0,1}` over `𝔽₂` | 0 points over `𝔽₂`, 2 over `𝔽₄`; `α²` of norm `(2²)^{1/2}` gives `|α|=√2` | Retain; LPV §3.5 (line 2412–2432) supplies exactly a finite extension. |
| Radical quotient and parity (554–562) | isotropic line `E`; `E` the whole plane; `E=0` | quotient dim 0; radical 0, dim 2; `V=0`, polynomial 1 | Retain. |
| Pairing multiplier (560) | `q=2`, `d=2`, `e=1`, `n=1` | `q^{den}=4` | Retain. |
| Openness in the original group (568) | `Sp₂(ℤ_ℓ)⊂Sp₂(ℚ_ℓ)` then quadratic `L` | dimension 3 in 3 open; 3 in 6 not | Retain. |
| Fundamental estimate inputs (570–574) | WI (3.2) | three hypotheses (i)–(iii) at WI line 418–423 are exactly the alternating form, open image and rational factors | Retain. |
| Parabolic purity (592–598) | `k=2,12`; `𝔾_m` constant sheaf | `r+1=1,11`; on `𝔾_m` ordinary `H¹` has weight 2 and the image is 0 | Retain the image. |
| Classical degree and projector (606–612, 668–672) | `r=1,2,10` | degrees `2,3,11`; `(1−[−1])/2` kills `H⁰,H²`; `r=2` sign gives `Sym²` rank 3 not `∧²` rank 1; `I₃`: `D²=−2−2−2=−6`, inversion keeps `D`, translation average kills it | Retain. |
| `|Γ_r|` (664) | `M,r` | `(M²·2)^r·r!=M^{2r}2^r r!` | Retain. |
| Hilbert degree and twist (614–623, 767–773) | `(g,w)=(2,2),(2,4),(3,3)` | `(q₀,b)=(0,0),(6,2),(5,2)`; `q₀+1−2b=1,3,2=w−1` | Retain; S line 1286–1288 and 1325. |
| Weight-two quotient (630–634) | coefficient degree `d=1,2` | full ranks `2,4`; eigensummand rank 2; `√2` trace possible with rational product | Retain. |
| Hard Lefschetz twists (646–653) | `ℙ¹`, `d=a=1`; `a=0` | `H⁰∋1↦h∈H²(1)` with eigenvalue `3/3=1`; identity | Retain. |
| Projector commuting with `η^a` (656) | `ℙ¹`, projectors `1` on `H⁰`, `0` on `H²` | `η∪1=h≠0` but projected to 0 | Retain the commutation hypothesis. |
| Hecke polynomial and Ramanujan (698–704, 714; Lean 46–63) | `Δ`, `p=2`, `k=12` | `X²+24X+2048`, roots `−12±4i√119`, `|α|²=2048=2¹¹`; `24≤2·2^{11/2}≈90.51` | Retain. |
| Dual convention (702, 710) | `ρ=M^∨` | arithmetic Frobenius on `M^∨` is the transpose of geometric Frobenius on `M`: same polynomial; untwisted `M_g` determinant `ψ(p)⁻¹p^{k−1}` | Retain. |
| Excluded set (712, 743) | `N=3`, `k=2`, coefficient primes `2,5` | `Nk!=6`: 2 excluded from the integral comparison, 5 not; étale realizations at both | Retain; DFG line 559. |
| Common-polynomial predicate and operations (720, 726–728) | trivial rank `0,1,2`; eigenvalues `±1`; lines with roots `2,3`; dual of root 2 | `1`, `X−1`, `(X−1)²`; `X−1≠X+1`; sum `X²−5X+6`, tensor `X−6`; `X·P(1/X)/P(0)=X−1/2` | Retain; `P_v(0)≠0` by invertibility. |
| Degreewise traces (779–798) | `k_i>2`; `w=2` component fixed by Frobenius, `T=1`; graded `(A,A⊕B,B)` with scalars `(1,1)`, `(2,1)` | `t₁=−t_alt`; contributions `1` and `q`, `t₁=1+q−t_alt`; alternating traces `0,0`, degree-one `2,3` | Retain degreewise isolation. |
| Degree-zero character (787) | Saito's convention | S line 729 (sheaf by `N^{−(w−2)/2}∘Nrd`, so `L(−a)`) and 738–744 (`H⁰` action by `N^{(w−2)/2}∘Nrd` through `𝔸_f^×/ℚ_{>0}^×≅ℤ̂^×`) | Retain. |
| Shift and twist factor (783, 798) | odd `w` | `q₀` odd, sign `(−1)^{q₀}`; `(b)` contributes `q^{−b·n(σ)}` | Retain. |
| Monodromy-graded weights (808–814) | `N=0`; `N≠0`, `w=2,4` | `w−1`; `(w−2,w)=(0,2),(2,4)`; `Gr₁(1)→Gr₋₁` lowers by 2 | Retain; S line 592–602. |
| Saito's printed convention (816) | S line 542 | `ϕN=pNϕ` there versus `Nφ=pφN` here | Retain the correction; recorded under Source issues. |
| Multiplicity `d` (800, 824) | `d=1,2`; `d=0` | ranks `2,4`; division by `d` undefined at 0 | Retain `d>0`. |
| Lean `newform_ramanujan` (55–63) | `k=2`; `p` prime coprime to `N`; every `σ` | first conjunct nonvacuous (a complex quadratic has roots); `k≥2` keeps exponents nonnegative; `k:ℤ` with `zpow` in the field | Retain; generality equals README 6.1. |

**Pinned-library declarations opened.** Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (from `lake-manifest.json`), matching README line 85.

| Declaration | File and line at the pin | What it supplies |
| --- | --- | --- |
| `Representation.subrepresentation`, `.quotient`, `.ofDistribMulAction`, `.prod`, `.tprod`, `.dual` | `Mathlib/RepresentationTheory/Basic.lean:313`, 329, 425, 600, 618, 670 | The numerical operations; no continuity or place data. |
| `LinearEquiv.charpoly_conj` | `Mathlib/LinearAlgebra/Charpoly/ToMatrix.lean:75` | Conjugacy invariance. |
| `Matrix.charpoly_units_conj` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:283` | Matrix form. |
| `IsArithFrobAt.mul_inv_mem_inertia`, `.conj`, `.exists_of_isInvariant` | `Mathlib/RingTheory/Frobenius.lean:200`, 205, 221 | Ideal-action Frobenius facts; existence needs `Q.IsPrime` and `Finite (S ⧸ Q)`. |
| `AlgebraicGeometry.Scheme.EllAdicCohomology` | `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:75` | Integral pro-étale groups only, as the docstring says. |
| `TauCeti.zHat.gen`, `TauCeti.zHat.existsUnique_lift` | `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Basic.lean:89`, 163 | Continuous lift of a generator to any element. |
| `PadicInt.compactSpace_units`, `.totallyDisconnectedSpace_units` | `TauCeti/NumberTheory/Padics/PadicIntegers.lean:85`, 93 | The profinite unit target. |
| `HeckeRing.GL2.EigenformAwayFromLevel`, `HeckeRing.GL2.Newform` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84`, 104 | Nebentypus `χ`, eigenvalues away from the level, newness, `a₁=1`; weight `k : ℤ`. |
| `TauCeti.CoefficientField`, `coeff_mem_CoefficientField`, `char_mem_CoefficientField` | `TauCeti/NumberTheory/ModularForms/Newforms/Fields.lean:48`, 61, 131 | The field adjoining the positive-index coefficients; character values lie in it. |
| `WeierstrassCurve.tateModuleGaloisRepresentation` | `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean` | A continuous action of `Gal(K/F)` on `T_ℓE`, with no place, Frobenius or residue-cardinality data: no second statable headline. |

**Cross-roadmap citations resolved** (main at `9c6e95d`, open heads from the index of 2026-10-30; every cited section was located, by heading or label, in the cited roadmap).

| Supplier (position) | Sections located |
| --- | --- |
| DeligneWeightsAndPurity (#929, 75) | §§0.1–0.19 (lines 561–846, `IsPure` at 682), 1.1–1.10 (911–1034), 2.9 (1155), 3.1 (1195), 3.10 (1317), 4.3 (1365), 5.3 (1486), 7.2 (2109), 7.12 (2255), 8.1–8.2 (2333, 2379), 8.9 (2498), 9.1 (2955), 9.6 (3045), 10.1 (3178). §0.6 keeps the cardinality bound; §0.12 is the power criterion. |
| LefschetzPencilsAndVanishingCycles (#873, 51) | §§0.5–0.8 (519–646), 1.1–1.3, 2.1–2.8 (Picard–Lefschetz formula at 2169–2172 with `(−1)^{m+1}t_ℓ(σ)`), 3.1, 3.4, 3.5 (descent to a finite field at 2412–2432), 4.1, 4.4 (2630), 5.4, 5.8, 7a.1–7a.9 (3438–3792). |
| ArithmeticGaloisRepresentations (#856, 41) | §§1.1–1.12 (684–1384; continuous induction at 897), 2.1–2.6 (1450–2009; `frobCharpoly` with an arithmetic lift at 1659), 6.1–6.2 (3632, 3828). |
| AbelianSchemesAndArithmeticModuli (#849) | A4.1 (1822), A4.4 / `exteriorCohomology` (1941), A6.10–A6.11 (2998, 3026). |
| NeronModelsAndSemistableAbelianVarieties (#852) | §§5.0a–5.0c (2858–2911), 5.1 (2934). |
| ModularCurvesPartII (#913, 70) | Layers 11–12 (2968, 3147), §§14.1–14.4a (3499–3600), 14.11 (3755), 16.1–16.4 (4099–4158). |
| AlgebraicModularFormsAndSerreWeights (#928, 84) | R15.5A.1–R15.5A.2 = §§6.1–6.2 (line 18; 1384, 1419); §6.2 derives the polynomial from the isogeny relation and the alternating pairing, not from purity (1428–1434): no circularity with §6.1 here. |
| CrystallineCohomology (#857, 19) | CR.2.3 (2451), CR.3.2–CR.3.4 (2729–3085), CR.4.7 (6510), CR.3:duality.1 (7194) with the Gysin and diagonal paragraphs (7425, 7529), CR.5–CR.6 (8458, 10020), CR.6.1 (10029), CR.6.3 (10593), CR.6.5 (11098; raw monodromy over index `d` at 11217–11218). |
| PadicHodgeTheory (#1062, 107); AInfCohomology (#1044, 53) | §§8.1–8.2 (1385, 1414); AI.6.4–AI.6.6 (2984, 3291, 3500). |
| PadicDifferentialEquationsAndRigidCohomology (#1002, 105) | RD.7.7 (13946): Katz–Messing agreement of crystalline and `ℓ`-adic factors for smooth projective varieties. |
| PadicPeriodRings (#940); FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) | §§4.1–4.3 (417–470); R07.3.0 (4542), R07.4.27–R07.4.28 (6815, 6872). |
| GL2AutomorphicRepresentationsAndTransfer (#931, 85) | R16.0.1 (401), R16.3.1–R16.3.4 (882–918), R17.3.1, R17.3.3, R17.3.5–R17.3.8 (1579–1652). |
| InverseGaloisAndArithmeticFundamentalGroups (#850, 43) | IG.0.T1 / `curveEndomorphismTrace` (478), IG.0.T3 / `etaleTraceFormula` (table at 338 and its section): the resolver's lead is this planned name, not a missing contract. |
| Main: EtaleCohomologyFoundations | F.0.1–F.0.3 (175–231), F.0.A2 (368), F.2.1–F.2.2 (504, 522), F.3a (776), F.4.1–F.4.6 (959–1089; §F.4.5 at 1041 states the geometrically unibranch, hence normal, case), F.5–F.7 (1179–1239), F.10.1–F.10.2b (907, 940, 1108), §§0.9–0.11 (1120–1157). |
| Main: SchemeAndStackFoundations; StableReduction; EnhancedDerivedSheaves; DerivedModuleAlgebra | §§0.9 (848), 0.29 (1825), 2.15 (3867), 3.6 (4905); Layers 4, 5, 7, 8 (468, 491, 550, 574; `xy=πⁿ` at 475); §§0.1–0.4 (429–492); §1.T.1 (1403). |
| Main: JacobianChallenge; EllipticCurves; RepresentationTheory/CharacterTheory; ClassFieldTheory | Layers D–F (218, 332, 448); Layer 3 Hasse bound (683); Layer 3 idempotents (241, 246); Layers 11–12 (1683, 1724). |
| Consumers named in prose | FaltingsFinitenessAndIsogenyTheorems R28.4 (#1004, position 140) and MordellLawrenceVenkatesh LV.1 (#1231, 141) exist and are later: consumers, not supply edges. |

**Ownership against open work.** Searched by object with the roadmaps grep over the 440 open heads and main: the Ramanujan bound and Hecke polynomial on newforms (`newform_ramanujan` is cited as a consumer by ErdosProgressionPowers, position 180), the Kuga–Sato compactification and Scholl projector (AutomorphicGaloisRepresentations §1.3 at #1007, position 147, imports them from R34.5 by name), Saito's Hilbert model and the `C_μ` identifications (HilbertModularVarietiesAndShimuraCurves at #1005, position 142, imports R34.1–R34.3), the crystalline weight spectral sequence (only LPV §7a.8's prime-to-`p` sequence and DWP §8.24's compactification sequence exist elsewhere), the mixed-characteristic Picard–Lefschetz normalization (LPV §2.8 owns the formula; this roadmap owns only the arithmetic normalization and Checks), the common-good-prime predicate (no other owner). The sibling checkouts named in the brief (DeligneWeightsAndPurityPartII, EtaleDualityAndPerverseSheavesPartII, CstConjectureForDaggerVarieties and the rest) were included in the grep; none states these constructions. No `Suggested.lean` elsewhere declares either fully qualified name.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six numbered layers with `### k.n` targets, Examples and Dependencies per layer, Downstream consumers (in the Scope section's consumer clauses and §6.2), Suggested Lean forms, References with page offsets. Each definition has an API list and at least three Checks (§1.2: five plus three; §3.9: six; §5.5: five; §6.2: four). Every theorem names its hypotheses and a locator.

**Lean.** `lake env lean` on `TauCetiRoadmap/WeightsInEtaleCohomology/Suggested.lean` from the worktree root: the single warning `declaration uses sorry` at line 55, exit 0 (3 s, cached object files). A scratch copy with `#check @newformHeckePolynomial` and `#check @newform_ramanujan` elaborated to

    @newformHeckePolynomial : {N : ℕ} → [NeZero N] → {k : ℤ} → (f : HeckeRing.GL2.Newform N k) → (p : ℕ+) → (↑p).Coprime N → (↥(TauCeti.CoefficientField f))[X]
    @newform_ramanujan : ∀ {N : ℕ} [NeZero N] {k : ℤ} (f : HeckeRing.GL2.Newform N k), 2 ≤ k → ∀ (p : ℕ+), Nat.Prime ↑p → ∀ (hpN : (↑p).Coprime N) (σ : ↥(TauCeti.CoefficientField f) →ₐ[ℚ] ℂ), (∀ α : ℂ, (map σ.toRingHom (newformHeckePolynomial f p hpN)).IsRoot α → ‖α‖ = (↑↑p).rpow ((↑k − 1) / 2)) ∧ ‖σ ⟨(PowerSeries.coeff ↑p) (qExpansion 1 ⇑f.toCuspForm), _⟩‖ ≤ 2 * (↑↑p).rpow ((↑k − 1) / 2)

No section variable was lost: the definition keeps `N`, `NeZero N`, `k`, `f`, `p` and the coprimality proof; the theorem adds `2 ≤ k`, primality and the embedding. The README's generality (every level, nebentypus and weight `k ≥ 2`, every prime away from the level, every complex embedding, line 696–706) equals the signature's. One-tactic probes on scratch copies: `simp [newformHeckePolynomial]` and `constructor <;> intros <;> simp_all [newformHeckePolynomial]` both leave the root-norm and coefficient goals open (the polynomial unfolds to `α²−σ(a_p)α+σ(χ(p))p^{k−1}`), so the theorem is not padding. The file has one module docstring in the required form, `import Mathlib` plus one existing `TauCeti.*` module, no `set_option`, no `lemma`, no sorry'd data, no `example`.

**Headline coverage.** The README's headlines are: the arithmetic representation–sheaf and complex-weight comparisons (Layer 1); good-reduction purity, integral polynomials and the all-extension trace formulas (Layer 2); proper specialization, nodal and Picard–Lefschetz comparisons, the crystalline weight spectral sequence, the stratum trace theorem and Saito's model (Layer 3); the descended pencil and original-coefficient monodromy inputs (Layer 4); parabolic purity, the Kuga–Sato and Hilbert projector comparisons, the weight-two quotient and arithmetic hard Lefschetz (Layer 5); the Ramanujan bound, the fixed-form common polynomials and the source-qualified Hilbert local comparison with monodromy weights (Layer 6). Only the Ramanujan headline is statable at the pins and it is stated; the docstring names each other group and the carrier it lacks (rational adic cohomology with Galois action and Frobenius, nearby cycles, Hyodo–Kato cohomology, period modules, the vanishing-cycle local system, cohomological projectors, Hilbert realizations). I checked the one candidate the docstring could have missed: Tau Ceti's elliptic Tate-module Galois representation carries no place Frobenius or residue cardinality, and the finite-field Hasse statement is EllipticCurves Layer 3's, a supplier's; no further headline is statable without a stand-in.

## Not verifiable

- **Mokrane**, *La suite spectrale des poids en cohomologie de Hyodo–Kato* (Duke 72, 1993), cited at README line 431 for the general crystalline weight spectral sequence. The sources service found only the Project Euclid landing page for DOI `10.1215/S0012-7094-93-07211-0`, with no retrievable text; it is recorded in the job's missing-references file. The README's `E₁` term, differential and twisted `N` were checked against Saito §8 (S line 1548–1551) and LPV §7a.8–7a.9 instead.
- **Gillet–Messing**, *Cycle classes and Riemann–Roch for crystalline cohomology* (Duke 55, 1987), cited at README line 458. The same: landing page for DOI `10.1215/S0012-7094-87-05527-X` only; recorded in the missing-references file. Gros's Chapter II §§3–4 (Gros line 955, 1483) and CrystallineCohomology's Gysin and diagonal paragraphs cover the properties the README consumes; the paper's own compatibilities at the stated locator are not text-certified.

## Source issues

- **Misprint** in S at §2, the Weil–Deligne construction after Theorem 0, printed p. 12 (S line 542): the source says the monodromy relation is `ϕN = pNϕ` with Frobenius scaling `p^{n(σ)}` on `N`; it should be `Nϕ = pϕN` with the inverse scaling, as its own twisted isomorphism `Gr₁(1) ≅ Gr₋₁` on p. 13 requires; affects a stated result.
- **Misprint** in AV at Chapter II, Remark 1.6(a), printed p. 78 (AV line 3229): the source says `P_r(t)` is the characteristic polynomial of Frobenius on `∧^r T_ℓA`; it should be the reciprocal polynomial `det(1 − tF)`, since `P_r(t) = ∏(1 − a_{i,r}t)` by Corollary 1.5; affects a stated result.
- **Misprint** in DFG at Theorem 2.4, printed p. 24 (DFG line 1045): the source says `S_N` is the set of primes not dividing `Nk!`; it should be the primes dividing `Nk!`, as defined in §2 on p. 13 (DFG line 559); affects a stated result.
