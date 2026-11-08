# Review of EquivariantIntersectionTheory (pull request #1685 at 493bc96)

**Verdict:** needs changes

This is an incremental re-review of the 31 lines of `TauCetiRoadmap/EquivariantIntersectionTheory/README.md`
changed since `f62b21a`: the affine-bundle clause of 2.2 and the `B/T` tower of 2.3. `Suggested.lean`
is byte-identical to the file reviewed at `1650b0a`. The previous finding is repaired, and the
mathematics of both changed passages is right. Two P3 findings remain: the gate now fails on one
scanner (a name on the project's dropped-names list, in untouched text), and the 2.2 repair cites a
work that the README's references and the manifest do not record. Nothing is blocking.

## R01 (P3) — The gate fails: `dropped=1` at line 598 (a name on the project's dropped-names list)

Location: `README.md` line 598, "No roadmap on main cites this one. GroupSchemesOverABase 6.1 cites
1.1 as the owner of `G`-linearised invertible sheaves and `Pic^G`".

Claim: the sentence records a downstream consumer. The gate's `dropped` rule forbids any mention of
a name on the project's dropped-names list, and that roadmap is on it (it is also among the roadmaps
this brief says are never cited). The gate reports `FAIL` on this line alone; every other scanner,
the dependency check and the build are `0`.

Witness: the gate at `493bc96` with the build and the candidate merge order:

```
gate EquivariantIntersectionTheory: … dropped=1 … build=0 FAIL
  dropped: line 598: No roadmap on main cites this one. GroupSchemesOverABase 6.1 cites 1.1 as the owner of
```

Repair: delete the second sentence of `## Downstream consumers` (lines 598–600 from
"GroupSchemesOverABase 6.1" to "on `G/B⁻`."), leaving "No roadmap on main cites this one." The
ownership of `Pic^G` by 1.1 is already stated in `## Scope and ownership` and needs no consumer to
hold. Tested: with that sentence removed the folder mentions no name of the list (grep of the
fifteen names against the README and the Lean file finds nothing else).

## R02 (P3) — 2.2 cites "Fulton 1998, Theorem 3.3 (a)", a work the References and the manifest do not record

Location: `README.md` line 420, "This is the argument of Fulton 1998, Theorem 3.3 (a), for the
projective completion `ℙ(V ⊕ 1)`, run on a nonsplit extension."

Claim: the citation is to Fulton, *Intersection Theory*. The `## References` list (lines 602–628)
has no entry for it (the only Fulton there is Fulton–Olsson 2010), and the roadmap's `sources.toml`
has no key for it. The argument itself is right (see the table), so only the record is missing.

Witness: `grep -n Fulton README.md` gives lines 420, 517, 529 and 623; line 623 is Fulton–Olsson.
The manifest keys are `eg1998`, `brion2015`, `fo2010`, `totaro1999`, `hua2026`, `kklv1989`,
`mfk1994`.

Repair: add to `## References` the bullet "W. Fulton, *Intersection Theory*, 2nd ed., Ergeb. Math.
Grenzgeb. (3) 2, Springer (1998), Theorem 3.3 (a) and Appendix B.5", and record it in
`sources.toml` under a new key (`fulton1998`, `locator_scheme = "theorem"`, `locator = "Theorem
3.3 (a)"`, `cited_for = "2.2"`) as `uncertified`, since the Springer text is paywalled. Optionally
add at line 420 the open-access form of the same argument, "Stacks, Lemma 42.36.3 (02TY)", which
runs it for the split extension `V ⊕ O`. Tested: SchemeAndStackFoundations cites the same work under
the same name and locator (its README line 7417), so the name "Fulton 1998" is the house form.

## Previous findings

- R01 — repaired: lines 413–421 now read "Homotopy invariance for vector bundles is
  `chow_affine_bundle` of SchemeAndStackFoundations §5.2, which covers total spaces of locally free
  sheaves only. For a torsor `E` under `V`, let `0 → V → Ṽ → O → 0` be the extension it defines
  … `E = ℙ(Ṽ) ∖ ℙ(V)` … the localisation sequence (§5.2) … and the projective bundle formula
  (§5.4) … show that `p^* : A_k(X) → A_{k+r}(E)` is an isomorphism". 2.3 (lines 443–449) now says
  the bundle with fibre `B/T` is a tower of torsors under line bundles. The repair's new citation
  of Fulton 1998 is R02.

## Verified sound

**Gate, build, direction, folder.**

- Gate at `493bc96` with `--build` and the candidate merge order: every scanner `0` except
  `dropped=1` (R01); `depcheck=0`, `build=0`, verdict `FAIL` on that one line.
- Dependency check, with `--movable` against the candidate order (this roadmap at line 398):

```
depcheck: 245 roadmaps, 2467 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`,
  `Suggested.lean` and `metadata.toml` only.

**Elaboration.**

- `lake env lean` on `TauCetiRoadmap/EquivariantIntersectionTheory/Suggested.lean` at the pins
  (10.5 s) gives nine `declaration uses sorry` warnings (lines 64, 71, 78, 86, 101, 113, 121, 149,
  155), no error and no other warning.
- `git diff 1650b0a HEAD -- Suggested.lean` is empty, so the fifteen `#check @` types, the
  binder audit, the padding audit and the one-tactic probe of the review of `1650b0a` stand; the
  worker's `signatures.md` for this head lists the same fifteen types with no lost binder
  (`homogeneousUnitDegrees_away_prime` keeps `hf` and `Prime f`; `depressedDiscr_mem` keeps
  `2 ≤ m`; `depressedDiscr_prime` keeps `[CharZero K]` and `2 ≤ m`).

**The 2.2 affine-bundle argument, checked step by step.**

- Extension and complement: for a torsor `E` under `V`, the class in `H¹(X, V) = Ext¹(O, V)` gives
  `0 → V → Ṽ → O → 0` with `E` the preimage of `1`; in the bundle of lines, a line of `Ṽ_x` either
  lies in `V_x` or contains exactly one vector over `1`, so `ℙ(Ṽ) ∖ ℙ(V) = E`.
- `[ℙ(V)] = c₁(O(1)) ∩ [ℙ(Ṽ)]`: the composite `O(−1) ⊆ q^*Ṽ → O` is a section of `O(1)` whose zero
  locus is exactly the lines in `V`, and SchemeAndStackFoundations §5.3 `eq_cartier_divisor` (main,
  README line 6711) turns an effective Cartier divisor into `c₁(O(D)) ∩ [·]`.
- The quotient: `A_{k+r}(ℙ(Ṽ)) = ⊕_{i=0}^{r} h^i ∩ q^*A_{k+i}(X)` by §5.4 `chow_basis`, and the
  pushforward of `A_{k+r}(ℙ(V)) = ⊕_{i=0}^{r−1} h^i ∩ q_V^*A_{k+1+i}(X)` is the span of the
  summands `i = 1, …, r`; the cokernel is the `i = 0` summand `q^*A_k(X)`, whose restriction to
  `E` is `p^*`. So `p^*` is an isomorphism with the shift `r = rank V`, as stated.
- The same argument, for the split extension `V ⊕ O`, is the Stacks project's proof of Lemma
  42.36.3 (02TY) (cache `28aaf3c7` lines 3445–3466: `P = ℙ(E ⊕ O)`, `D = Z(s)`, `O(D) = O(1)`,
  localisation and the projective bundle formula), and SchemeAndStackFoundations §5.2 describes
  its own injectivity route in the same words (main, lines 6683–6686). The README's description of
  Fulton's argument is therefore accurate; only its record is R02.
- Equivariance: `Ṽ^∨` is the sheaf of fibrewise affine functions on `E`, so an equivariant torsor
  gives an equivariant extension, and on the mixed spaces `E ×^G U → X ×^G U` is the torsor under
  `V ×^G U` with extension `Ṽ ×^G U`; `ℙ(Ṽ ×^G U)` is a projective bundle over the mixed space of
  `X`, so §§5.2 and 5.4 apply to it directly.

**Supplier sections, resolved.**

- SchemeAndStackFoundations §5.2 on main (`3b3f7ef`, README lines 6653–6700) owns
  `localization_exact` and `chow_affine_bundle`, the latter for total spaces of finite locally free
  sheaves of constant rank only, as the README now says. §5.4 (lines 6721–6767) owns `chow_basis`
  in the lines convention `ℙ(E) = relativeProj (Sym E^∨)` (lines 6561–6565), the convention the
  README's "projective bundles of lines" matches.
- The same two sections, under the same numbers and with the same `chow_affine_bundle` and
  `chow_basis` names, are at the heads of all five open SchemeAndStackFoundations revisions
  (`#1276` lines 6662/6686/6726/6732; `#1656` 7055/7082/7123/7129; `#1807` 6727/6754/6795/6801;
  `#1808` 6940/6967/7008/7014; `#1854` 6727/6754/6795/6801). No cited id is dropped.
- The supplier contract (README lines 106–108) already lists §§5.2–5.6 with the projective bundle
  formula, and the `*Needs:*` line of 2.2 lists §§5.2–5.6; 2.3's `*Needs:*` lists 2.2 and §5.4.
  No new supplier and no new object is introduced.

**The 2.3 tower, computed.**

- `GL₂`: `B` upper triangular, `R = {(1 x; 0 1)} ≅ 𝔾_a`, `N = 1`, chain `R ⊇ 1`. `b = (a b; 0 d)`
  acts on `B/T ≅ 𝔾_a` by `x ↦ (a x + b)/d`: an affine map with linear part the root `a/d`. So
  `U/T → U/B` is a torsor under the line bundle of that root, as stated, and not the total space
  of a line bundle (the previous review's witness `(ℙ¹ × ℙ¹) ∖ Δ → ℙ¹` is the `l = 2` truncation).
- `GL₃`: `N = 3`; the chain `R ⊇ U₁₂U₁₃ ⊇ U₁₃ ⊇ 1` has each term normal in `R`
  (`[U₂₃, U₁₂] ⊆ U₁₃`) and successive quotients `U₂₃`, `U₁₂`, `U₁₃`, each `≅ 𝔾_a` and central in
  the corresponding quotient of `R`, with characters the roots `α₂₃`, `α₁₂`, `α₁₃`.
- `n = 1`: `N = 0`, `B = T`, no step; `A^*_B = A^*_T` trivially.
- The fibre of `U/(T R_{m+1}) → U/(T R_m)` is `T R_m / T R_{m+1} ≅ R_m/R_{m+1} ≅ 𝔾_a` with `T R_m`
  acting by `x ↦ χ(t) x + c`; this is what makes each step a torsor under the line bundle of `χ`.
  (`T R_{m+1}` is not normal in `T R_m`, which is why the step is an affine and not a group-scheme
  torsor; the README does not claim otherwise.)

**Ownership and overlaps.** The diff adds no object and no ownership claim. `scratch/overlaps.md`
reports no other open pull request changing this roadmap, no cited id dropped or defined only by a
revision, and the five SchemeAndStackFoundations revisions as the closest roadmaps; they are
suppliers only, checked above. The resolver's three leads (`GroupSpace.ofGroupScheme`,
`StableCurves.Mbar`, `actionQuotient.torsorEquiv`, README lines 101–105) are README targets of
SchemeAndStackFoundations, as in the previous reviews; the diff does not touch them.

**Remark on untouched text (no change requested).** The parenthetical at lines 412–413 lists
invariant closed and open subschemes and equivariant vector bundles as inheriting Convention 5; the
new route also uses the equivariant projective bundle `ℙ(Ṽ)`, which inherits it as well (projective
over `X`, with `O(1)` twisted by the pullback of the linearised ample sheaf).

**Adversarial table.** The rows for changed statements carry computed values. The rows for
untouched statements carry forward the review of `f62b21a` ("r8") and, through it, the reviews of
`03f0a93` and `1650b0a`.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 2.2, `E = ℙ(Ṽ) ∖ ℙ(V)` and `p^*` iso, nonsplit case | `X = ℙ¹`, `Ṽ = O(−1)²`, `V = O(−2)` (Euler sequence twisted by `O(−2)`), `E = (ℙ¹ × ℙ¹) ∖ Δ`, `r = 1` | `O(1) = O(1,1)`, `[Δ] = (1,1) = c₁(O(1)) ∩ [ℙ¹ × ℙ¹]`; `CH_1(E) = ℤ²/(1,1) = ℤ = CH_0(ℙ¹)`, `CH_0(E) = ℤ/ℤ = 0 = CH_{−1}(ℙ¹)`, `CH_2(E) = ℤ = CH_1(ℙ¹)` | isomorphism as stated | none |
| 2.2, same, split case | `E = V`, `Ṽ = V ⊕ O` | Stacks 02TY lines 3445–3466: `D = Z(s)`, `O(D) = O(1)`, same two inputs | agrees with the library route | R02 (record only) |
| 2.2, same, rank `0` | `V = 0` | `Ṽ = O`, `E = X`, `ℙ(V) = ∅`, `p^* = id` on `A_k` | degenerate case holds | none |
| 2.2, `[ℙ(V)] = c₁(O(1)) ∩ [ℙ(Ṽ)]` | `X = ℙ¹` as above | section `O(−1) → O` vanishes on `Δ` only; §5.3 `eq_cartier_divisor` | right | none |
| 2.3, `B/T` tower, `GL₂` | `b = (a b; 0 d)` on `B/T ≅ 𝔾_a` | `x ↦ (a x + b)/d`, linear part `a/d`; `N = 1` | torsor under the root line bundle | none |
| 2.3, `B/T` tower, `GL₃` | chain `R ⊇ U₁₂U₁₃ ⊇ U₁₃ ⊇ 1` | `[U₂₃, U₁₂] ⊆ U₁₃`; quotients `U₂₃, U₁₂, U₁₃`, `N = 3 = 3·2/2` | chain exists with the stated properties | none |
| 2.3, `N = n(n − 1)/2` | `n = 1, 2, 3, 4` | `0, 1, 3, 6 = dim R` | right | none |
| 2.3, `A^*_{GL_n}` from `A^*_T` | `n = 2` | `ℤ[t₁, t₂]` free of rank `2` over `ℤ[c₁, c₂]` (basis `1, t₁`) | faithfully flat, as in r8 | none |
| 2.2 locators (Propositions 1, 3, Definition-Proposition 2), 3.4 opening, scope paragraph, 0.4 Check, 2.2 Checks and every untouched statement | as in r8, r7 and r6 | as in r8 (eg1998 lines 215–229, 257–265, 399–402; `ℤ/6 → ℤ/12`, `d ↦ 2d`; `20`, `42`) and r6 (29 rows: `⊥`/`⊤`/`2ℤ` for 0.1, `(1+εt)(1−εt) = 1` for 0.2, `−4a₂³ − 27a₃²` for 0.5, `ℤ/2, ℤ/6, ℤ/12, ℤ/20` for 3.4) | unchanged by the diff | none |

**Counts.**

| What | Number |
| --- | --- |
| Changed passages reviewed | 2 |
| Lean declarations (file unchanged; types from `signatures.md` compared with the README) | 15 |
| `sorry` warnings | 9 |
| SchemeAndStackFoundations checks (main §§5.2, 5.3, 5.4; five revision heads) | 3 + 5 |
| Stacks passages read (02TX, 02TY) | 2 |
| eg1998 passages re-read (lines 390–396, 446–452) | 2 |
| New table rows / carried rows | 8 / 1 group |

## Not verifiable

- Fulton, *Intersection Theory* (1998), Theorem 3.3 (a) (README line 420): the Springer text is
  paywalled, and the sources cache holds no copy. The statement and its proof route are confirmed
  through the open Stacks project Lemma 42.36.3 (02TY) and through SchemeAndStackFoundations §5.2,
  which cites the same theorem for the same argument. It is to be recorded as `uncertified` (R02).
- The diff touches none of these, and none can be read legally: Mumford–Fogarty–Kirwan, Ch. 1
  §3 (1.1); Knop–Kraft–Luna–Vust 1989, Lemma 2.2 and Proposition 2.3 (1.3); Edidin–Graham,
  published numbering, Proposition 18 (2.4); Mumford 1965 (3.2).

## Source issues

- none
