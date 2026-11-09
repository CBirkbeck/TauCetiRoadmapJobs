# Review of ChromaticHomotopyTheory (pull request #1643 at 492fe6d)

**Verdict:** needs changes

The head is unchanged since the previous review, so this is a full re-review of the folder. There are six P3 findings and no P1 or P2 finding. The gate passes and the dependency check is clean. Of the six findings, five are new and one is the previous review's unrepaired R01 (the Tau Ceti pin).

## R01 (P3) — §4.4's proof route does not handle a non-nilpotent fundamental group at n=0

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:423`, the converse step for the fourth condition: "Induct up the Postnikov towers of those fibers … The path fibrations K(C_p,k)→*→K(C_p,k+1) carry the vanishing from k=n+1 to every k≥n+1, and layers of order prime to p contribute nothing p-locally."

**Claim:** At n=0 the fibers of A→τ_≤0A are connected π-finite spaces, and their π₁ can be any finite group G. The first Postnikov layer K(G,1) is not built from layers K(C_p,k), and it is not of order prime to p, when G is for instance A₅ at p=2. The route names no input for such a layer, so as routed it does not prove "(2) implies (4)" at n=0. The statement itself is true. The source has the same gap (see Source issues).

**Witness:** f:*→BA₅ is an equivalence on τ_≤0, so condition 4 at n=0, p=2 needs Σ∞BA₅⊗R=0. A₅ is simple of order 60, so no refinement into C₂-layers and odd-order layers exists. csy line 3949 treats n=0 only rationally.

**Repair:** Add to the route: for p-local R and a Sylow p-subgroup P≤G, Σ∞_+BG⊗R is a retract of Σ∞_+BP⊗R. This holds because restriction followed by transfer multiplies ℤ_(p)-homology by the index [G:P], a p-local unit. The stable transfer is BordismFormalGroups F6.5's, whose Sylow restriction/transfer composite is in its README on main at line 2430. A finite p-group is an iterated central extension of copies of C_p. Apply this to the base Bπ₁ of each fiber, with the universal cover as fiber, using GeneralAlgebraicKTheoryPartII §4.14. Then:

- add "BordismFormalGroups F6.5 (stable transfer)" to the *Needs:* line at README:432;
- add the A₅ example as a Check.

Tested on A₅ at p=2: P=C₂×C₂ has index 15, a unit in ℤ_(2). The fibration BC₂→B(C₂×C₂)→BC₂ and the fiberwise comparison give Σ∞B(C₂×C₂)⊗R=0, so its retract Σ∞BA₅⊗R vanishes, as condition 4 requires.

## R02 (P3) — The bootstrap bullet in §4.2 is ambiguous about D and narrower than its source

**Location:** README:367, "A colimit-preserving symmetric monoidal functor from a 1-semiadditive presentably symmetric monoidal stable p-local category C to such a category D, which detects invertibility on π₀ of units and sends the spaces B^kC_p to objects of rational nonzero dimension".

**Claim:** "Such a category D" reads naturally as "a 1-semiadditive presentably symmetric monoidal stable p-local category", but csy does not assume that D is semiadditive; it concludes it. The proof route at README:369 lists exactly three hypotheses for E_n[−] and never shows that K(n)-local E_n-modules are 1-semiadditive. So, as written, the application does not check every hypothesis of the bullet. The dimension hypothesis is also narrower than the source. csy asks only that, whenever B^kC_p is dualizable in D, the image of its dimension in the torsion-free quotient of π₀End(1_D) be rational and nonzero. The bullet asserts dualizability for every k and requires a nonzero rational dimension in π₀End(1_D) itself.

**Witness:** csy lines 3445–3451, Theorem 4.3.10 (hypotheses (1)–(3)). csy line 3455: "since by Corollary 3.3.2, D is then also m-semiadditive". csy line 2951 defines the torsion-free quotient R^tf, and csy line 2901 defines "rational".

**Repair:** Restate the bullet with csy's hypotheses:

- F:C→D is colimit-preserving and symmetric monoidal, between presentably symmetric monoidal stable p-local categories;
- C is 1-semiadditive;
- π₀End(1_C)→π₀End(1_D) detects invertibility;
- for every k≥0 with B^kC_p dualizable in D, the image of dim_D(B^kC_p) in the torsion-free quotient of π₀End(1_D) is rational and nonzero.

The conclusion stays: C and D are ∞-semiadditive.

Tested on E_n[−]: π₀E_n is torsion-free, and dim(B^kC_p)=p^(binom(n,k)) is a nonzero integer. The 1-semiadditivity of D is then a conclusion, so the route's three hypotheses suffice.

## R03 (P3) — §3.1 restates DGFloer's ordinary Serre spectral sequence at E=HR without citing it

**Location:** README:13, "Layer 3 adds the spectrum-valued Serre filtration, beyond GeneralAlgebraicKTheoryPartII §4.14's unfiltered homology comparison"; README:289, "E²_(s,t)=H_s(Y; y↦E_t(F_y,+)) … with the full monodromy local system". The Klein-bottle Checks are at README:309 and :313.

**Claim:** For E=HR, the spectral sequence of §3.1 is the homological Serre spectral sequence over a CW base that DGFloer Layer 1 item 2 owns on main, with its monodromy system and strong convergence. AlgebraicTopology Stage 5 item 5 consumes it. The README never cites it: DGFloer appears only for Layer 1 item 4. The Scope does not say how the kept generalization differs, and no target identifies the two at E=HR. So two unrelated constructions of one spectral sequence would coexist.

**Witness:** DGFloer README on main, lines 226–231: "The filtered-complex and ordinary Serre spectral sequences … Item 2 applies them to the skeletal filtration". AlgebraicTopology README on main, lines 915–919: "arbitraryCWSerreSpectralSequence … E²_(p,q)=H_p(B;H_q(F;R)), strong convergence".

**Repair:**

- **Scope.** Add to the bullet at README:13: "DGFloer Layer 1 item 2 owns the ordinary homological Serre spectral sequence; §3.1 generalizes it to an arbitrary coefficient spectrum E."
- **API.** Add a bullet to §3.1: for E=HR, the spectral sequence agrees from E² on, with its abutment filtration, with DGFloer Layer 1 item 2's sequence, through GeneralizedCohomology G2 item 7's identification π_*(HR⊗Σ∞_+X)=H_*(X;R).
- **Dependencies.** Add DGFloer Layer 1 item 2 to the *Needs:* line at README:315 and to the Layer 3 Dependencies at :323.

Tested on the Klein bottle with R=ℤ. Both sequences have E²_(0,0)=E²_(1,0)=ℤ, E²_(0,1)=ℤ/2 and E²_(1,1)=0, giving H₁=ℤ⊕ℤ/2 and H₂=0.

## R04 (P3) — Two Tau Ceti declarations are cited at a pin that lacks them

**Location:** README:17, "Tau Ceti already supplies `WeierstrassCurve.formalGroup` and the Serre class `AddCommGrpCat.isKilledBySomePower` …", and "Tau Ceti’s `TauCeti.SymmetricSpectrum` is the point-set category …". The same names appear at README:71 (with the path `TauCeti/AlgebraicTopology/SerreClass/PowerTorsion.lean`), :101 and :401, and at `Suggested.lean:9`.

**Claim:** This is the previous review's R01, not repaired; the head is the same commit. The branch builds against a Tau Ceti that has neither declaration. At the branch's pin, the "already supplies" claims, the file path and the §4.3 route step are therefore false.

**Witness:** The branch pins Tau Ceti at `a91d3aaf`, whose `AlgebraicTopology/` has no `SerreClass/` or `Spectra/`, and no file there contains either name. Main pins `2fd255d9`, with `isKilledBySomePower` at `SerreClass/PowerTorsion.lean:33` and `SymmetricSpectrum` at `Spectra/SymmetricSpectrum.lean:92`.

**Repair:** Rebase the branch on current main, so that `lake-manifest.json` pins Tau Ceti at `2fd255d9` or later, then re-run the targeted build. README:17, :71, :101, :401 and Suggested.lean:9 are then correct as written. Checked against main's pinned copy:

- `isKilledBySomePower (d : ℕ) : ObjectProperty AddCommGrpCat` has its `IsSerreClass` instance at line 44;
- `TauCeti.SymmetricSpectrum` is an abbreviation for modules over the sphere symmetric sequence, with no stable structure, as the docstring says.

## R05 (P3) — The Conventions refer to Checks that do not exist

**Location:** README:41, "The auxiliary letter q also denotes a prime; impose q≠p wherever displayed, while the relative-fiber Checks explicitly allow q=p."

**Claim:** No Check in the README concerns relative fibers, and none allows q=p. Every use of q carries q≠p: README:54, :143, :163 and :406. The clause points at material that is no longer in the roadmap.

**Witness:** A search of the README for "q=p" and for "relative-fiber" or "relative fiber" finds only line 41.

**Repair:** Delete ", while the relative-fiber Checks explicitly allow q=p". Tested: after the deletion, all four uses of q state q≠p, so the convention describes the text exactly.

## R06 (P3) — The References list locators that no passage cites

**Location:** README:496–507. For example, lmmt: "Remark 3.9, pp.15–16; §4.2, pp.19–21; §4.3 and Corollary 4.21 with proof, pp.21–22". mm: "§4, Theorems 4.5–4.7 and Corollary 4.8, pp.26–27; §7, Theorems 7.1–7.2, pp.35–37".

**Claim:** README:494 says the keys "identify the cited editions and versions", but several entries list locators that the body never cites. They read as consumed sources, and they are left over from deleted targets. Two entries also miss or misstate locators the body does use:

- mm's entry omits Definitions 7.3–7.4 and Example 7.5 (p.37), which §5.1 cites;
- behrens's entry gives §1.6 as pp.27–32, while Layer 1 cites §1.6, p.24.

**Witness:** README:1–491 cite none of: lmmt Remark 3.9, Corollary 4.21; mm Theorems 4.5–4.7, 7.1–7.2; behrens Theorems 1.3.2, 1.7.6; goerss Theorems 1.2, 3.6; bhm Theorem 3.1; greenlees-sadofsky Corollary 1.4; cm-tate Proposition 2.3 to Corollary 2.7.

**Repair:** Reduce each entry to the locators the body cites:

| Key | Keep |
| --- | --- |
| lmmt | §§2.1–2.2, pp.6–10 |
| mm | Definitions 7.3–7.4, Example 7.5 and Theorem 7.6, pp.37–38 |
| behrens | §1.2, pp.4–6; §1.5, p.21; §1.6, pp.24–31 |
| goerss | §3.3, pp.238–239 |
| bhm | Lemma 3.5, p.6 |
| greenlees-sadofsky | Corollary 2.4, p.400 |
| cm-tate | Definition 2.2, p.2, and Remark 2.8, p.4 |

Tested: each kept locator has at least one citation in README:1–491. Examples: lmmt Lemma 2.8 at :163, mm Example 7.5 at :470, behrens p.24 at :203, bhm Lemma 3.5 at :289, cm-tate Remark 2.8 at :329.

## Previous findings

- The previous review's R01, on the Tau Ceti pin, is not repaired. The head is the same commit, `lake-manifest.json` still pins Tau Ceti at `a91d3aaf`, and README:17 still reads "Tau Ceti already supplies `WeierstrassCurve.formalGroup` and the Serre class `AddCommGrpCat.isKilledBySomePower`". It is carried forward as R04 above.
- No repair report for this head is on the board, and no finding was marked "not actionable in this package", so nothing is re-raised under that rule.

## Verified sound

### Gate, dependency direction, Lean

- **Gate.** Re-run with the brief's command at this head, exit 0: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run also reports `build=0`.
- **Dependency check.** The brief's command printed, in full:

  ```text
  depcheck: 239 roadmaps, 2355 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or `moved:` line. In `ORDER.txt`, EllipticCohomology is at line 6, StableHomotopyKTheory at 16, RefinedTraceMethods at 328, StableHomotopyKTheoryPartII at 331, GeneralAlgebraicKTheoryPartII at 333 and ChromaticHomotopyTheory at 334.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in about 20 s with no diagnostics. The file has the single line `import Mathlib`, one module docstring and an empty `namespace TauCetiRoadmap.ChromaticHomotopyTheory`. It has no declarations, so the `#check @name` comparison and the one-tactic padding probe have nothing to act on. No `set_option`, `lemma`, `True` placeholder or sorry'd data.
- **Headline theorems.** There are six, each named in the docstring as not statable, with its missing carrier:
  - §3.1 generalized Serre filtration;
  - §4.1 raw KU Tate spectrum;
  - §4.2 higher semiadditivity and the π-finite comparison;
  - §4.3 sharp bound m=n+1;
  - §4.4 weak-ring criterion;
  - §5.1 TMF[1/N]→TMF(N) faithful Galois.

  The docstring also names the Part II separation theorem. I checked that the carriers are absent:
  - Mathlib at `6b7abb3` has no spectrum, stable homotopy category, Morava K-theory or ring-spectrum carrier: a grep for prespectrum, Ω-spectrum, stable homotopy group and ring spectrum finds none.
  - Tau Ceti at `a91d3aaf` has no `Spectra/` directory. Its "stable homotopy" hits are Frobenius exact categories, which are unrelated.
  - At main's pin `2fd255d9`, `SymmetricSpectrum` is point-set only: the `Spectra/` files define no stable equivalences and no stable homotopy groups.

  Nothing headline-level is statable, so the empty file is correct.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty, and `changes.md` lists no outside change.

### Library declarations opened at the pins

| Declaration | File and line |
| --- | --- |
| Mathlib `FormalGroup`, `FormalGroup.IsComm` | `RingTheory/FormalGroup/Basic.lean:56`, `:74` |
| Mathlib `FormalGroup.Point` (subtype of `PowerSeries.HasSubst` series) | `RingTheory/FormalGroup/Basic.lean:126` |
| Mathlib `FormalGroup.𝔾ₐ`, `𝔾ₘ`, `map` | `RingTheory/FormalGroup/Basic.lean:145`, `:161`, `:184` |
| Mathlib `CategoryTheory.ObjectProperty.isLocal` (precomposition bijective into each P-object) | `CategoryTheory/Localization/Bousfield.lean:55` |
| Mathlib `IsLocalization.flat` | `RingTheory/Flat/Localization.lean:37` |
| Mathlib `Module.Flat.lTensor_exact` | `RingTheory/Flat/Basic.lean:323` |
| Mathlib `CategoryTheory.ObjectProperty.IsSerreClass` | `CategoryTheory/Abelian/SerreClass/Basic.lean:45` |
| Tau Ceti `WeierstrassCurve.formalGroup` (at `a91d3aaf`) | `AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58` |
| Tau Ceti `AddCommGrpCat.isKilledBySomePower` (at main's `2fd255d9`) | `SerreClass/PowerTorsion.lean:33` (some power d^n kills M, per `prop_isKilledBySomePower_iff` at :39–40) |
| Tau Ceti `TauCeti.SymmetricSpectrum` (at main's `2fd255d9`) | `Spectra/SymmetricSpectrum.lean:92` |

That is ten Mathlib names and three Tau Ceti names, each with its file and line.

### Seeded sample, read at the anchors

| Target | Anchor read | Hypotheses and statement as written | Supports the text? |
| --- | --- | --- | --- |
| 3.1 | lmmt line 398 (p.10): Serre spectral sequence in T(i)-homology; bhm line 258 (Lemma 3.5, p.6, the page marker at 231 being page 6) | the fibration comparison is via a map of spectral sequences | Yes |
| 4.1 | greenlees-sadofsky line 343 (Cor. 2.4, p.400): the inverse Thom tower for cyclic H; hesselholt-ku lines 1658–1662 (p.844): π_*KU^tC_p=π_*KU⊗ℚ_p(μ_p); cm-tate line 129 (Remark 2.8, p.4): L_K(n1)(E_n2)^tC_p≠0 for n1<n2, which at (0,1) is the nonzero raw Tate | uncompleted KU in the source; README:507 says so | Yes |
| 4.2 | csy lines 1597, 1603–1645 (Lemma 3.1.2, Defs. 3.1.3 and 3.1.5, pp.32–33); 1673, 1692 (Prop. 3.1.9, Def. 3.1.10, p.34); 1909 (Prop. 3.1.18, p.37); 2000 (Thm 3.2.3, p.39); 3445 (Thm 4.3.10, pp.68–69); 3639, 3655 (Lemma 5.1.7, Cor. 5.1.9); 3882, 3923, 3930, 3970 (Thm 5.3.1, Lemma 5.3.4, Thm 5.3.5, Cor. 5.3.7, pp.79–81) | n≥0 in csy with T(0)=Hℚ (csy line 4103); README restricts to n≥1 and treats Sp_ℚ separately; csy's E_n has π_*E_n=ℤ_p[[u_i]][u^±], |u|=2, which README:365 converts to w=u⁻¹ | Yes; the bootstrap bullet is R02 |
| 4.3 | lmmt lines 382–415 (Prop. 2.11 and Remark 2.12, pp.9–10); csy line 3930 | (n+1)-connective, v_i-periodic groups vanish for 0≤i≤n, L_n^(p,f) | Yes |
| 4.4 | csy line 3616 (Def. 5.1.4, p.73); 4036–4057 (Thm 5.4.4, p.83: nonzero p-local weak ring, 0≤n<∞); 4060 (Remark 5.4.5, p.84: the π-finite form); 3726, 3731 (Ex. 5.1.13(4), Thm 5.1.14, p.76) | the four conditions match | Yes, but the route is R01 |
| 5.1 | mm lines 1757–1775 (Defs. 7.3–7.4: all n≥1; affine scheme for n≥3); 1776 (Ex. 7.5, p.37); 1801 (Thm 7.6, p.38: faithful GL₂(ℤ/nℤ)-Galois) | every N≥1 | Yes |

The README flags no locator as unverified. Outside the sample I also checked:

- behrens line 1024 (p.28, |u|=−2), 766 (§1.5, p.21), 876 (§1.6, p.24) and 1160 (Prop. 1.6.12, p.31);
- hs line 129 (Theorem 7) and ravenel line 401 (Theorem 2.1);
- bhls line 98 (Theorem A, "for all k≥0", matching README:21's k≥0 after the index shift n+1↦n) and lines 1596–1601 (Defs. 4.1–4.2: fp-type uses type n+1, the LQ property uses type n+2), matching README:27.

### Cross-roadmap citations resolved

All resolved citations match their sources; the table gives the read and the sections checked.

| Supplier (where read) | Sections opened, with line |
| --- | --- |
| GeneralAlgebraicKTheoryPartII (#1742 head `3f10248`) | §4.2 :666; §4.4 :706; §4.5 :722; §4.6 :746; §4.14 :896; §4.15 :913 (m≥2 existential, m≥n+1 by its first Check, K(ℤ/p,n)); §4.16 :929; §4.19 :977; §4.20 :993; §4.22 :1026; §4.23 :1048; §4.24 :1064; §4.28 :1135; §4.30 :1174; §4.30a :1190; §4.30c :1243; §§4.31–4.33 :1268–1323; §4.45 :1541; §5.2 :1602; §5.5 :1664; §6.5 :1799; §8.8 :2183; gap lines :204–:210 |
| BordismFormalGroups (main) | F3 :297–310 (Adams splitting; ku_(2)≃BP⟨1⟩); F6.3 :1176–1200 (L_n^f smashing, finite telescope comparison); F6.5 :2098–2112 (pointwise comma Kan extensions), :2420–2433 (Sylow transfer), :2525–2540 (L_K(n)X≃holim(L_nX∧M_i)), :2554–2569 (Landweber-exact M with M/I_(n+1)=0 is E(n)-local) |
| GeneralizedCohomology (main) | G3.7 :773; G3.9 :878; G5.1 :1512 (integral finite duality only, so the p-local gap is not already provided) |
| EnhancedDerivedSheaves (main) | E0.4 :211; E0.5 :242; E3.4 coherent mates and Beck–Chevalley :1257; E5:abstract.4 :1512; E5:presentability.1 :1597; no spectral modules over E∞-ringed stacks anywhere (so `spectral-ringed-sites` is not already provided) |
| StableHomotopyKTheory (#1227 head `5f92355`) | §§2.4–2.7 :573–612; §3.18 :1210; §3.21 :1247; §7.21 :2594; §7.24 :2661 ("No connective hypothesis on E"); §7.26 :2681; §7.27 :2695 |
| StableHomotopyKTheoryPartII (#1733 head `8947c46`) | §2.7 :373 (S→S^tC_p is p-completion); §7.2 :924 (π_*KU^tC_p=KU_*⊗ℚ_p(ζ_p)) |
| RefinedTraceMethods (#1493 head `b0ad346`) | §2.6 :646; §2.9 :853; §2.10 :879; §4.9 :1825; §4.11 :1948; §4.17 :2226 (DGM); §6.8 :2907 (L_K(1)X≃(L_KU X)_p^∧) |
| AlgebraicTopology (main) | Stage 2 item 6 local systems :382; Stage 4 :499 (extended to local systems at :529); Stage 5 :849 (item 5 :910–919); Stage 8 :1602 |
| DGFloer (main) | Layer 1 item 4 :659–665 (Hurewicz modulo a Serre class; "some power of d" instance); item 2 :226 (see R03) |
| EllipticCohomology (main) | E2 :486–490 (|u|=+2, matching README:47); E4 :1478 (Δ²⁴ in degree 576, Tmf[(Δ²⁴)⁻¹]≃TMF); E6 :1840–1849 (Γ(N) sheaves, descent under deck groups) |
| ModularCurves (main) | §3D :1711; §4B :1780; §4C :1803; §5B :2193 (affine Y_full(N), N≥3; row-vector right action at :173 and :2217); §7E :2442; §7F :2528 |

`roadmaps resolve` (`citations.md`) and `overlaps.md` list nothing unresolved and no dropped id.

### Gaps

- `design/plan.json` declares two gaps, each stated with the same slug and the same `needs` sentence under its supplier in the README:
  - `p-local-finite-duality` (GeneralizedCohomology, README:77);
  - `spectral-ringed-sites` (EnhancedDerivedSheaves, README:89).
- Both are precise and minimal:
  - GeneralizedCohomology G5.1 proves integral finite duality only, and G3.9 only integer localization. BordismFormalGroups F6 uses finite p-local spectra but never identifies the compact objects of Sp_(p).
  - EnhancedDerivedSheaves has no E∞-ringed stack modules.
- `elliptic-spectral-affineness` and `all-height-morava-realization` (README:107, :109) are declared with identical wording by GeneralAlgebraicKTheoryPartII at its head, lines 208 and 210, and announced on EllipticCohomology from there. They are inherited, as settled in earlier rounds.

### Ownership by object

- I searched every open head and main (`roadmaps grep`) for semiadditivity, ambidexterity, Hopkins–Lurie, Ravenel–Wilson, weak ring, TMF(N) and Galois extensions of ring spectra. Only this folder owns them. GeneralAlgebraicKTheoryPartII's scope (its README line 7) explicitly leaves the sharp value m=n+1 and the π-finite comparison to this roadmap. The "weak ring" hit in GL2ModularityLifting (#1071, line 1473) is an unrelated deformation ring. No earlier roadmap defines faithful Galois extensions of E∞ rings.
- The ordinary Serre spectral sequence is owned by DGFloer Layer 1 item 2; that is R03.

### Adversarial table

| Statement | Instances | Values on each side | Result / change |
| --- | --- | --- | --- |
| Conventions: multiplicative series | F=X+Y+XY | [2](X)=X+X+X·X=2X+X²; [3](X)=F(X,2X+X²)=3X+3X²+X³; mod 2: X², mod 3: X³; negated coordinate gives X+Y−XY | Pass |
| Conventions: Δ²⁴ | weight 12, ×24 | weight 288, spectral degree 2·288=576 | Pass |
| Conventions: covers | K(A,2) | ⟨3⟩=fib(K(A,2)→τ_≤2)=*; ⟨2⟩=fib(→τ_≤1=*)=K(A,2) keeps π₂=A | Pass |
| Conventions: q (README:41) | every use of q | four uses, all q≠p; 0 Checks with q=p | R05 |
| Layer 0 duality | S/p; V=S_(p), X=Hℤ | D(S/p)=Σ⁻¹S/p from S→S→S/p; π₀F(S_(p),Hℤ)=Hom(ℤ_(p),ℤ)=0 vs π₀(S_(p)⊗Hℤ)=ℤ_(p) | Pass |
| Layer 1 degrees | p=2, 3 | |v₁|=2(p−1)=2, 4; π₂BP at p=3 is 0 vs π₂MU_(3)=ℤ_(3) | Pass |
| Layer 2 type | S_(p)∧S/p; S/p∧0 | max(0,1)=1; max(1,∞)=∞ | Pass |
| §3.1 degenerate bases | Y=∅; Y=* | 0 on both sides; target E_*(F_+) | Pass |
| §3.1 monodromy | Klein bottle, E=Hℤ | E²_(0,0)=E²_(1,0)=ℤ, E²_(0,1)=ℤ/(1+1)=ℤ/2, E²_(1,1)=ker 2=0 ⇒ H₁=ℤ⊕ℤ/2, H₂=0; constant system gives ℤ², ℤ | Pass; at E=Hℤ it equals DGFloer's sequence (R03) |
| §3.1 convergence | KU over ℂP^∞ | E² only in (even, even); d_r has total degree −1 ⇒ collapse; SHKT §7.24 needs no bound on E | Pass |
| §4.1 Euler inversion | p=2; p=3 | ℤ₂[[z]]/(2+z)[1/z]=ℤ₂[1/2]=ℚ₂; z²+3z+3 Eisenstein, discriminant −3 ⇒ ℚ₃(√−3)=ℚ₃(ζ₃) | Pass |
| §4.1 vanishing | KU_p^∧, T(1) | K(1)-local ⇒ T(1)-local (⟨K(1)⟩≤⟨T(1)⟩) ⇒ L_T(1)((KU_p^∧)^tC_p)=0 by GAKT-II §4.24 | Pass |
| §4.1 sphere | S, trivial C_p | S^tC_p≃S_p^∧: π₀=ℤ_p, π_(<0)=0 (SHKT-II §2.7) | Pass |
| §4.2 two points | {a,b}→* | norm = identity matrix, |{a,b}|=2; all-ones has det 0 | Pass |
| §4.2 rational cardinality | Sp_ℚ, BC_p | unit 1, Nm⁻¹=1/p, counit 1 ⇒ |BC_p|=1/p (norm instead of inverse gives p) | Pass |
| §4.2 integral norm | Hℤ, C₂ in Sp | norm ×2 on π₀=ℤ, coker ℤ/2=Ĥ⁰(C₂;ℤ); π_j(Hℤ^tC₂)=ℤ/2 (j even), 0 (j odd) | Pass |
| §4.2 cardinalities in Sp_T(n) | n=2, k=0,1,2 | image p^(binom(n−1,k)) (csy line 3903): p, p, 1; so invertible for k≥n only, matching README:363 | Pass |
| §4.2 dimension | n=1, k=0..3; n=2, k=0..3 | p, p, 1, 1; p, p², p, 1; at n=k=2 p^(binom)=p vs p^(nk)=p⁴ | Pass |
| §4.2 π-finite comparison | n=1: BC_p, K(C_p,2); n=2: K(ℤ/p,2), K(ℤ/p,3); K(ℤ/q,2) | reduced ranks p−1, 0; p−1, 0; q-torsion is T(n)-acyclic | Pass |
| §4.2 nil-conservativity | R=L_T(1)S; R=L_T(1)Hℤ | L_K(1)S≠0; K(1)⊗Hℤ=0 ⇒ T(1)⊗Hℤ=0 ⇒ R=0 | Pass |
| §4.2 bootstrap | E_n[−] vs csy Thm 4.3.10 | π₀E_n torsion-free; dims p^(binom(n,k))∈ℤ∖0; D semiadditive is a conclusion (csy line 3455), not a hypothesis | R02 |
| §4.3 sharp bound | n=1, n=2 | K(ℤ/p,n+1) rank 1 ⇒ acyclic; K(ℤ/p,n) rank p (reduced p−1) ⇒ m≥n+1 (GAKT-II §4.15 Check) | Pass |
| §4.3 height zero | K(ℤ/q,n+1), q≠p | π_(n+1)[1/p]=ℤ/q≠0; Hℚ-acyclic | Pass |
| §4.3 third assertion | Σ^(n+1)H𝔽_p→0; Σ^nH𝔽_p→0 | Ω∞ gives K(ℤ/p,n+1) (acyclic) vs K(ℤ/p,n) (rank p) | Pass |
| §4.3 infinite group | K(ℤ/p^∞,n+1) | colimit of K(ℤ/pʳ,n+1), each acyclic ⇒ 0 | Pass |
| §4.4 four conditions | Hℚ, n=0; H𝔽_p; KU_(p), n=1; KU_(p), n=0 | all hold; (3) fails at j=∞ and (2) has H̃₁(BC_p;𝔽_p)=𝔽_p; K(j)⊗KU=0 for j≥2 and j=∞ ⇒ Σ∞K(C_p,2)⊗KU=0 (Anderson–Hodgkin); K(1)⊗KU≠0 and KU_*(BC_p) reduced ≠0 | Pass |
| §4.4 n=0, non-nilpotent π₁ | f:*→BA₅, p=2 | τ_≤0 both a point; |A₅|=60; Sylow C₂×C₂, index 15 a 2-local unit | Statement true; route gap R01 |
| §4.4 weak-ring hypothesis | R′=I_(ℚ/ℤ)⊗S_(p), p=2, F(1)=S/2 | π₀R′=ℤ/2^∞; K(j)⊗R′=0; π₁(S/2⊗R′)=ker(2)=ℤ/2≠0 | Pass |
| §5.1 group orders | N=1, 2, 3, 5 | 1; (4−1)(4−2)=6; (9−1)(9−3)=48; (25−1)(25−5)=24·20=480 | Pass |
| §5.1 action convention | N=3, upper g, lower h | ((P,Q)g)h=(2P+Q,P+Q); ((P,Q)h)g=(P+Q,P+2Q); diag(−1,1) has det −1, ζ↦ζ⁻¹ | Pass |
| §5.1 Galois axioms | C₂, B=A×A; trivial S₃; B=0 | B⊗_AB=A⁴=∏_(C₂)B; 6, 36, 36 factors; Hℤ⊗0=0 not conservative | Pass |
| §5.1 localization | N=2, N=3 at 2 | ℤ[1/2]⊗ℤ_(2)=ℚ; ℤ[1/3]⊗ℤ_(2)=ℤ_(2) | Pass |
| Part II Theorem A | bhls line 98 | "for all k≥0" vs README "k≥0", n+1↦n | Pass |
| Part II fp-type | ku₂^∧, U=cofiber of v₁⁴; S/2 | π_*=𝔽₂[v₁]/(v₁⁴): degrees 0, 2, 4, 6; 𝔽₂[v₁] unbounded | Pass |
| Part II fixed points | p=2, k=0 | π₋₁(BP⟨1⟩^hℤ)=coker(ψ−1=0 on ℤ₂)=ℤ₂ | Pass |
| Part II purity Check | C=Hℤ_p, n=2 | L_(T(1)∨T(2))Hℤ_p=0 ⇒ L_T(2)K(ℤ_p)=L_T(2)K(0)=0 | Pass |
| Tau Ceti pin | a91d3aaf vs 2fd255d9 | `SerreClass/`, `Spectra/` absent vs present | R04 |
| References | 13 entries | 0 body citations for the listed locators in R06's witness | R06 |

### Notes for the human approver (no change requested)

- **Level-three Galois extension.** GeneralAlgebraicKTheoryPartII's `gap:elliptic-level-three-galois` (its line 204) asks EllipticCohomology E6 for TMF[1/3]→TMF(3). §5.1 here proves every N≥1 without that input, as README:11 says; a human reviewer chose this arrangement in an earlier round. If EllipticCohomology fulfils that gap, the N=3 case acquires a second owner.
- **BordismFormalGroups revision.** The open revision #1854 moves the generic Kan-extension foundations from F6.5 to GeneralizedCohomology G2.11. This README cites F6.5's pointwise formula (README:83, :369). By policy it cites main, and `overlaps.md` lists no dropped id.
- **Lower-bound witness.** GeneralAlgebraicKTheoryPartII §4.15's lower-bound Check uses the Ravenel–Wilson rank of K(ℤ/p,n), which §4.2 here owns as a target. That is the supplier's review.
- **Pull-request description.** It says the roadmap "shows ko→KO is a T(n)-equivalence for n≥1", which README:10 assigns to GeneralAlgebraicKTheoryPartII §4.30a. It also calls `WeierstrassCurve.formalGroup` Mathlib's, but it is Tau Ceti's. The description is outside the folder.

## Not verifiable

- HL13, Proposition 3.4.3, which lies behind csy Lemma 5.1.7, is not in the source cache.
- Ravenel–Wilson, Theorem 9.2, was read only through csy line 3655.
- The transfer identity used in R01's repair (that restriction followed by transfer is multiplication by the index on ℤ_(p)-homology) is the standard group-homology fact. It was not read in a cached source, and BordismFormalGroups F6.5 states the cohomological form.
- Pull-request comments were not read. No repair report for this head is on the board.

## Source issues

- **Error** in lmmt at Remark 2.12, p.10: the source reduces to T(i)⊗K(π,r)=0 for every finite π and 0≤i≤n, via CSY Theorem E for p-local rings, but T(0)=S[1/p] is not p-local and fails for π=ℤ/q; it should restrict to p-groups and treat i=0 by p-power torsion; affects the proof.
- **Gap** in csy at Remark 5.4.5, p.84: the source derives the π-finite form at every n "as in the proof of Theorem 5.3.5", whose n=0 case is only rational; it should add a Sylow transfer step for p-local E and non-nilpotent π₁, such as A₅ at p=2; affects the proof.
- **Misprint** in csy at §5.1, before Theorem 5.1.14, p.76 (csy line 3729): the source spells the attribution "Devintaz"; it should be Devinatz; affects nothing.
- **Misprint** in csy at the proof of Theorem 5.4.4, p.83 (csy line 4054): the source repeats the word "Lemma" before 5.1.6; it should name Lemma 5.1.6 once; affects nothing.
