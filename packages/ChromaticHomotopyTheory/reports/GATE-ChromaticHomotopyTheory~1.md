# GATE-ChromaticHomotopyTheory~1: answers to human review

Reviewed head 1393f69; repairs committed as d7a196cb on the pull-request branch (not pushed). One review (CBirkbeck, 2026-10-27T19:26:58Z) with five findings, numbered H01–H05 in order.

## H01 (CBirkbeck) — applied

The sharp bound did depend on telescopic Tate vanishing. CSY Theorem 5.3.1 lists Kuhn's 1-semiadditivity of Sp_T(n) as hypothesis (1) (csy line 3882 and line 3890). Theorem 5.3.5, Corollary 5.3.7 and Theorem 5.4.4 (1)⇒(2) all rest on it (csy line 3962, line 3978 and line 4045). The contract's "independently of this roadmap's telescopic Tate results" clause could not be met. The README changes:

- The `gap:weak-ring-finite-postnikov` contract to BordismFormalGroups is deleted.
- §6.3 now states LMMT Proposition 2.11: there is an m≥2, depending on n and p (lmmt line 382). Its route is nullification only, with m=d+1, where d is the bottom homotopy degree of V. §6.4 now uses "the integer m of §6.3".
- New §9.6, "Higher semiadditivity and the sharp connectivity bound", comes after §9.3 and is owned here. It contains:
  - Hopkins–Lurie norms and m-semiadditivity.
  - ∞-semiadditivity of Sp_T(n) for n≥1, bootstrapped from §9.3.
  - CSY Theorem 5.3.5 and Corollary 5.3.7.
  - The former gap statement as a target (CSY Theorem 5.4.4 and Remark 5.4.5).
  - The m=n+1 refinement of §6.3–§6.4 (LMMT Remark 2.12, lmmt line 406).

This follows the reviewer's first suggested fix. The new layer order is §5.2 → §9.3 → §9.6 → (sharp §6.3–§6.4). §9.3 does not use Layer 6, so there is no cycle.

## H02 (CBirkbeck) — applied

Hahn's Proposition 4.5 does use an H∞ map MUP→E (Ando, generalised by Zhu) and the resulting Euler-class formula for ϕ(u) (hahn line 380–389). The other inputs are:

- Lemma 2.5, which uses η_L≡η_R (hahn line 148).
- Coefficient extraction in Corollary 4.5.2 (hahn line 394).

§10.1 gains a named "valuation descent" block for the Honda E of height h+1 and h≥1:

- The Tate-valued Frobenius ϕ, built from AInfCohomology §AI.7.2's Tate diagonal.
- The congruence for ϕ(u_k).
- Construction of MUP and the H∞ orientation, owned here; no roadmap on main or at an open head owns MUP or H∞ orientations of Morava E-theory.
- The formula ϕ(u)=u/(z·[2](z)⋯[p−1](z)).
- The discrete valuation ring 𝔽_p[[u_h]][z]/(g(z)) and val P(u_h)=p^(−h).
- Coefficient extraction.

§10.2's route and its *Needs:* line now name these inputs instead of "valuation descent" alone. An AInfCohomology supplier contract and scope line were added; AInfCohomology is earlier in the merge order.

## H03 (CBirkbeck) — applied differently

EllipticCohomology E5 (at the head of its open pull request, 621dc2a) does build gl₁(R) on GeneralizedCohomology's commutative-ring model, the Thom-orientation mapping space, and an E₁ Thom refinement compared with G5.3. EllipticCohomology is a supplier of this roadmap, so the repair puts ownership in E5, which is upstream, rather than in a new extension of GeneralizedCohomology G5.3. A G5.3 extension would mean re-planning a roadmap on main or a gap contract with no owner, the defect found in H01. The changes:

- Scope and the EllipticCohomology contract now list E5 and what it supplies.
- §13.1 defines GL₁R=Ω∞gl₁(R) and BGL₁R=Ω∞Σgl₁(R) from E5's gl₁(R), and keeps only the Thom module of arbitrary R-line systems and its E_n structure.
- A new §13.1 API bullet identifies R=S loop-map Thom rings with E5's E₁ refinement and, through E5, with G5.3.

Supply runs one way: E5 → §13.1.

## H04 (CBirkbeck) — answered

The README already names EllipticCohomology as a direct supplier: in Scope (E1–E4 and E6, now E5 too), in its own supplier contract, and in the Layer 7 and Layer 12 *Needs:* lines. Depcheck counts those edges, and EllipticCohomology is an open pull request that adds a new folder, so it is an admissible supplier. The omission is in the pull-request description's dependency and merge-order lists. That text is outside the files this job may edit, so the worker has to add EllipticCohomology there when replying.

## H05 (CBirkbeck) — applied

The counterexample holds: t↦t/2 sends filtration 0 {0,1} to {0,1/2}, which is outside {0,1}. The §6.1 API bullet changes from "natural under maps of fibrations and coefficient spectra" to a narrower statement:

- The filtration is natural under coefficient maps and under maps of fibrations whose base map is cellular.
- An arbitrary map induces maps from E² on and on the abutment, via cellular approximation of the base map and homotopy lifting in the target fibration. These maps do not depend on the choice, because a cellular homotopy raises filtration by at most one.

The proof route, *Needs:* (AlgebraicTopology Stage 4 cellular approximation) and a new Check carrying the reviewer's example were added.

## Build and gate

- `lake build TauCetiRoadmap.ChromaticHomotopyTheory.Suggested`: `Build completed successfully (8976 jobs).`
- Gate: `gate ChromaticHomotopyTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 155 roadmaps, 1060 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines. Before the edits it showed 1057 edges, so the new AInfCohomology and E5 edges are accepted.

## Other notes

- **Suggested.lean.** It still declares nothing (empty namespace), so the `#check @name` comparison has nothing to compare and was not run. The docstring changes:
  - The §6.3–§6.4 entry drops "sharp".
  - A §9.6 entry was added, in README order. Its missing carriers: spectra and their local ∞-categories, ∞-categorical Kan extensions with Hopkins–Lurie norms, Morava K-theories and finite type-(n+1) spectra.
  - The §10.1–§10.3 entry adds the Tate-valued Frobenius and H∞ orientations.
- **Duplication against the pins.** Mathlib's `CategoryTheory.SemiadditiveOfBinaryBiproducts` (`Mathlib/CategoryTheory/Preadditive/OfBiproducts.lean`) is the ordinary-category biproduct notion. It is not ∞-categorical ambidexterity, and the pinned Mathlib and Tau Ceti have no spectra.
- **Ownership.** I searched (`roadmaps grep`) for semiadditivity and ambidexterity, MUP and H∞ orientations, GL₁/gl₁ and the Tate diagonal, by object, across main and the open heads. The results:
  - Higher semiadditivity: no other owner, so §9.6 owns it.
  - MUP and the H∞ orientation: no other owner, so §10.1 owns them.
  - Tate diagonal: AInfCohomology §AI.7.2.
  - gl₁ and the E₁ Thom refinement: EllipticCohomology E5.
  - No notion was moved down from a later roadmap.
- **Sources.** Ando and Zhu are cited only through hahn line 380. Ravenel–Wilson is cited only through csy line 3655 and line 4050, and its computation is now a target of §9.6. I opened no other text, and no `needs-references.toml` entry is needed.
- **Untrusted text.** The review contained nothing suspicious.

## Adversarial pass on changed or added statements

| Statement | Instances | Computed values | Result | Change |
|---|---|---|---|---|
| §6.3 existential m | V simply connected with bottom degree d≥2 | m=d+1≥3 | Admissible m exists | L_n^(p,f)-local Z need not be p-local, so the route now tests each T(i) on Σ∞F_(p) and uses p-local equivalence of Σ∞F→Σ∞F_(p) |
| §6.3 Check, relative fiber | BS₃×K(ℤ/q,m)→BS₃, q=p versus q≠p | π_m[1/p]=0 versus ℤ/q; H̃_m(K(ℤ/q,m);ℤ[1/p])=ℤ/q | Only q=p is admitted | Old fiber K(ℤ/q,2) need not be m-connective for unknown m; replaced by K(ℤ/q,m) |
| §6.4 Check | Hℤ→0 | Fiber π₀=ℤ | Not 1-connective, so excluded for every m | Rephrased |
| §9.6 Sp_T(0) on all spectra | S[1/p] with C_q action, q≠p | Norm not invertible, since q is not inverted | Not 1-semiadditive | Stated explicitly; ∞-semiadditivity claimed only for n≥1 and for Sp_ℚ |
| §9.6 non-example | Trivial C_p-action on H𝔽_p in Sp_(p) | Ĥ^(−k)(C_p;𝔽_p)=𝔽_p for all k | Sp_(p) is not 1-semiadditive | Check uses H𝔽_p; first draft used S_(p) via Segal, which needs completion care |
| Dimension p^(binom(n,k)) | (n,k)=(1,1),(2,1),(2,2),(n,0),(n,k>n),(0,k≥1) | p, p², p, p, 1, 1; wrong model p^(nk) gives p⁴ at (2,2) and >1 for k>n | Agrees with E_n^0(BC_p) of rank p^n and with zero reduced K(n)-homology for k>n | Check added |
| CSY 5.3.5 connectivity | n=1: BC_p→* (0-connected fiber) versus K(C_p,2)→* (1-connected) | K(1)^*(BC_p) rank p>1; K(1)_*(K(ℤ/p,2)) rank 1 | Hypothesis is sharp | Check added |
| Weak-ring criterion | H𝔽_p; Q_i (i≤n); Hℚ at n=0 | j=∞ term nonzero for H𝔽_p; K(j)⊗Q_i=0 for j>n; all three conditions hold for Hℚ | Consistent; j=∞ is needed | Checks moved from §6.3 and Hℚ completed |
| Sharp bound m=n+1 | n=1: K(ℤ/p,2) versus BC_p | T(1)-acyclic versus T(1)⊗Σ∞BC_p≠0 | n+1 cannot be lowered to n | Check |
| Sharp-bound route | Postnikov layers k≥n+1>i; K(A,k)→* fiber (k−1)-connected with k−1≥i | Height-i theorem applies | Holds | Route goes through §3.2(b), §6.2 and 5.3.5, not Q_i |
| val P(u_h)=p^(−h) | p=2,h=1; p=3,h=1; general | deg g = 2 and 6; val z = 1/2 and 1/6; ϕ(u)/u has val −1/2 and −1/3; ϕ(u₁) has val 1/2 and 1/3; in general 1−(pʰ−1)/pʰ=p^(−h) | Agrees with hahn line 366 and with the reviewer's p^(−h) | Check added |
| Independence of generator | u′=wu with w a unit | P(w)P(w⁻¹)=P(1)=1, so P(w) is a unit of valuation 0 | Valuation unchanged; the H∞ choice fixes the formula only | Check added; wrong model ϕ(u)=u gives val 1, so descent stalls |
| Coefficient extraction | h=1, p=2 | Rank p²−p=2: a₀+a₁z | Consistent with Prop. 4.3 | Uses relative zero detection at k=h−1 for h≥2, Bockstein for h=1 |
| §6.1 naturality | t↦t/2 on I→I | {0,1}↦{0,1/2}, outside the 0-skeleton; homotopic rel 0 to the cellular constant map; E² map identity on H₀ | Filtered naturality fails for non-cellular maps; E²-onward naturality holds | API restricted to cellular base maps, extension added |
| §13.1 at R=S | X=*, trivial line | Mf=S; E5 refinement of the trivial diagram is S | Comparison consistent | API bullet added |
