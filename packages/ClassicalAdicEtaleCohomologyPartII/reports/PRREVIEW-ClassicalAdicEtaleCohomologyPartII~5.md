# Review of ClassicalAdicEtaleCohomologyPartII (pull request #1549 at 63e60e4)

**Verdict:** needs changes

Incremental re-review of the 47 lines changed since fadef01 (README: the EtaleCohomologyFoundations supplier paragraph on §F.4.5, §5.7 rewritten around a derived rationalization functor, the §5.9 proof route and Check, the Layer 5 Dependencies; `Suggested.lean`: the module-system header and two docstring bullets). One finding, the gate's `tex` rule, which fails on this head; the mathematics of the rewritten §5.7 and §5.9 and every new supplier citation were checked and hold.

## R01 (P3) — TeX-only subscripts outside code spans (gate `tex`, 7 hits)

**Location.** `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md:1117` ("a complex M of Ẑ_p-modules goes to Ẑ_p[1/p]⊗ᴸ_{Ẑ_p}M" and "−⊗ᴸ_{ℤ_p}ℚ_p from D(ℤ_p) to D(ℚ_p)"), `:1131` ("Z defines the rational trace on groups as t_{X,ℤ_p}[1/p]"), `:1138` ("H²ᵈ(X_C,ℤ_p(d))⊗_{ℤ_p}ℚ_p" and "the rational trace is t_{X,ℤ_p}⊗ℚ_p"), `:1141` ("write Ẑ_p[1/p]⊗ᴸ_{Ẑ_p}− as the sequential colimit"), `:1151` ("the non-quasi-compact space ⊔_{n∈ℕ}Spa C").

**Claim.** The push gate at 63e60e4 reports `tex=7 … FAIL` (`gate.md`): the rule forbids `_{…}` and the other TeX-only forms outside code spans and code blocks. All seven hits are in the prose the diff added to §5.7; the two fenced `text` blocks of §5.7 are fine. The same seven are the only hits in the file (recount after stripping code spans and fences: 7).

**Witness.** `gate.md` lines "## tex (7)" with the five line numbers; `README.md:1117` contains `⊗ᴸ_{Ẑ_p}M` with no surrounding backticks.

**Repair.** Put each formula in a code span (`` `Ẑ_p[1/p]⊗ᴸ_{Ẑ_p}M` ``, `` `−⊗ᴸ_{ℤ_p}ℚ_p` ``, `` `t_{X,ℤ_p}[1/p]` ``, `` `H²ᵈ(X_C,ℤ_p(d))⊗_{ℤ_p}ℚ_p` ``, `` `t_{X,ℤ_p}⊗ℚ_p` ``, `` `Ẑ_p[1/p]⊗ᴸ_{Ẑ_p}−` ``, `` `⊔_{n∈ℕ}Spa C` ``), or write the subscripts without braces in Unicode where the base allows it (`⊔ₙ Spa C`). No heading changes, so no internal link moves. Rerun the gate; every other scanner and the build already pass at this head.

## Previous findings

- R01 (r4: AdicSpacesPartV inputs stated as undeclared contracts) — repaired: unchanged since fadef01; `README.md:74–106` still cite the RZ targets and the two gaps carry their plan destinations; not touched by this diff.
- R02 (r4: `ModuleCat` carrier transparency) — repaired: unchanged since fadef01; `Suggested.lean:69–84` keep the type synonym, `Module.compHom` along `iterateFrobenius` and `monomialRootModule.of`; the scalar-action `rfl` witness still closes (below).

## Verified sound

**Gate, direction, outside-folder diff.** The worker's gate at 63e60e4 (`gate.md`) has every count 0 except `tex=7` (R01); `build=0`, `imports=0`, `statement-hygiene=0`, `readme-ids-missing=0`, `depcheck=0`. The dependency check rerun from the brief's command printed

```text
depcheck: 239 roadmaps, 2344 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. The head is a merge of origin/main (eaf17b10) into the branch: the three-dot diff `origin/main...HEAD` outside the roadmap folder is empty, and the long list of outside files in `changes.md` is the merged main, not the pull request's own change. The worktree is clean at 63e60e4fe64f9d5d4c2417faec44cb1a52c121f5. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only. Merge order: ArithmeticGaloisDuality 43, ClassicalAdicEtaleCohomology 53, PadicHodgeTheory 113, AdicSpacesPartV 213, this roadmap 214; EtaleCohomologyFoundations, EnhancedDerivedSheaves and DerivedModuleAlgebra are on main.

**New supplier citations resolved (every round, at the current text).**

| Citation in the diff | Where resolved | What it states; what the README assumes |
|---|---|---|
| EtaleCohomologyFoundations §F.4.5 (`README.md:190`, `:1117`, `:1156`, `:1195`) | main `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1041–1081` | rational lisse sheaves are modules over `ℚ_ℓ,X=ℤ_ℓ,X[1/ℓ]` on `X_proet` (line 1045); "rationalization gives an equivalence from the integral constructible category up to isogeny" is a theorem there (lines 1057–1058), which is the README's "Serre quotient … is a theorem, not the definition"; `RΓ(X,K_Qℓ)≅RΓ(X,K_Zℓ)⊗ᴸℚ_ℓ` with "flat scalar extension" (lines 1063–1069); finite `E/ℚ_ℓ` through `O_E` lattices (line 1068); Checks `ℤ_ℓ/ℓ ↦ 0`, `ℤ_ℓ ↦` a line (line 1072), the two the README repeats; standing hypothesis "Noetherian X with invertible ℓ" (line 1044), which the README correctly says is a hypothesis of the scheme statements, not of the functor |
| EnhancedDerivedSheaves §0.3 (`README.md:1117`, `:1156`) | main `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:455–459` | `⊗ᴸ_R` on a ringed site for commutative `R` by K-flat replacement; "derived tensor preserves colimits in either variable", the fact the §5.7 route uses to write `Ẑ_p[1/p]⊗ᴸ−` as a sequential colimit |
| EnhancedDerivedSheaves §0.4 (same lines) | main `…/EnhancedDerivedSheaves/README.md:492–503` | coherent derived coefficient-change transformations, "neither invertibility of coefficient orders nor Noetherian schemes" needed (line 496) |
| ClassicalAdicEtaleCohomology §1.3, `Ẑ_p` (`README.md:1117`, `:1156`) | open pull request #875 head (no folder on main), its README line 437 | `Ẑ_p = lim_r ν*ℤ/pʳ` on a locally noetherian analytic adic space over `Spa(ℚ_p,ℤ_p)`; line 446 of that README says "rationalization is absent", so the rational functor is not planned there |
| ClassicalAdicEtaleCohomology §§1.4, 9.5, 9.7 | #875 README lines 450 (twists `Ẑ_ℓ(1)=lim ν*μ_{ℓᵐ}`, line 578), 5011, 5234 (integral smooth proper trace `t_{f_η}` over a smooth proper formal model, lines 5292–5318, `c₁(O(1)) ↦ 1` at line 5312) | as the README's "geometric-fibre trace of §9.7" and "needs no model" contrast |
| Z Definition 5.5.3, the paragraph before Definition 5.5.5, Definition 5.5.5, Theorem 5.5.6 (`README.md:1114`, `:1131`, `:1174`) | `Z` lines 3964–3967, 3972–3975, 3976–3978, 3979–3987 (pp. 82–83; page markers at lines 3930, 3981) | `t_{X,ℤ_p} = lim_n t_{X,ℤ/pⁿ}`; `RΓ(X_C,ℚ_p)=RΓ(X_C,ℤ_p)[1/p]` for qcqs X from coherence of the pro-étale topos and commutation with filtered colimits; `t_{X,ℚ_p} := t_{X,ℤ_p}[1/p]` on `H²ᵈ`; the rational perfect pairing and its degreewise consequence, proof "from the isomorphism, Theorem 5.5.4 and ℚ_p a field". The README's locators, page numbers and its description of what Z defines versus proves are exact |

The worker's resolver reports no unresolved citation or Lean name; I found none.

**Ownership of the rationalization functor.** Searched the roadmap service (459 open pull requests at their heads, then main) for `rationaliz`, `Ẑ_p[1/p]`, `[1/p]`, `[1/ℓ]` and `RΓ(X_C,ℚ_p)`. The only rigid-analytic owner of a related object is HodgeTateAndCanonicalSubgroups §6.34 (#1084 head, README lines 2294–2302): `Q̂_p=Ẑ_p[1/p]` on the pro-Kummer-étale site of fs log adic spaces and `L̂⊗_{Ẑ_p}Q̂_p` for completed Kummer lisse systems (`CompletedKummerLisse.rationalization`), a lisse-sheaf operation on a different site, not a functor on complexes of `Ẑ_p`-modules on `X_proét`; ClassicalAdicEtaleCohomology plans no rational coefficients (its line 446); EtaleCohomologyFoundations §F.4.5 is the scheme version with ℓ invertible, which the README imports for the convention and does not restate. PadicHodgeTheory, DiamondEtaleCohomology and AdicCoefficientsAndComparisons have no rational pro-étale rationalization target in the grep. So §5.7 is the owner of the pro-étale derived rationalization on rigid spaces and of `ℚ_p(r)`, `RΓ(X_C,ℚ_p(r))` defined through it. Ownership against open pull requests whose files the brief does not list was checked only through that index. The board's `packages/WeilConjectures` holds reports only (no design README on this worker), so the commit message's "Weil-conjectures design" could not be read; nothing in the folder depends on it.

**Lean.** The worker-built module imported from a scratch file (`import TauCetiRoadmap.ClassicalAdicEtaleCohomologyPartII.Suggested`, `#check @name` for all eight declarations, `#print axioms`, elaborated with `lake env lean` from the worktree, exit 0): all eight are public under the new `module` / `public import Mathlib` / `@[expose] public section` header, their types equal `signatures.md` and README §3.7 (`p n m` explicit, `Fact (Nat.Prime p)` only on `monomialRootModuleModule` and `monomial_root_duality`), axioms `propext, sorryAx, Classical.choice, Quot.sound`. The scalar-action witness `a • x = of (a ^ (p ^ m) * of.symm x)` closes by `rfl` in the importer, so the `Module.compHom` action is still the README's `a^(p^m)·x`. One-tactic probe on a scratch copy with `sorry` replaced by `simp`: "`simp` made no progress" at line 103, so the headline is not padding. No section variables, so no binder can be lost; single `import Mathlib` (as `public import`), no `set_option`, no sorried data, `theorem` only; the olean is 118 KB. The gate's `build=0` and `imports=0` agree with the header memory for module-system pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` in `lake-manifest.json`). The docstring's new bullet for §5.7 names the missing carriers (completed pro-étale integral global sections and the derived rationalization), consistent with the previous rounds' finding that no rigid pro-étale site exists at the pins.

**Shape.** Unchanged sections; §5.7 keeps statement, API bullets (five), proof route, Checks (five, including the two new negative controls), `*Needs:*`; §5.9 keeps three Checks. The new §F.4.5 paragraph sits in the EtaleCohomologyFoundations supplier subsection. No process words, pull-request numbers, LaTeX delimiters or `lemma` (gate `latex=0`, `prnum=0`, `round-labels=0`).

**Seeded sample.** None of the fifteen seeded targets falls in the changed lines except 5.7, which is reopened above at Z lines 3964–3987; 0.3, 0.5, 1.1, 1.6, 2.2, 2.4, 2.6, 3.1, 3.3, 4.3, 5.6, 7.2, 7.6 and 7.7 lie outside the diff and were checked in the earlier full reviews (7.2 also at fadef01).

### Adversarial pass

Rows marked "previous report" carry the values computed at c1ef9e9 and fadef01 for statements this diff leaves untouched; the other rows are new.

| Statement | Instances tried | Values on one side | Values on the other side | Result; change |
|---|---|---|---|---|
| §5.7 rationalization functor on a point (`README.md:1117`) | M=ℤ_p/p; M=ℤ_p; M=ℚ_p/ℤ_p | `ℚ_p⊗ᴸℤ_p/p`: ℚ_p flat so Tor₁=0 and ℚ_p⊗ℤ_p/p=0; `ℚ_p⊗ℤ_p=ℚ_p`; `ℚ_p⊗ℚ_p/ℤ_p=0` (torsion) | wrong model "Serre quotient by objects killed by a power of p": agrees on the first two, but does not kill ℚ_p/ℤ_p (no power of p kills it); ECF F.4.5 Checks (line 1072) give the same first two values | the stated definition (derived scalar extension) excludes the wrong model; the README's "theorem, not definition" is the right relation; none |
| §5.7 comparison, quasi-compact case (`README.md:1121`) | X=Spa C, M=Ẑ_p; X=ℙ¹_C, M=Ẑ_p(1) | left: `ℤ_p⊗ℚ_p=ℚ_p` in degree 0; left: H⁰=ℚ_p, H²=ℚ_p | right: `RΓ(Spa C, colim_p Ẑ_p)=colim ℤ_p=ℚ_p`; right: pro-étale cohomology of ℚ_p(1) on ℙ¹_C is ℚ_p in degrees 0 and 2 | agree; none |
| §5.7 comparison, non-quasi-compact Check (`README.md:1151`) | X=⊔_{n∈ℕ}Spa C, M=Ẑ_p | left `(∏_n ℤ_p)⊗ℚ_p = {(a_n): ∃N, p^N a_n ∈ ℤ_p ∀n}` | right `∏_n ℚ_p ∋ (p^{−n})_n`, no common N | the Check is a true negative control for the qcqs hypothesis; none |
| §5.7 comparison, bounded-below hypothesis | M uniformly bounded below | Hⁱ of a coherent topos commutes with filtered colimits of sheaves (Z line 3974, Sch13a 3.12(vii)); for complexes bounded below uniformly, induction on truncations | an unbounded-below filtered system can fail (cohomology of the total complex need not commute); the README states "bounded-below" | hypothesis necessary and present; none |
| §5.7 degreewise formula (`README.md:1138`) | ℙ¹_C, d=1; X with torsion in H²ᵈ⁻¹ | `H²(RΓ(ℤ_p(1))⊗ᴸℚ_p)=H²(RΓ(ℤ_p(1)))⊗ℚ_p=ℚ_p·c₁`, trace c₁↦1 so `t⊗ℚ_p(c₁)=1` | Z Definition 5.5.5 line 3978: `t_{X,ℚ_p}=t_{X,ℤ_p}[1/p]` on `H²ᵈ(X_C,ℤ_p(d))[1/p]`; torsion contributes 0 to both sides after ⊗ℚ_p (flatness: no Tor shift of torsion into degree 2d) | README's theorem equals Z's definition; none |
| §5.7 "never level by level" Check (`README.md:1150`) | n=1,2; ℙ¹ | `ℤ/pⁿ⊗ℚ_p=0`, limit of zero maps is 0 | rational trace on ℙ¹ sends c₁ to 1≠0 | order of operations fixed correctly; none |
| §5.7 hypotheses of the integral trace | X smooth proper pure-d; X=Spa C (d=0) | proper ⇒ qcqs, so the comparison applies at M=Ẑ_p(d); d=0: `H⁰(Spa C,ℤ_p)=ℤ_p`, t=id, rationalization id | Z Definition 5.5.3 line 3966: same hypotheses | agree; none |
| §5.7 `*Needs:*` and Layer 5 Dependencies (`README.md:1156`, `:1195`) | each cited section | CAEC §1.3 (#875 line 437), §§1.1–1.4, 9.5, 9.7; ECF §F.4.5 (main line 1041); EDS §§0.3–0.4 (main lines 455, 492); PHT §2.7; AGD §§D7, R02 (previous report) | depcheck 0 problems; all suppliers earlier in the order or on main | agree; none |
| §5.9 route via rationalization (`README.md:1176`) | ℙ¹_C; two points, d=0; ℤ_p/p | rationalize the perfect adjoint `RΓ(ℤ_p)→RHom(RΓ(ℤ_p(d)),ℤ_p[−2d])`: perfectness of `RΓ(ℤ_p(d))` (§5.8, Z Lemma 5.5.1 at line 3961) gives `RHom(P,ℤ_p)⊗ℚ_p=RHom_{ℚ_p}(P⊗ℚ_p,ℚ_p)`; matrix (1) on ℙ¹; diag(1,1) on two points | Z Theorem 5.5.6 proof line 3986: "from the isomorphism, Theorem 5.5.4 and ℚ_p a field"; ℤ_p/p ↦ 0 | agree; none |
| ECF §F.4.5 paragraph (`README.md:190`) | the four assertions | ℚ_ℓ,X=ℤ_ℓ,X[1/ℓ] modules (main line 1045); up-to-isogeny equivalence a theorem (1057–1058); ℓ invertible standing (1044); `ℤ_ℓ/ℓ↦0`, `ℤ_ℓ↦` line (1072) | README: derived scalar extension along the coefficient map; Serre-quotient description a theorem; ℓ=p allowed for the functor; the same two Checks | agree; none |
| Suggested.lean header and visibility | importer `#check` ×8, `#print axioms` | all eight public; axioms `[propext, sorryAx, Classical.choice, Quot.sound]` | the plain-`module` failure mode (declarations private) would print "unknown identifier" | agree; none |
| §3.7 scalar action, adjoint through `of`, Ext clause | previous report + rerun `rfl` and `simp` probe | `a • x = of (a^(p^m) * of.symm x)` by `rfl`; `simp` no progress | README `:779`: a^(p^m)·x; not padding | agree; none |
| RZ.0–RZ.5 citations, gap destinations, branched-cover route | previous report (fadef01) | design lines 33, 92, 149, 183, 260, 395, 517, 587, 640, 1082, 1157, 1233, 1261, 1468, 1502; plan lines 4359, 4365 | README `:74–122` | unchanged; none |
| Conventions; Layers 0–4; §§5.1–5.6, 5.8; Layer 7; contracts | previous report (c1ef9e9) | values as tabulated there (ℙ¹ trace 1; O_C/p vs O_C/𝔪; H¹=O_C/(ζ_{pᵐ}−1); diag(1,1); nodal curve H²=Λ(−1); S_f=D∖{a}; …) | as tabulated there | unchanged by this diff; none |

## Not verifiable

- H, Heuer, *A p-adic Simpson correspondence for smooth proper rigid varieties*, Proposition 2.18: settled as uncertified; §7.7 is cited by locator only and lies outside this diff.
- The "Weil-conjectures design" named in the commit message is not on this worker's board (`packages/WeilConjectures` has reports only); the review judged §5.7 on its own text and its suppliers.

## Source issues

- none
