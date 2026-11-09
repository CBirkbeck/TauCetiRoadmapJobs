# Review of ChromaticHomotopyTheory (pull request #1643 at 8114457)

**Verdict:** needs changes

Incremental re-review of the 51 lines changed since 492fe6d (the §3.1 comparison with DGFloer's ordinary Serre spectral sequence, the §4.2 bootstrap bullet and its n=0 route, the §4.4 route from the first to the fourth condition, the Conventions clause, the references). Two P3 findings remain, no P1 or P2: the Tau Ceti pin (the previous review's R04, not repaired, since `lake-manifest.json` is unchanged) and a notation clash the new DGFloer contract introduced. The gate passes with the build and the dependency check is clean.

## R01 (P3) — Two Tau Ceti declarations are cited at a pin that lacks them

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:17`, "Tau Ceti already supplies `WeierstrassCurve.formalGroup` and the Serre class `AddCommGrpCat.isKilledBySomePower`", and "Tau Ceti’s `TauCeti.SymmetricSpectrum` is the point-set category"; the same names at README:71 (with the path `TauCeti/AlgebraicTopology/SerreClass/PowerTorsion.lean`), :101 and :407, and in `Suggested.lean:9`.

**Claim:** This is the previous review's R04, not repaired. The branch still pins Tau Ceti at `a91d3aaf` (`lake-manifest.json`, unchanged since the previous head), and that Tau Ceti has neither declaration, so the "already supplies" claims, the file path and the §4.3 route step are false at the pin the folder builds against.

**Witness:** At `a91d3aaf` the directory `TauCeti/AlgebraicTopology/` has twenty entries and no `SerreClass/` or `Spectra/`; a search of the whole library for either name finds nothing. `WeierstrassCurve.formalGroup` is there, at `AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58`. Main pins `2fd255d9`, where `isKilledBySomePower` is at `SerreClass/PowerTorsion.lean:33` and `SymmetricSpectrum` at `Spectra/SymmetricSpectrum.lean:92`.

**Repair:** Rebase the branch on current main, so that `lake-manifest.json` pins Tau Ceti at `2fd255d9` or later, and re-run the targeted build. README:17, :71, :101, :407 and `Suggested.lean:9` are then correct as written; nothing in the folder changes.

## R02 (P3) — The new DGFloer contract reuses the reserved letters p, q and E

**Location:** README:101, "E²_(p,q)=H_p(B;H_q(F;R)) with path-transport monodromy, strong convergence to H_(p+q)(E;R) with its abutment filtration, naturality and the componentwise version; §3.1 compares it with the case E=HR."

**Claim:** The Conventions (README:41) fix p as the prime and q as an auxiliary prime with q≠p "wherever displayed"; the sentence displays p and q as bidegrees, where p=q occurs (the entry E²_(1,1) of the Klein-bottle Check at README:311). In the same sentence E is the total space of the fibration in "H_(p+q)(E;R)" and the coefficient spectrum in "the case E=HR". The passage copies DGFloer's letters instead of §3.1's (F→X→Y, bidegrees (s,t)).

**Witness:** README:289 writes the same spectral sequence as E²_(s,t)=H_s(Y; y↦E_t(F_y,+)) with target π_(s+t)(E⊗Σ∞_+X); README:301 identifies E² with H_s(Y;H_t(F_y;R)) and the abutment with H_*(X;R).

**Repair:** Rewrite the contract in §3.1's letters: "homological Serre spectral sequence of a Serre fibration F→X→Y over a path-connected CW base Y with coefficients in a commutative ring R: the filtration of singular chains by the preimages of the skeleta of Y, E²_(s,t)=H_s(Y;H_t(F;R)) with path-transport monodromy, strong convergence to H_(s+t)(X;R) with its abutment filtration, naturality and the componentwise version; §3.1 compares it with the case E=HR." Tested on the Klein bottle: E²_(1,1)=0 then reads as bidegree (1,1) with no clash with the prime, and "E=HR" has one referent.

## Previous findings

- R01 — repaired: the converse step was replaced by "The first condition gives the fourth by the localization statement of §4.2 above, applied to L_R … At n=0 this covers π-finite spaces with any finite fundamental group, through the rational case of §4.2" (README:429), the §4.2 route now treats n=0 in Sp_ℚ through A→Bπ₁(A) and the cardinality #π₁(A) (README:371), and the A₅ Checks are at README:393 and :437. The cycle is now (1)⇒(4)⇒(2)⇒(3)⇒(1); each step is checked in the table below.
- R02 — repaired: README:369 states csy's three hypotheses with the torsion-free quotient and "no semiadditivity of D is assumed"; the route derives D's semiadditivity from csy Corollary 3.3.2 (README:371) and adds the Hℤ/p² Check (README:391).
- R03 — repaired: Scope (README:13), the API bullet (README:301), the proof route (README:303), the *Needs:* line (README:317), the Layer 3 Dependencies (README:325) and the contracts for GeneralizedCohomology G2.7 (README:75) and DGFloer Layer 1 item 2 (README:101) now cite the ordinary Serre spectral sequence and identify the two at E=HR. The repair introduced R02 above.
- R04 — not repaired: `lake-manifest.json` still pins Tau Ceti at `a91d3aaf`; README:17 still reads "Tau Ceti already supplies … `AddCommGrpCat.isKilledBySomePower`". Carried as R01 above.
- R05 — repaired: README:41 now ends "impose q≠p wherever displayed." A search of the README finds no "q=p" and no "relative-fiber".
- R06 — repaired: the thirteen entries at README:503–515 list only locators the body cites, and the two previously missing ones are present (mm "Definitions 7.3–7.4, Example 7.5 and Theorem 7.6, pp.37–38"; behrens "§1.6, pp.24–31").

No repair report for this head is on the board, and no finding was marked "not actionable in this package", so nothing is re-raised under that rule.

## Verified sound

### Gate, dependency direction, Lean

- **Gate.** Re-run with the brief's command and `--build` at this head, exit 0: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- **Dependency check.** The brief's command printed, in full:

  ```text
  depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. DGFloer and GeneralizedCohomology, the suppliers the change adds, are on main (not in `ORDER.txt`, which lists only open roadmaps); GeneralAlgebraicKTheoryPartII is at line 333 and ChromaticHomotopyTheory at 334.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in under 5 s with no diagnostics. The file is unchanged: `import Mathlib`, one module docstring, an empty namespace, no declarations, so the `#check @name` comparison and the one-tactic probe have nothing to act on; no `set_option`, `lemma`, `True` placeholder or sorry'd data. The six headline theorems remain named as not statable with their missing carriers, as the previous review verified.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty; `changes.md` lists no outside change. The pull-request description is unchanged.

### Seeded sample, where it falls in the changed passages

| Target | Anchor read | Hypotheses and statement as written | Supports the text? |
| --- | --- | --- | --- |
| 3.1 (comparison bullet, README:301) | DGFloer README on main, lines 531–541 (`arbitraryCWSerreSpectralSequence`: every path-connected CW base, filtration by preimages of skeleta, E²_(p,q)=H_p(B;H_q(F;R)) with path-transport monodromy, convergence to H_(p+q)(E;R), exhaustive separated first-quadrant filtration with E∞ its graded pieces, no finite-type bound, naturality under maps of fibrations and coefficients, componentwise version); GeneralizedCohomology README on main, lines 405–431 (G2.7: HA for any abelian A, comparison "with AT's reduced/absolute/relative singular theories, including Stage 4.5's required quotient comparison and the normalized pair boundary") | Serre fibration, path-connected CW base, coefficient ring R; pair boundary supplied | Yes |
| 4.2 (bootstrap bullet, README:369) | csy line 3445–3451 (Theorem 4.3.10, pp.68–69: 1≤m≤∞; (1) C 1-semiadditive, (2) R_C→R_D detects invertibility, (3) for 0≤k<m, if B^kC_p is dualizable in D then the image of dim_D(B^kC_p) in R_D^tf is rational and nonzero); line 3229 (R_C=Hom_hC(1,1)); line 2898 (Definition 4.1.8, p.57: rational = image of ℤ[S_R⁻¹]); line 2950 (Definition 4.1.14, p.58: R^tf=R/I_tor) | the three hypotheses, the quotient and "rational" match; csy line 3455 "by Corollary 3.3.2, D is then also m-semiadditive" supports "no semiadditivity of D is assumed" | Yes |
| 4.2 (route, README:371) | csy line 2366 (Corollary 3.3.2, p.46: F m-finite-colimit-preserving monoidal, tensor distributes over m-finite colimits, C m-semiadditive ⇒ D m-semiadditive); line 3464 (dim_D(B^kC_p)=\|B^kC_p\|_D·\|B^(k−1)C_p\|_D in R_D^tf); line 1705 (Example 3.1.12, p.35: integration over a finite set is summation); line 1909 (Proposition 3.1.18, p.37: counit q_!q^*→id invertible for connected A with ΩA C-amenable); line 3923 (Lemma 5.3.4, p.80: \|B^kC_p\| invertible in π₀S_T(n) for k≥n≥0); lines 3949–3961 (proof of Theorem 5.3.5, p.81: n=0 "obvious", n≥1 simply connected, refinement to B^kC_q layers with k≥n+1, Proposition 3.1.18 with \|ΩB^kC_p\|=\|B^(k−1)C_p\|) | the route follows the source for n≥1 and supplies the n=0 argument the source omits | Yes |
| 4.4 (route, README:429) | csy lines 4036–4057 (Theorem 5.4.4, p.83: (1)⇒(2) "follows from Corollary 5.3.7", (2)⇒(3) via Lemma 5.1.12 and Ravenel–Wilson, (3)⇒(1) via Theorem 5.1.14); lines 4060–4066 (Remark 5.4.5, p.84: condition (2′) on π-finite maps inducing an isomorphism on the n-th Postnikov truncation); lines 3970–3978 (Corollary 5.3.7, p.81: L:Sp_(p)→Sp_(p) with L(F(n+1))=0 factors through L_n^f, localization at T(0)⊕⋯⊕T(n)) | the four conditions match; the README's (1)⇒(4) is the source's (1)⇒(2) argument carried to (2′) | Yes |
| 4.1, 4.3, 5.1 | untouched by the diff | as in the previous report | as in the previous report |

The README flags no locator as unverified. Page numbers of the new csy citations checked against the page markers: p.46 at line 2365, p.57 at 2889, p.58 at 2932, p.68 at 3413, p.69 at 3453, p.80 at 3893, p.81 at 3939.

### Library declarations opened at the pins

| Declaration | File and line |
| --- | --- |
| Tau Ceti `WeierstrassCurve.formalGroup` (branch pin `a91d3aaf`) | `AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58` |
| Tau Ceti `AddCommGrpCat.isKilledBySomePower`, `TauCeti.SymmetricSpectrum` (branch pin `a91d3aaf`) | absent: no `AlgebraicTopology/SerreClass/`, no `AlgebraicTopology/Spectra/` (R01) |

The Mathlib declarations the README cites are unchanged since the previous review, which opened all ten at `6b7abb3`.

### Cross-roadmap citations resolved this round

| Supplier (where read) | What was checked |
| --- | --- |
| DGFloer (main) | Layer 1 item 2, README lines 470–541: `arbitraryCWSerreSpectralSequence` (:531) and `arbitraryBaseSerreSpectralSequence` (:542) with the hypotheses in the sample table; item 4 at :659 unchanged. The open revision of DGFloer still carries "Layer 1 item 2" (its README line 888) and the CW Serre spectral sequence (line 1048); a revision is never a dependency, and the README cites main. |
| GeneralizedCohomology (main) | G2.7 at README line 405 ("Represented theories and ordinary adapters"), which the roadmap itself cites as "G2.7" at its lines 625 and 820; it consumes DGFloer 1.2 and 1.4, so no cycle with this roadmap. |
| AlgebraicTopology (main) | Stage 5 item 5, lines 910–919, consumes DGFloer's `arbitraryCWSerreSpectralSequence`, consistent with the Scope's ownership statement at README:13. |

`citations.md` and `overlaps.md` list nothing unresolved, no dropped id and no conflicting head.

### Adversarial table

Rows for untouched statements carry forward from the previous report (PRREVIEW-ChromaticHomotopyTheory~9); rows for changed statements give the values computed now.

| Statement | Instances | Values on each side | Result / change |
| --- | --- | --- | --- |
| Conventions, Layers 0–2, §4.1, §4.3, §5.1, Part II rows | as in the previous report | as in the previous report | Pass (previous report) |
| Conventions: q (README:41) | every use of q | four uses (README:54, :143, :163, :412), all q≠p; the deleted clause referred to zero Checks | Pass (R05 repaired) |
| §3.1 comparison at E=HR (README:301) | Klein bottle over S¹, R=ℤ | §3.1: E²_(0,0)=E²_(1,0)=ℤ, E²_(0,1)=coker(1−(−1))=ℤ/2, E²_(1,1)=ker(2)=0; DGFloer item 2 with B=S¹, H₁(F;ℤ) twisted by −1: the same four groups; abutments H₁=ℤ⊕ℤ/2, H₂=0 on both sides | Pass |
| §3.1 comparison, degenerate base | Y=* | §3.1 target E_*(F_+)=H_*(F;R); DGFloer with B=*: column 0 only, E²_(0,t)=H_t(F;R) | Pass |
| §3.1 exact couples (README:303) | pair (X_s,X_(s−1)) | spectrum side: D¹=π_*(HR⊗Σ∞_+X_s)=H_*(X_s;R), E¹=π_*(HR⊗cofib)=H_*(X_s,X_(s−1);R) by G2.7's relative comparison; chain side: D¹=H_*(C_*(X_s)), E¹=H_*(C_*(X_s)/C_*(X_(s−1)))=H_*(X_s,X_(s−1);R); boundaries match by G2.7's pair boundary | Pass |
| §4.2 bootstrap hypotheses (README:369) vs csy 4.3.10 | E_n[−], n=1, 2 | R_D=π₀E_n=W(k)[[u₁,…,u_(n−1)]], I_tor=0, R_D^tf=R_D; dim(B^kC_p)=p^(binom(n,k)): n=1: p, p, 1, 1; n=2: p, p², p, 1 for k=0..3, each a nonzero integer, hence rational and nonzero in R_D^tf | Pass (R02 repaired) |
| §4.2 torsion-free Check (README:391) | D=Mod_(Hℤ/p²) | R_D=ℤ/p²; p²·x=0 for all x so I_tor=R_D and R_D^tf=0; dim(p points)=p: nonzero in ℤ/p², zero in R_D^tf; π₀((Hℤ/p²)^tC_p)=Ĥ⁰(C_p;ℤ/p²)=(ℤ/p²)/p(ℤ/p²)=ℤ/p≠0, so the C_p-norm is not invertible | Pass |
| §4.2 route, n≥1 layers (README:371) | Sp_T(2), layers B^kC_p | \|B^(k−1)C_p\| has image p^(binom(1,k−1)) in π₀E₂: p, p, 1 for k−1=0,1,2; invertible exactly for k−1≥n=2, so k≥n+1=3, which the refinement guarantees | Pass |
| §4.2 route, n=0 (README:371, :393) | A=BA₅, p=2 | A₅ simple of order 60, not solvable, so no refinement into B^kC_ℓ layers; ΩBA₅=A₅, 60 points, \|ΩBA₅\|=60∈ℚ^×; Proposition 3.1.18 gives Hℚ⊗Σ∞_+BA₅≃Hℚ, i.e. H̃_*(BA₅;ℚ)=0; at n=1 BA₅ is not 1-connected, excluded | Pass (R01 repaired) |
| §4.2 route, n=0 cardinalities | Sp_ℚ, B^kC_ℓ | dim(B^kC_ℓ)=1 rationally for k≥1, so \|B^kC_ℓ\|=1/\|B^(k−1)C_ℓ\|: ℓ, 1/ℓ, ℓ, 1/ℓ for k=0..3, all units of ℚ | Pass |
| §4.4 (1)⇒(4) (README:429) | general n; n=0, p=2 | fibers of A→τ_≤nA are n-connected covers of components, π-finite; L_R kills F(n+1) and is a localization of Sp_(p) (R-local ⇒ p-local: Y/q is R-acyclic and R-local, so 0); Corollary 5.3.7 makes L_R(Σ∞_+) invert A→τ_≤nA and B→τ_≤nB, and τ_≤nf is an equivalence, so R⊗Σ∞_+f is one by two-out-of-three. At n=0, p=2: thick(F(1))=C₁∋S/2, so R/2=0, 2 a unit on the 2-local R, R rational, Σ∞BA₅⊗R=0 | Pass |
| §4.4 (4)⇒(2) (README:429) | K(C_p,n+1)→* | τ_≤nK(C_p,n+1)=*, so (4) gives Σ∞_+K(C_p,n+1)⊗R≃R, i.e. Σ∞K(C_p,n+1)⊗R=0 | Pass |
| §4.4 A₅ Check (README:437) | towers with fibers K(C₂,k), BG_odd | π₁(A_i) is an extension of π₁(A_(i+1)) by a quotient of π₁(fiber)∈{C₂, G_odd, 1}; composition factors stay in {C₂}∪{odd order}; A₅ is simple of even order 60 and not C₂ | Pass |
| DGFloer contract letters (README:101) | Klein bottle entry (1,1) | p=q=1 displayed under "q≠p wherever displayed"; E = total space and E=HR in one sentence | R02 |
| References (README:503–515) | 13 entries | every listed locator has a body citation (csy: 27 locators, each found; lmmt §§2.1–2.2 at :163, :251, :265, :275, :289, :405; mm Example 7.5 at :477, :489; behrens p.24 at :203, pp.30–31 at :489); no body locator missing from its entry | Pass (R06 repaired) |
| Tau Ceti pin | a91d3aaf vs 2fd255d9 | `SerreClass/`, `Spectra/` absent vs present | R01 |

### Gaps and ownership

- Unchanged since the previous review: `p-local-finite-duality` (README:77) and `spectral-ringed-sites` (README:89) are declared with the same slug and sentence in `design/plan.json`; `elliptic-spectral-affineness` and `all-height-morava-realization` (README:107, :109) are GeneralAlgebraicKTheoryPartII's. The diff touches none of them.
- Ownership: the diff adds no construction; it cites DGFloer Layer 1 item 2 as the owner of the ordinary Serre spectral sequence, which is what the previous R03 asked for, and keeps the spectrum-valued generalization here.

## Not verifiable

- HL13, Proposition 3.4.3, behind csy Lemma 5.1.7, is not in the source cache (unchanged from the previous review).
- Ravenel–Wilson, Theorem 9.2, was read only through csy line 3655.
- Pull-request comments were not read. No repair report for this head is on the board.

## Source issues

- **Gap** in csy at Remark 5.4.5, printed page 84: the source derives the π-finite form (2′) for every p-local E and every n "as in the proof of Theorem 5.3.5", whose n=0 case only says the claim is obvious and whose n≥1 case needs simple connectivity; it should give the n=0 argument for a non-nilpotent fundamental group, for instance A₅ at p=2 by a Sylow transfer; affects the proof.
- **Misprint** in csy at §5.1, before Theorem 5.1.14, printed page 76 (csy line 3729): the source spells the attribution "Devintaz"; it should be Devinatz; affects nothing.
- **Misprint** in csy at the proof of Theorem 5.4.4, printed page 83 (csy line 4054): the source repeats the word "Lemma" before 5.1.6; it should name Lemma 5.1.6 once; affects nothing.
- **Error** in lmmt at Remark 2.12, printed page 10 (lmmt line 406): the source reduces to T(i)⊗K(π,r)=0 for every finite π and 0≤i≤n through CSY Theorem E for p-local ring spectra, but its T(0)=S[1/p] (lmmt line 72) is not p-local and T(0)⊗K(ℤ/q,r)≠0 for q≠p; it should restrict to p-groups and treat i=0 by p-power torsion; affects the proof.
