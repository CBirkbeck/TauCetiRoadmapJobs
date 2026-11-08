# Review of ChromaticHomotopyTheory (pull request #1643 at 743da6e)

**Verdict:** needs changes

This is an incremental re-review of the 46 lines changed since b049bb3. The diff does one thing: it retires the undeclared `gap:higher-ambidexterity-norms` contract and makes §4.2 the owner of the Hopkins–Lurie norms, cardinalities and their laws, built from BordismFormalGroups F6.5's Kan extensions and EnhancedDerivedSheaves E3's coherent mates, with the finite-group case identified with GeneralAlgebraicKTheoryPartII §4.22. That change is correct in its mathematics, its locators and its supplier citations. Two P3 findings remain and there is no P1 or P2: the gate fails on this head on a passage the diff did not touch, and the stale Tau Ceti pin of the previous R02 is still not repaired.

## R01 (P3) — The gate fails: README line 10 names a roadmap on the dropped-names list, and the clause is stale at the supplier's head

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:10`, “§§4.31–4.33 own Hopkins–Mahowald and filtered Thom families with their acyclicity and the James application, whose stable James splitting that roadmap requests from HomotopySpheres.”

**Claim:** Re-running the brief's gate command on this head prints `dropped=1 … FAIL` with the rule line `dropped: line 10: - GeneralAlgebraicKTheoryPartII §§4.13–4.16 own …`. The project's dropped-names list contains `HomotopySpheres` (its file was last modified 2026-11-07 23:54, before the worker's gate of 02:31, so the worker's `dropped=0` is not reproducible here). Independently of that list, the clause is supplier drift: GeneralAlgebraicKTheoryPartII at its open head no longer requests the stable James splitting from anyone. Its scope paragraph says the James reduced product, the James–Hopf maps, “the stable James splitting and the metastable EHP sequence are owned here (§§4.30b–4.30c); §§4.32–4.33 … use them”, and the heading `### 4.30c James–Hopf maps and the stable James splitting` exists at that head. A grep of that README for `HomotopySpheres` returns nothing.

**Witness:** gate output on 743da6e: `dropped=1 … FAIL`; `dropped-names.txt` line 1 is `HomotopySpheres`; GeneralAlgebraicKTheoryPartII head README line 14 (scope) and line 1244 (§4.30c heading); README:10 is the only line of this README that mentions HomotopySpheres.

**Repair:** replace the clause “whose stable James splitting that roadmap requests from HomotopySpheres” with “using the stable James splitting of its §4.30c”, or delete the clause. Either removes the dropped name and matches the supplier's head; the sentence's ownership statement (§§4.31–4.33) is unchanged. Re-run the gate afterwards; the other checks pass already.

## R02 (P3) — Two Tau Ceti declarations are cited at a pin that does not contain them

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:17`, “Tau Ceti already supplies `WeierstrassCurve.formalGroup` and the Serre class `AddCommGrpCat.isKilledBySomePower`” and “Tau Ceti’s `TauCeti.SymmetricSpectrum` is the point-set category”; the same claims at README:71 (the file path `TauCeti/AlgebraicTopology/SerreClass/PowerTorsion.lean`), README:111 and README:405, and at `TauCetiRoadmap/ChromaticHomotopyTheory/Suggested.lean:9`.

**Claim:** This is the previous review's R02 and it is not repaired. The branch's merge base with main is still d2e0f0d3 and `lake-manifest.json` still pins Tau Ceti at `a91d3aaf`. At that pin `TauCeti/AlgebraicTopology/` has neither a `SerreClass/` nor a `Spectra/` directory, and a recursive grep of the pinned package for `isKilledBySomePower` or `SymmetricSpectrum` returns no file. So the “already supplies” sentences, the file path, the §4.3 route step and the docstring paragraph cannot be verified at the pin the branch builds against.

**Witness:** `lake-manifest.json` on the branch, `"rev": "a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039"` for `TauCeti`; main's manifest, `"rev": "2fd255d997f47c0b5d834ee416c7015d55444ce5"`, where the previous review located `SerreClass/PowerTorsion.lean:33` (`isKilledBySomePower`) and `Spectra/SymmetricSpectrum.lean:92` (`SymmetricSpectrum`).

**Repair:** rebase the branch onto current main so that `lake-manifest.json` pins Tau Ceti at `2fd255d9` or later; the README and the docstring are then correct as written, and the targeted build should be re-run. If the branch keeps the old pin, delete the `isKilledBySomePower` and `SymmetricSpectrum` sentences at README:17, :71, :111 and :405 and the docstring paragraph at Suggested.lean:9–11, and cite DGFloer Layer 1 item 4's power-torsion Serre class without naming a Lean carrier.

## Previous findings

- R01 — repaired: no `gap:higher-ambidexterity-norms` remains in the README (its four `gap:` slugs are `p-local-finite-duality`, `spectral-ringed-sites`, `elliptic-spectral-affineness`, `all-height-morava-realization`), and §4.2 now constructs the norms; the plan's `gaps` holds exactly the first two.
- R02 — not repaired: `lake-manifest.json` still pins Tau Ceti at `a91d3aaf`; README:17 and :71 still name `isKilledBySomePower` and `TauCeti/AlgebraicTopology/SerreClass/PowerTorsion.lean`. Carried forward as R02 above.

No visible repair report marks any previous finding as not actionable, so nothing is re-raised under that rule.

## Verified sound

### Gate, dependency direction and Lean

- **Gate.** Re-run on this head with the brief's command. Every check passes except `dropped=1` (R01): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0`. The worker's run also reports `build=0`.
- **Dependency check.** It printed:

  ```text
  depcheck: 243 roadmaps, 2457 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. `ORDER.txt` lists ChromaticHomotopyTheory at line 334, after RefinedTraceMethods (328), StableHomotopyKTheoryPartII (331) and GeneralAlgebraicKTheoryPartII (333). The newly cited EnhancedDerivedSheaves E3 and BordismFormalGroups F6.5 are roadmaps on main, always citable.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with no diagnostics (20 s). The file has one `import Mathlib`, one module docstring and an empty namespace; its docstring lists §4.2's “higher Kan-extension norms” among the missing carriers, which agrees with the new ownership. Nothing to probe for padding, no `#check` comparison to make, no sorry'd data, no `set_option`. The diff did not touch this file.
- **Scope of the change.** The outside-folder diff is empty. `overlaps.md` reports no other open pull request changing this roadmap and no dropped or revision-only ids; `citations.md` reports no unresolved name.

### The changed passage, §4.2 (README:353–397)

- **Beck–Chevalley (README:353).** The two conditions are stated in csy's directions: for the pullback square with s:B′→B and s′:A′→A, BC! is `q′_!s′^* → s^*q_!` under q-colimits and BC* is `s^*q_* → q′_*s′^*` under q-limits (csy line 1597, Lemma 3.1.2, p.32; its square is Definition 3.1.1 at line 1579). The proof route derives it from F6.5's pointwise comma-category formula evaluated on homotopy fibers, which is csy's own proof via HL13 Proposition 4.3.3 restricted to q-colimits (line 1600).
- **Inductive norms (README:353).** The m=−2 case (equivalence; norm the identity of an inverse that is both adjoint) matches csy line 1636. The m≥−1 case matches Definition 3.1.3 at line 1623–1626: ν_q is `q^*q_! ≃ (π₂)_!π₁^* → (π₂)_!δ_!δ^*π₁^* ≃ Id`, first map the BC! equivalence, second the wrong-way unit μ_δ from the iso-norm Nm_δ, and Nm_q is the mate under `q^*⊣q_*`. The README's requirement that δ be (m−1)-C-ambidextrous and that C admit the q-indexed colimits and limits matches line 1634–1640, and “(weakly) C-ambidextrous = for some m” matches line 1643. m-semiadditivity (m-finite limits and colimits plus every m-finite map ambidextrous) and ∞-semiadditivity match Definition 3.1.10 at line 1692.
- **Integration and cardinality (README:355).** The composite unit, q_*f, inverse norm, counit is csy line 677 (Definition 2.1.11); `|q|_X = ∫ id` is line 682–691 (Definition 2.1.13). Taking X=1_C for `|A|∈π₀End(1_C)` is the roadmap's own specialisation, and csy line 1974 describes |A| as a natural endomorphism of the identity, so the two agree.
- **API bullets.** Independence of m: csy line 1645 says exactly this, citing HL13 Proposition 4.1.10(5); the proof route makes it a target here by induction. Identity, composition and base change: Proposition 3.1.9 (1)–(3) at line 1673–1688. Functoriality: Theorem 3.2.3 at line 2000, with the (F,q)-square of Definition 3.2.1 at line 1983 and BC from Proposition 3.2.2 at line 1995. Finite-group case: csy Introduction line 332–337 (p.9) states Nm_BG for finite G identified with the classical norm and the stable iff with Tate vanishing; the roadmap's identification with the localized norm L_E(X_hG)→X^hG is GeneralAlgebraicKTheoryPartII §4.22 at its head (line 1027: “the norm in Sp_E is L_E(X_hG)→X^hG, and its cofiber is L_E(X^tG)”). Weak 1-ambidexterity of BG→* in Sp_E: the diagonal has finite discrete fibers and stable categories are 0-semiadditive (Example 3.1.12, line 1705).
- **Reference entry (README:509).** Each added locator was checked against the page markers: Introduction p.9 (marker at line 331), Definitions 2.1.11 and 2.1.13 p.17 (650), Lemma 3.1.2 and Definition 3.1.3 p.32 (1576), Definition 3.1.5 p.33 (1622), Proposition 3.1.9 and Definition 3.1.10 p.34 (1658), Example 3.1.12 p.35 (1704), Proposition 3.1.18 p.37 (1858), Theorem 3.2.3 p.39 (1958).

### Suppliers resolved for the changed passage

| Citation | Where | What it says |
| --- | --- | --- |
| EnhancedDerivedSheaves E3 (coherent mates) | main README:1229 (E3.4), :1257–1259 | `coherentMate`: right mate of a square of adjunctions, Mathlib's bicategorical mate in the homotopy bicategory, `beckChevalley` for invertibility; “invertibility additionally requires the geometric Beck–Chevalley hypothesis”, which §4.2 proves for pullback squares of spaces |
| BordismFormalGroups F6.5 (Kan extensions) | main README:1526 (F6.5), items at the F6.5 Kan-extension paragraph | left/right Kan extensions by universal property, “the pointwise comma-category formulas, the existence theorem …, composition, base change under the stated cofinality conditions” |
| BordismFormalGroups F6.5 (norms) | main README:1526–1540 | Borel finite-group actions only: orbits, fixed points, transfer/norm, Tate; so “neither supplier constructs a norm beyond finite groups” is correct for F6.5 |
| GeneralAlgebraicKTheoryPartII §4.22 | head of #1742, line 1027 | localized norm L_E(X_hG)→X^hG with cofiber L_E(X^tG) for finite G; no higher norm (the head's only `ambidext` hit is its csy reference entry) |
| GeneralAlgebraicKTheoryPartII §4.14, §4.24, §4.3 | head lines 897, 1065, 691 | fiberwise homology comparison via pointwise Kan extension; telescopic Tate vanishing; telescope acyclicity criteria |
| GeneralAlgebraicKTheoryPartII scope | head line 8 | “that consequence is ChromaticHomotopyTheory §4.2”, consistent with this roadmap owning the semiadditivity application |

- **Ownership against open work.** `roadmaps grep -i ambidext`, `semiadditiv` and `Hopkins.Lurie` over every open head and main hit only this README (and csy reference entries of GeneralAlgebraicKTheoryPartII). No roadmap on main, on the board or at an open head constructs the higher norms or cardinalities, so §4.2 is their single owner, and the finite-group norms it consumes have single owners (F6.5 raw, §4.22 localized).
- **Declared gaps.** `p-local-finite-duality` (README:77) and `spectral-ringed-sites` (README:89) match the plan's two entries word for word; the retired slug appears in neither file.

### Seeded sample

§4.2 is the one sampled target in the diff; its two anchors were reopened: csy line 3882 (Theorem 5.3.1, all n≥0) and line 3930 (Theorem 5.3.5, π-finite n-connected fibers), plus line 3970 (Corollary 5.3.7). The other five targets are untouched; I reopened their anchors and each still says what it is cited for: lmmt 398 (Serre spectral sequence in T(i)-homology) and 406 (Remark 2.12, m=n+1); bhm 258 (Lemma 3.5); greenlees-sadofsky 343 (Corollary 2.4); hesselholt-ku 1658 (Tate-valued Frobenius on KU); cm-tate 129 (Remark 2.8); csy 4036 (Theorem 5.4.4) and 4060 (Remark 5.4.5); mm 1801 (Theorem 7.6, faithful GL₂(ℤ/nℤ)-Galois).

### Adversarial values

New rows cover the changed statements; the rest are carried from the previous reviews where they were computed (marked r3 or r4).

| Statement | Instances | Values on each side | Result / change |
| --- | --- | --- | --- |
| Beck–Chevalley BC! direction | s=id_B; B′=∅ | q′=q, s′=id: q_!→q_! identity; A′=∅: both sides land in Fun(∅,C)=*, equivalence | Pass; new |
| Inductive norm, m=−2 versus m=−1 on an equivalence q | q=id_A | δ=id, Nm_δ=id; ν_q = identity composite; mate = identity of q^* itself; agrees with the m=−2 clause | Pass (independence of m at the base); new |
| Diagonal of an m-truncated map | q: BG→*; q: {a,b}→* | fibers of δ: G (0-truncated); fibers of δ: ∅ or pt ((−1)-truncated) | Pass; new |
| Two-point norm and cardinality | {a,b}→*, stable C | X⊕X→X×X identity matrix; ∫ id = id+id; |{a,b}|=2; all-ones matrix has det 0 | Pass; new |
| Integration over a finite set is summation | A={a,b}, f=(f_a,f_b) | ∫_A f = f_a+f_b (csy line 1708–1713) | Pass; new |
| BG→* in Sp_E: localized norm and the iff | E=S, G=C₂, X=Hℤ trivial | q_!X=L_E(Hℤ_hC₂), q_*X=Hℤ^hC₂; π₀ norm ℤ→ℤ is ×2; cofiber π₀=ℤ/2=π₀Hℤ^tC₂≠0, so not ambidextrous | Pass; new |
| Rational BC_p cardinality | Sp_ℚ, unit, trivial action | unit on π₀: 1; Nm⁻¹: 1/p; counit on π₀ of H₀(C_p;ℚ): 1; |BC_p|=p⁻¹; wrong model gives p | Pass; new |
| Weak 2-ambidexterity of B²C_p→* in Sp | trivial H𝔽_p | δ has fiber BC_p; base change of δ along a point is BC_p→*, whose π₀ norm is p=0, not invertible; so δ is not 1-ambidextrous | Pass; new |
| Theorem 3.2.3 at m=0 | F=id; F=L_E on Sp→Sp_E, q={a,b}→* | identity square trivial; L_E preserves the initial object and finite sums, so the identity-matrix norm is carried to the identity-matrix norm | Pass; new |
| Composition law | q: BH→BG (H≤G), p: BG→* in Sp_E | (pq)_!=L_E((−)_hH), (pq)_*=(−)^hH; composite of the H-in-G transfer norm with the G norm is the H norm | Pass; new |
| §4.2 Sp_T(0) not 1-semiadditive | p=2, H𝔽₃ | C₃ norm is 3=0 | Pass (r3) |
| §4.2 dim BC_p | n=1,2 | rank p, p²=p^(binom(n,1)) | Pass (r3) |
| §4.2 dimension formula | n=k=2; k>n; n=0 | p versus wrong model p⁴; 1; rational ranks p, 1 | Pass (r3) |
| §4.2 evenness | X=S¹ | κ₁≠0, dim=1−1=0 | Pass (r3) |
| §4.2 connectivity cannot drop | n=1: BC_p versus K(C_p,2) | reduced K(1)-rank p−1 versus 0 | Pass (r3) |
| Homological grading and symmetry | ΣS; S¹∧S¹ swap | π₁ΣS=ℤ; sign −1 | Pass (r3) |
| Cofiber conventions | id_S; 0→S | 0; S | Pass (r3) |
| T(0)=S[1/p] versus Hℚ | p=2,q=3 | S[1/2]∧S/3≠0, Hℚ∧S/3=0 | Pass (r3) |
| Cover index | K(A,2), r=2,3 | K(A,2)⟨3⟩=*; index 2 keeps π₂=A | Pass (r3) |
| Multiplicative p-series | p=2,3 | 2X+X²; 3X+3X²+X³ | Pass (r3) |
| ψ_(−1) and Δ²⁴ | height 1; Δ²⁴ | u↦−u; weight 288, degree 576 | Pass (r3) |
| Finite p-local sphere | π₀S_(p); q≠p | ℤ_(p); q a unit | Pass (r3) |
| p-local duality and target | D(S/p); V=S_(p), X=Hℤ | Σ⁻¹S/p; Hom(ℤ_(p),ℤ)=0 versus ℤ_(p) | Pass (r3) |
| Geometric height | additive / multiplicative over 𝔽₂ | ∞ / 1 | Pass (r3) |
| v-degrees and BP | p=2,3 | |v₁|=2,4; π₂BP=0, π₂MU_(3)=ℤ_(3) | Pass (r3) |
| Type and smash | S_(p), S/p, 0 | 0, 1, ∞; max(0,1)=1 | Pass (r3) |
| Nilpotence endpoint | R=H𝔽_p | K(i)∧R=0 all finite i; H𝔽_p∧R≠0 | Pass (r3) |
| 3.1 degenerate bases | Y=*; Y=∅; E=0 | E_*(F_+); 0; 0 | Pass (r3) |
| 3.1 differentials and cells | d_r at (s,t); one s-cell | (s−r,t+r−1); Σ^s(E⊗Σ∞_+F) | Pass (r3) |
| 3.1 monodromy | reflection torus, Hℤ | 1−(−1)=2; H₁=ℤ⊕ℤ/2 | Pass (r3) |
| 3.1 non-cellular naturality | I, t↦t/2 | id on H₀ | Pass (r3) |
| 3.1 periodic coefficients | KU, ℂP^∞ | E²=ℤ at even (s,t); d_r=0 | Pass (r3) |
| 3.1 bounded-below hypothesis | constant filtration S | graded pieces 0, colimit S | Pass, negative control (r3) |
| 4.1 Euler inversion | p=2; p=3 | z=−2, ℚ₂; z²+3z+3 Eisenstein, ℚ₃(ζ₃) | Pass (r3) |
| 4.1 against StableHomotopyKTheoryPartII §7.2 | p=2,3 | same values in x=L−1 | Pass (r3) |
| 4.1 raw versus localized | KU_p^∧ | raw π₀≠0; L_T(1) Tate=0 | Pass (r3) |
| 4.1 Check “agreeing with Kuhn’s theorem” | KU_p^∧ trivial C_p | raw π₀=ℚ_p(ζ_p)≠0; localized Tate 0 by GeneralAlgebraicKTheoryPartII §4.24 | Pass (r4) |
| Sphere and Hℤ Tate | C_p on S; C₂ on Hℤ | π₀=ℤ_p; ℤ/2 even, 0 odd | Pass (r3) |
| 4.3 bound at n=1, n=2 | K(ℤ/p,2), BC_p; K(ℤ/p,3), K(ℤ/p,2) | reduced ranks 0, p−1; 0, p−1 | Pass, bounds sharp (r3) |
| 4.3 height zero | q≠p, K(ℤ/q,n+1) | ℤ/q≠0; ⊗ℚ=0 | Pass (r3) |
| 4.3 third assertion | Σ^(n+1)H𝔽_p; Σ^nH𝔽_p | acyclic; not a T(n)-equivalence | Pass (r3) |
| 4.3 Serre class | ℤ/4 | killed by 2², not by 2 | Pass (r3) |
| 4.4 weak-ring unit law | Hℚ with μ=0; S | fails; passes | Pass (r3) |
| 4.4 four conditions | Hℚ, n=0 | all three vanish | Pass (r3) |
| 4.4 ∞ endpoint | H𝔽_p | K(j)⊗R=0 finite j; K(∞)⊗R≠0 | Pass (r3) |
| 4.4 Morava K | K(n) | supp {n}; F(n+1)⊗K(n)=0 | Pass (r3) |
| 4.4 sphere | S_(p) | all four fail together | Pass (r3) |
| 4.4 weak-ring hypothesis | I_(ℚ/ℤ) | supp ∅, F(n+1)⊗I≠0 | Pass, negative control (r3) |
| 5.1 trivial group and zero ring | G=1; A=0 | B^h1=A; 0 | Pass (r3) |
| 5.1 split torsors | C₂, A²; S₃, A⁶ | A⁴; 36=36 | Pass (r3) |
| 5.1 faithfulness independent | A=Hℤ, B=0 | B⊗_AA=0, A≠0 | Pass (r3) |
| 5.1 group orders | N=1,2,3,5 | 1; 6; 48; 480 | Pass (r3) |
| 5.1 row action | N=3, unipotents | (2P+Q,P+Q)≠(P+Q,P+2Q) | Pass (r3) |
| 5.1 determinant components | diag(−1,1) | ζ↦ζ⁻¹; 48/24 | Pass (r3) |
| Honda quotient | p=2,h=1; p=3,h=1 | 𝔽₄, 1/2; 𝔽₉, 1/3 | Pass (r3) |
| Part II fixed points not connective | p=2, n=2, k=0 | π₋₁=ℤ₂ | Pass (r3) |
| Part II fp-type index | ku₂^∧, cofib(v₁⁴ on S/2) | fp-type 1 | Pass (r3) |
| Part II acyclic ring | Hℤ_p, n=2 | L_T(2)K(ℤ_p)=0 | Pass (r3) |
| Part II witness range | bhls Theorem A | any prime, n+1≥2, k≥0 | Pass (r3) |
| hahn-wilson note | h=1, p=2; general h | T(h+1)⊗TC(BP⟨h⟩)≠0 via K(h+1)-local THH(BP⟨h⟩/MU)^hS¹ | Pass (r4) |

### Notes that need no change in the folder

- The pull-request description (data) still says the roadmap “shows ko→KO is a T(n)-equivalence for n≥1”. README:10 assigns that statement to GeneralAlgebraicKTheoryPartII §4.30a, and this folder does not state it; the description is the author's text, not a roadmap file, so it is recorded here and not as a finding.
- `ORDER.txt` lists HomotopySpheres at line 72 while the project's dropped-names list also contains it; the gate follows the list. R01's repair removes the mention either way, because the supplier's head no longer makes the request.

## Not verifiable

- HL13 (Hopkins–Lurie, Ambidexterity in K(n)-local stable homotopy theory) is cited only through csy: the independence of m (csy line 1645), Lemma 3.1.2 (line 1600) and Proposition 3.1.9 (line 1689) are stated in csy and proved there by reference to HL13. The statements as the README gives them are csy's, verified at the lines above; HL13's own text was not opened.
- The printed page 844 of `hesselholt-ku` was not seen; the cited formula is at extraction line 1658–1662.
- The Ravenel–Wilson rank p^(binom(n,k)) was checked where csy line 3655 quotes it, not against Ravenel–Wilson's text.
- Whether a repair answer posted as a pull-request comment marked anything not actionable: no repair report is on the board, and I did not read pull-request comments.

## Source issues

- none
